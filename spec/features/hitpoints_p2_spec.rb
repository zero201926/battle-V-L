require './lib/app.rb'
#score2 = Battle::player2_score
feature 'displays player 2 hitpoitns' do
  scenario 'see Player 2 hit points' do
   sign_in_and_play
  expect(page).to have_content 'Luke: 60HP'
end
end
