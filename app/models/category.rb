class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories
  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 25 }
  validates_uniqueness_of :name
end
