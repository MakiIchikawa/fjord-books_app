# frozen_string_literal: true

class Users::CommentsController < ApplicationController
  before_action :set_commentable, only: [:create]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.created_by_id = current_user.id
    if @comment.save!
      redirect_to set_url, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  private

  def set_commentable
    @commentable = if params[:report_id].present?
                     @commentable = Report.find(params[:report_id].to_i)
                   elsif params[:book_id].present?
                     @commentable = Book.find(params[:book_id].to_i)
                   end
  end

  def set_url
    case @comment.commentable_type
    when 'Report'
      polymorphic_url([@comment.created_by, @commentable])
    when 'Book'
      polymorphic_url(@commentable)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
