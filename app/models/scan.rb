class Scan < ActiveRecord::Base
  validate :content, presence: true
end
