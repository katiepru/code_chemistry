class ProjectController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @project = Project.new :name => params[:name]
    @project.user_id = @user.id
    @project.save
	redirect_to '/project/show/'+@project.name
  end

  def new
    @user = User.find(session[:user_id])
  end
  
  def list
    @projects = Project.find(:all)
  end
  
  def show
    @project = Project.find_by_name(params[:name])
    @project_owner = User.find(@project.user_id)
    @octo_repo = Octokit.repository(@project_owner.username + "/" + @project.name)
    @octo_langs = Octokit.languages(@octo_repo['full_name']).sort_by{|lang,measure| measure}.reverse
    #@tabs_used = detect_tabs_style(@project_owner.username, @project.name)
    redirect_to '/project/list' unless @project
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
	@project.update_attributes(params[:project])

	redirect_to '/project/show'
  end

end
