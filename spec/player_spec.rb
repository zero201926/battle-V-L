require 'player'
describe Player do
  subject(:vikash) { Player.new('Vikash') }
  subject(:luke) { Player.new('Luke') }

  context '#name'do
    it 'returns a players name' do
      # expect(subject.name).to be_a(String)
      expect(vikash.name).to eq('Vikash')
    end
  end

  context '#hit_points' do
    it 'returns hit points' do
      expect(vikash.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  context '#attack' do
    it 'damages the player' do
      expect(luke).to receive(:receive_damage)
      vikash.attack(luke)
    end
  end

  context '#receive_damage' do
    it 'reduce the player hit points' do
      expect { vikash.receive_damage }.to change { vikash.hit_points }.by(-10)
    end
  end
end
