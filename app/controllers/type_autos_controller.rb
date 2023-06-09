class TypeAutosController < ApplicationController
  before_action :authenticate_user_login!
  #GET
  def allTypeAutos
    if params.has_key? 'name'
      @typeAutos = TypeAuto.where("name LIKE '%#{params[:name]}%'")
    else
      @typeAutos = TypeAuto.all
    end
    @typeAutos = @typeAutos.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = TypeAuto.new()
    @new.name = params[:name]
    @new.save
    redirect_to type_autos_path
  end

  #GET
  def editPage
    @tmp = TypeAuto.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = TypeAuto.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to type_autos_path
  end

  #DELETE
  def delete
    @tmp = TypeAuto.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to type_autos_path
  end

end
