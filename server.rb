require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

configure :development, :test do
  require "pry"
end

configure do
  set :views, "app/views"
end

Dir[File.join(File.dirname(__FILE__), "app", "**", "*.rb")].each do |file|
  require file
  also_reload file
end

get "/" do
  redirect to("scans")
end

get "/scans" do
  @scans = Scan.order(created_at: :desc).limit(40)
  haml :"scans/index"
end
