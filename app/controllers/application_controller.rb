# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(_resource)
    if current_user
      flash[:notice] = 'ログインに成功しました'
      books_path
    else
      flash[:notice] = '新規登録完了しました'
      books_path
    end
  end

  def after_sign_out_path_for(_resource)
    flash[:notice] = 'ログアウトしました'
    new_user_session_path
  end
end
