class ProjectSummaryController < ApplicationController
  unloadable

  menu_item :ProjectSummary
  before_filter :find_project, :authorize

  def index
    @issues = @project.issues

    @tracker_count = {}
    @tracker_status_count = {}
    @tracker_user_count = {}
    @status_count = {}
    @category_count = {}
    @user_count = {}

    @issues.each do |issue|
      # tracker
      @tracker_count[issue.tracker_id] = inc_hash(@tracker_count[issue.tracker_id])
      # tracker-status
      @tracker_status_count[ [issue.tracker_id, issue.status_id] ] = inc_hash(@tracker_status_count[ [issue.tracker_id, issue.status_id] ])
      # tracker-user
      @tracker_user_count[ [issue.tracker_id, issue.assigned_to_id] ] = inc_hash(@tracker_user_count[ [issue.tracker_id, issue.assigned_to_id] ])
      # status
      @status_count[issue.status_id] = inc_hash(@status_count[issue.status_id])
      @category_count[issue.category_id].nil? ? @category_count[issue.category_id] = 1 : @category_count[issue.category_id] += 1
      @user_count[issue.assigned_to_id].nil? ? @user_count[issue.assigned_to_id] = 1 : @user_count[issue.assigned_to_id] += 1
    end
    
    @tracker_count
    @tracker_status_count
    @tracker_user_count
    @status_count
    @category_count
    @user_count

  end
  def inc_hash count_hash
    count_hash.nil? ? 1 : count_hash + 1
  end
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
