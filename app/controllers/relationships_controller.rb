# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  # POST /books
  # POST /books.json
  def create
    respond_to do |format|
      if current_user.active_relationships.create!(followed_id: @user.id)
        format.html { redirect_to @user, notice: t('controllers.relationship.notice_follow') }
      else
        format.html { redirect_to @user }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    current_user.active_relationships.find_by(followed_id: @user.id).destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: t('controllers.relationship.notice_unfollow') }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
