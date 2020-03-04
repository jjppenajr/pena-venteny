class UserLoan < ApplicationRecord
  attr_readonly :address

  belongs_to :loan, polymorphic: true
  belongs_to :user

  before_create :save_address

private
  def save_address
    address = user.address.name
  end
end
