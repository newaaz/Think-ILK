require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'associations' do
    it { should belong_to(:owner) }
    it { should belong_to(:category) } 
    it { should belong_to(:town) } 
  end
  
  describe 'validations' do
    it { should validate_presence_of :title }
  end
end