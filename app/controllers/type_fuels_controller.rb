class TypeFuelsController < ApplicationController
  before_action :authenticate_user_login!
  #GET
  def allTypeFuels
    if params.has_key? 'name'
      @typeFuels = TypeFuel.where("name LIKE '%#{params[:name]}%'")
    else
      @typeFuels = TypeFuel.all
    end
    @typeFuels.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = TypeFuel.new()
    @new.name = params[:name]
    @new.save
    redirect_to type_fuels_path
  end

  #GET
  def editPage
    @tmp = TypeFuel.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = TypeFuel.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to type_fuels_path
  end

  #DELETE
  def delete
    @tmp = TypeFuel.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to type_fuels_path
  end

end
