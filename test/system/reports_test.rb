# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @user = users(:alice)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    @report = reports(:one)
  end

  test '日報の新規作成' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: '今日の天気'
    fill_in '内容', with: '晴れ'
    click_on '登録する'
    assert_text '日報が作成されました。'
    assert_text '今日の天気'
    assert_text '晴れ'
    assert_text 'alice'
  end

  test '日報の編集' do
    visit reports_url
    click_on '編集'

    fill_in '内容', with: '最高最高'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '今日の気分'
    assert_text '最高最高'
    assert_text 'alice'
  end

  test '日報の削除' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
