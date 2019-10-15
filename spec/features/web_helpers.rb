def sign_in_and_play
  visit('/')
  fill_in :player_one, with: 'Vikash'
  fill_in :player_two, with: 'Luke'
  click_button 'Submit'
end
