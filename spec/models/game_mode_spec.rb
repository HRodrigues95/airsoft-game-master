require 'rails_helper'

RSpec.describe GameMode, type: :model do
  subject { build(:game_mode) }

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
