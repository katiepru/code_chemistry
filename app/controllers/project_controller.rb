class ProjectController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @project = Project.new :name => params[:name], :url => params[:url]
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
