# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    created_by_id = params[:user_id]
    records = Report.where(created_by_id: created_by_id.to_i)
    @reports = Report.find(records.pluck(:id))
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(report_params)
    @report.created_by_id = current_user.id

    if @report.save
      redirect_to user_report_path(current_user.id, @report.id), notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to user_report_path(@report.created_by.id, @report.id), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
