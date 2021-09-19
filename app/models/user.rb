class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :icon

  acts_as_favoritor

  validates :username, presence: true, uniqueness: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  

  before_validation :add_default_icon, on: :create
  after_create :send_registration_email

  private

  def send_registration_email
    UserConfirmationMailer.with(user: self).user_registration_email.deliver_later
  end

  def add_default_icon
    default_icon = Icon.find_by(name: 'default_icon')
    self.icon = default_icon
  end
end
