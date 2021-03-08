# frozen_string_literal: true

require 'application_system_test_case'

class GithubLoginTest < ApplicationSystemTestCase
  setup do
    @user = FactoryBot.create(:bob)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, uid: @user.uid, email: @user.email)
  end

  test 'GitHubでログイン' do
    visit root_url
    click_on 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'
  end
end
