# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(_resource)
    flash[:notice] = if current_user
                       'ログインに成功しました'
                     else
                       '新規登録完了しました'
                     end
    books_path
  end

  def after_sign_out_path_for(_resource)
    flash[:notice] = 'ログアウトしました'
    new_user_session_path
  end
end
