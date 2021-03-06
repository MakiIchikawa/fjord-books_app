# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @viewer = User.create!(email: 'viewer@example.com', password: 'password')
    @writer = User.create!(email: 'writer@example.com', password: 'password')
    @report = @writer.reports.new(title: 'hoge', content: 'hogehoge')
  end

  test 'editable?メソッドの検証' do
    assert @report.editable?(@writer)
    assert_not @report.editable?(@viewer)
  end

  test 'created_onメソッドの検証' do
    @report.save!
    assert_equal Time.zone.today, @report.created_on
  end
end
