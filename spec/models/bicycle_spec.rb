require "rails_helper"

RSpec.describe Bicycle, type: :model do
  describe 'attached image' do
    subject { FactoryBot.create(:bicycle).image }
    it {
      is_expected.to be_an_instance_of(ActiveStorage::Attached::One) 
    }
  end

  describe 'filtered bikes' do
    context 'found bike' do
      let!(:bicycle) { FactoryBot.create(:bicycle, model: 'BMW mountain heights B7', style: 'off-road', price: 101) }

      it { expect(described_class.filter('height', 'off-road', '50', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '50', '')[0]).to eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '', '')[0]).to eq(bicycle) }
      it { expect(described_class.filter('', 'off-road', '50', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('', 'all', '50', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('', 'all', '', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('height', 'all', '50', '110')[0]).to eq(bicycle) }
      it { expect(described_class.filter('', 'off-road', '50', '110')[0]).to eq(bicycle) }
    end

    context 'bike not found' do
      let!(:bicycle) { FactoryBot.create(:bicycle, model: 'BMW mountain heights B7', style: 'off-road', price: 101) }

      it { expect(described_class.filter('volex', 'off-road', '50', '110')[0]).to_not eq(bicycle) }
      it { expect(described_class.filter('height', 'electric-bike', '50', '110')[0]).to_not eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '30', '99')[0]).to_not eq(bicycle) }
      it { expect(described_class.filter('height', 'off-road', '110', '170')[0]).to_not eq(bicycle) }
    end
  end
end
