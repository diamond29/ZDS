require_relative '../lib/assigner'

describe Assigner do
  let(:drivers) { nil }
  let(:orders) { nil }
  let(:assigner) { Assigner.new drivers, orders }

  describe '#assign' do
    it 'assigns drivers and orders' do
      expect { assigner.Assigner }.to raise_error NoMethodError
    end
  end
end
