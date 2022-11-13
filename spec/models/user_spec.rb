require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  describe 'factory user' do
    let(:user) { build(:user) }

    context 'successfully' do
      it { expect(user).to be_valid }
    end

    context 'failure' do
      let(:user) { build(:user, email: nil) }
      it { expect(user).not_to be_valid }
    end
  end
end
