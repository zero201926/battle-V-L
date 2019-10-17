require 'player'
require 'game'
describe Player do

  subject(:vikash) { Player.new('Vikash') }
  subject(:luke) { Player.new('Luke') }
  subject(:game) { Game.new(vikash, luke) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  context ' #name'do
    it 'returns a players name' do
      # expect(subject.name).to be_a(String)
      expect(vikash.name).to eq('Vikash')
    end
  end

  context ' #hit_points' do
    it 'returns hit points' do
      expect(vikash.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  context '#receive_damage' do
    it 'reduce the player hit points' do
      expect { vikash.receive_damage }.to change { vikash.hit_points }.by(-10)#from(60).to(50)#
    end
  end

  # context ' #receive_damage' do
  #   it 'reduce the player hit points' do
  #     expect(luke).to receive(:receive_damage)
  #     game.attack(luke)
  #     expect { game.receive_damage }.to change { luke.hit_points }.by(-10)#from(60).to(50)#
  #   end
  # end
end
