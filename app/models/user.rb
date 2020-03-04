class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :multi_purpose_loans
  has_many :educational_loans
  has_many :business_loans

  has_one :address
end