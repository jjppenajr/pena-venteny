class EducationalLoan < ApplicationRecord
  attr_readonly :address

  belongs_to :user
  has_one :user_address, through: :user, source: :address
  has_one :address

  before_create :check_entry
  before_create :save_address

private
  def check_entry
    if entry < 5000
      errors.add :base, "Loan amount cannot be less than 5000"
      throw(:abort)
    elsif entry > 120000
      errors.add :base, "Loan exceeded. Loan amount cannot more than 120000"
      throw(:abort)
    elsif entry % 1000 != 0
      errors.add :base, "Loan entry must be divisible by 1000."
      throw(:abort)
    end
  end

  def save_address
    address = address.build(main_address_id: user_address.id, name: user_address.name )
    address.save
  end
end