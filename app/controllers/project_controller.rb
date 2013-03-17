class ProjectController < ApplicationController
  def create
    @project = Project.new :name => params[:name]
	redirect_to 'project/show'
  end
  
  def list
    @projects = Project.find(:all)
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
	@project.update_attributes(params[:project])

	redirect_to 'project/show'
  end

end
