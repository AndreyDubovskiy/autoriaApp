class ColorsController < ApplicationController
  before_action :authenticate_user_login!
  #GET
  def allColors
    if params.has_key? 'name'
      @colors = Color.where("name LIKE '%#{params[:name]}%'")
    else
      @colors = Color.all
    end
    @colors.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = Color.new()
    @new.name = params[:name]
    @new.save
    redirect_to colors_path
  end

  #GET
  def editPage
    @tmp = Color.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Color.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to colors_path
  end

  #DELETE
  def delete
    @tmp = Color.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to colors_path
  end


end
