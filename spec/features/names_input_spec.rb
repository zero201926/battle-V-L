feature 'Entering player names' do
  scenario 'Can run app and enter 2 names for players' do
    sign_in_and_play
    expect(page).to have_content 'Vikash vs. Luke'
  end
end
