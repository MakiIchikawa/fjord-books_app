# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]

  def create
    current_user.active_relationships.create!(followee_id: @user.id)
    redirect_to @user, notice: t('controllers.relationship.notice_follow')
  end

  def destroy
    current_user.active_relationships.find_by(followee_id: @user.id).destroy
    redirect_to @user, notice: t('controllers.relationship.notice_unfollow')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
