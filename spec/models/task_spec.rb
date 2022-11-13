require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context "validates" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :user_id }
  end


  describe 'factory task' do
    let(:task) { build(:task) }

    context 'successfully' do
      it { expect(task).to be_valid }
    end

    context 'failure' do
      let(:task) { build(:task, title: nil) }
      it { expect(task).not_to be_valid }
    end
  end
end
