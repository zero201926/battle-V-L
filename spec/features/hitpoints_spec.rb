require './lib/app.rb'
#score2 = Battle::player2_score
feature 'displays player hitpoitns' do
  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Luke: 60HP'
  end
  scenario 'see Player 1 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Vikash: 60HP'
  end
end
