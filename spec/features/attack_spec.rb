feature 'Attacking a player' do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    # click_link "Attack"
    click_button "Attack"
    expect(page).to have_content 'Vikash attacks Luke.'
  end

  scenario 'player 1 attacks player 2 by 10' do
    sign_in_and_play
    click_button "Attack"
    expect(page).not_to have_content 'Luke: 60HP'
    expect(page).to have_content 'Luke: 50HP'
  end
end
