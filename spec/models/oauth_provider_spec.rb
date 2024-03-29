require 'rails_helper'

RSpec.describe OauthProvider, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
  end
end
