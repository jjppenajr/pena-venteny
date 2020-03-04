class Address < ApplicationRecord
  belongs_to :user

  has_many :loan_addresses, foreign_key: :main_address_id, class_name: "Address"
  belongs_to :main_address, class_name: "Address", optional: true
  belongs_to :loan, optional: true
  validates :name, presence: true
end
