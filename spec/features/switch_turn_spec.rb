require './lib/app.rb'
feature 'switch turns in game' do
  scenario 'at start of the game' do
    sign_in_and_play
    expect(page).to have_content "Vikash's turn"
  end

    # scenario 'aftert player 1 attacks' do
    #   sign_in_and_play
    #   click_button "Attack"
    #   click_button 'OK'
    #   expect(page).not_to have_content "Vikash's turn"
    #   expect(page).to have_content "Luke's turn"
    # end
end
