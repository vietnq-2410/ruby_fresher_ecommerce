class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save :downcase_email
  before_create :create_activation_digest

  validates :name, presence: true
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create string, cost: cost
  end

  has_secure_password

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def downcase_email
    email.downcase!
  end
end
