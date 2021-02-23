# frozen_string_literal: true

class FollowingsController < RelationshipsController
  before_action :set_user, only: %i[show]

  def show
    @followings = @user.followings.order(:id).page(params[:page])
  end
end
