class Feed < ApplicationRecord
  has_many :news
  validates :url, uniqueness: true
end
