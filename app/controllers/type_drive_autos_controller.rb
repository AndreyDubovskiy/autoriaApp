class TypeDriveAutosController < ApplicationController


  #GET
  def allTypeDriveAutos
    if params.has_key? 'name'
      @typeDriveAutos = TypeDriveAuto.where("name LIKE '%#{params[:name]}%'")
    else
      @typeDriveAutos = TypeDriveAuto.all
    end
    @typeDriveAutos.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = TypeDriveAuto.new()
    @new.name = params[:name]
    @new.save
    redirect_to typedriveauto_path
  end

  #GET
  def editPage
    @tmp = TypeDriveAuto.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = TypeDriveAuto.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to typedriveauto_path
  end

  #DELETE
  def delete
    @tmp = TypeDriveAuto.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to typedriveauto_path
  end

end
