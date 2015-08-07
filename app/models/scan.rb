class Scan < ActiveRecord::Base
  validates :content, presence: true
end
