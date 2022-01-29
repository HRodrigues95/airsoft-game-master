require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { build(:team) }

  describe 'validations' do
    it 'with  name' do
      expect(subject).to be_valid
    end

    it 'without name' do
      subject.name = ''

      expect(subject).to be_invalid
    end
  end
end
