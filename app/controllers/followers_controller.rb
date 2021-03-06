# frozen_string_literal: true

class FollowersController < RelationshipsController
  before_action :set_user, only: %i[show]

  def show
    @followers = @user.followers.order(:id).page(params[:page]).includes(avatar_attachment: :blob)
  end
end
