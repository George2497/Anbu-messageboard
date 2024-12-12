class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :title, presence: true, uniqueness: true, length: { minimum: 6, maximum: 25 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 6, maximum: 250 }
end
