Redmine::Plugin.register :redmine_project_summary do

  name 'Redmine Project Summary plugin'
  author 'Hajime Nakagama'
  description 'This is a plugin for Redmine'
  version '0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/momibun926'

  project_module :ProjectSummary do
    permission :view_project_summary, :project_summary => :index , :require => :member
  end

  menu :project_menu, :ProjectSummary, { :controller => :project_summary, :action => :index}, :caption => 'Project Summary', :param => :project_id

end
