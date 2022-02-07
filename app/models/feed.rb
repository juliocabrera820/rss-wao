class Feed < ApplicationRecord
  has_many :news, dependent: :destroy
  belongs_to :category

  validates :url, uniqueness: true
end
