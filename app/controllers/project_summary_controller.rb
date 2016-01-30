class ProjectSummaryController < ApplicationController
  unloadable

  menu_item :ProjectSummary
  before_filter :find_project, :authorize

  def index
    @issues = @project.issues

    @tracker_count = {}
    @status_count = {}
    @category_count = {}
    @user_count = {}

    @issues.each do |issue|
      # tracker
      @tracker_count[issue.tracker.name].nil? ? @tracker_count[issue.tracker.name] = 1 : @tracker_count[issue.tracker.name] += 1
      @status_count[issue.status.name].nil? ?  @status_count[issue.status.name] = 1 : @status_count[issue.status.name] += 1
      @category_count[issue.category].nil? ? @category_count[issue.category] = 1 : @category_count[issue.category] += 1
      @user_count[issue.assigned_to.login].nil? ? @user_count[issue.assigned_to.login] = 1 : @user_count[issue.assigned_to.login] += 1
    end

    @tracker_count
    @status_count
    @category_count
    @user_count

  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
