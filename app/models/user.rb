class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  acts_as_favoritor

  validates :username, presence: true, uniqueness: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true

  after_create :send_registration_email

  private

  def send_registration_email
    UserConfirmationMailer.with(user: self).user_registration_email.deliver_later
  end
end
