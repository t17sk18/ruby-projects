require 'rails_helper'

RSpec.feature 'products', type: :feature do
  scenario 'Home page renders' do
    visit '/'
    expect(page).to have_text('Home') #if @request is empty no numbers will be on the page
  end
end