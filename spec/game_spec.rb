require 'game'
require 'player'
describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:finished_game) { described_class.new(dead_player, player_2) }
  let(:player_1) { double :player, hit_points: 60 }
  let(:player_2) { double :player, hit_points: 60 }
  let(:dead_player) { double :player, hit_points: 0 }
  context '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  context '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  context '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  context '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

  context '#opponent_of' do
     it 'finds the opponent of a player' do
       expect(game.opponent_of(player_1)).to eq player_2
       expect(game.opponent_of(player_2)).to eq player_1
     end
   end
   context '#game_over?' do
    it 'returns false if no-one is at 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  context '#loser' do
    it 'returns a player on less than 0HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end
