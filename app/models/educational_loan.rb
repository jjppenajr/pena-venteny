class EducationalLoan < ApplicationRecord
  belongs_to :user
  has_one :user_address, through: :user, source: :address

  validates :address, presence: true

  before_create :save_address

private
  def save_address
    address = save_address.name
  end
end