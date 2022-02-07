class Category < ApplicationRecord
  has_many :feeds
  validates :name, uniqueness: { case_sensitive: true }
end
