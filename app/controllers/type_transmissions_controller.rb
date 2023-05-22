class TypeTransmissionsController < ApplicationController

  #GET
  def allTypeTransmissions
    if params.has_key? 'name'
      @typeTransmissions = TypeTransmission.where("name LIKE '%#{params[:name]}%'")
    else
      @typeTransmissions = TypeTransmission.all
    end
    @typeTransmissions.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = TypeTransmission.new()
    @new.name = params[:name]
    @new.save
    redirect_to type_transmissions_path
  end

  #GET
  def editPage
    @tmp = TypeTransmission.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = TypeTransmission.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to type_transmissions_path
  end

  #DELETE
  def delete
    @tmp = TypeTransmission.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to type_transmissions_path
  end

end
