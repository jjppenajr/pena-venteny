require 'rails_helper'

RSpec.describe MultiPurposeLoan, type: :model do
  context 'Validations' do
    it { should belong_to(:user) }
    it { should have_one(:user_address).through(:user).source(:address) }
  end
end
