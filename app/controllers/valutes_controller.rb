class ValutesController < ApplicationController
  before_action :authenticate_user_login!

  #GET
  def allValutes
    if params.has_key? 'name'
      @valutes = Valute.where("name LIKE '%#{params[:name]}%'")
    else
      @valutes = Valute.all
    end
    @valutes.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = Valute.new()
    @new.name = params[:name]
    @new.save
    redirect_to valutes_path
  end

  #GET
  def editPage
    @tmp = Valute.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Valute.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to valutes_path
  end

  #DELETE
  def delete
    @tmp = Valute.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to valutes_path
  end

end
