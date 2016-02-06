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
    @timeline = {}

    @issues.each do |issue|
      # tracker
      tracker_name = issue.tracker.name
      unless tracker_name.blank?
        @tracker_count[tracker_name].nil? ? @tracker_count[tracker_name] = 1 : @tracker_count[tracker_name] += 1
      end
      # status
      status_name = issue.status.name
      unless status_name.blank?
        @status_count[status_name].nil? ?  @status_count[status_name] = 1 : @status_count[status_name] += 1
      end
      # category
      cateory_name = issue.category
      unless cateory_name.blank?
        @category_count[cateory_name].nil? ? @category_count[cateory_name] = 1 : @category_count[cateory_name] += 1
      end
      # assignee
      unless issue.assigned_to.blank?
        user_name = issue.assigned_to.login
        @user_count[user_name].nil? ? @user_count[user_name] = 1 : @user_count[user_name] += 1
      end
      # start-date
      unless issue.start_date.blank?
        start_date = issue.start_date.to_time(:local).to_i * 1000
        @timeline[start_date].nil? ? @timeline[start_date] = 1 : @timeline[start_date] += 1
      end
    end

  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
