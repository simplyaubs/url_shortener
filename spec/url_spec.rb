require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'url shortener' do

  scenario 'shortening url' do

    visit ('/')
    expect(page).to have_title "URL Shortener"
    fill_in 'input_url', with: 'http://tutorials.gschool.it/http_with_sinatra_spike'
    click_on("Shorten")
    expect(page).to have_content "http://tutorials.gschool.it/http_with_sinatra_spike"
    expect(page).to have_content "http://staging-url-shortener.herokuapp.com/1"
    click_link('"Shorten" another URL')
    expect(page).to have_content "http://staging-url-shortener.herokuapp.com/2"
  end
end