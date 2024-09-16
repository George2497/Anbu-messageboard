class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 10, maximum: 105}, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6, maximum: 25}
  # has_secure_password
end
