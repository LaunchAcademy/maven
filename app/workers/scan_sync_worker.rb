require "sidekiq"
require "sidetiq"
require "httparty"
require 'sinatra/activerecord'
require_relative "../models/scan"

class ScanSyncWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(1) }

  def perform
    puts "Got here"
    scans = Scan.where(synced_at: nil)
    scans.each do |scan|
      response = HTTParty.post("https://launchpass.launchacademy.com/attendance?scan=#{scan.content}")
      if response.success?
        scan.update_attributes(synced_at: Time.now)
      end
    end
  end
end
