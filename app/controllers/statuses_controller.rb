class StatusesController < ApplicationController
  before_action :authenticate_user_login!
  #GET
  def allStatuses
    if params.has_key? 'name'
      @statuses = Status.where("name LIKE '%#{params[:name]}%'")
    else
      @statuses = Status.all
    end
    @statuses.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = Status.new()
    @new.name = params[:name]
    @new.save
    redirect_to statuses_path
  end

  #GET
  def editPage
    @tmp = Status.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Status.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to statuses_path
  end

  #DELETE
  def delete
    @tmp = Status.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to statuses_path
  end


end
