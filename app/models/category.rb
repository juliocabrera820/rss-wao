class Category < ApplicationRecord
  has_many :news
  validates :name, uniqueness: { case_sensitive: true }
end
