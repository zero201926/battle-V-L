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
################################################################
  scenario 'player 2 attacks player 1' do
    sign_in_and_play
    attack_and_confirm
    click_button "Attack"
    expect(page).to have_content 'Luke attacks Vikash.'
  end

  scenario 'player 2 attacks player 1 by 10' do
    sign_in_and_play
    attack_and_confirm
    click_button "Attack"
    # expect(page).not_to have_content 'Vikash: 60HP'
    expect(page).to have_content 'Vikash: 50HP'
  end
end
