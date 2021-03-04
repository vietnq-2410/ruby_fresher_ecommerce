class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :orders, dependent: :destroy
  enum role: {user: 0, admin: 1}
  attr_accessor :remember_token, :activation_token, :reset_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save :downcase_email

  validates :name, presence: true
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true

  scope :sort_desc, ->{order(created_at: :desc)}

  private

  def downcase_email
    email.downcase!
  end
end
