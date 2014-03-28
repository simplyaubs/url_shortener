require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'url shortener' do

  scenario 'shortening url' do

    visit ('/')
    expect(page).to have_title "URL Shortener"
    click_on("Shorten")
  end
end