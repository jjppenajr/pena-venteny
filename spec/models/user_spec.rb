require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it { should have_one(:address) }
  end
end
