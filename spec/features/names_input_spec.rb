feature 'Entering player names' do
  scenario 'Can run app and enter 2 names for players' do
    visit('/')
    fill_in :player_one, with: 'Vikash'
    fill_in :player_two, with: 'Luke'
    click_button 'Submit'
    expect(page).to have_content 'Vikash vs. Luke'
  end
end
