class MarkasController < ApplicationController
  #GET
  def allMarkas
    if params.has_key? 'name'
      @markas = MarkaAuto.where("name LIKE '%#{params[:name]}%'")
    else
      @markas = MarkaAuto.all
    end
    @markas.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = MarkaAuto.new()
    @new.name = params[:name]
    @new.save
    redirect_to markas_path
  end

  #GET
  def editPage
    @tmp = MarkaAuto.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = MarkaAuto.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to markas_path
  end

  #DELETE
  def delete
    @tmp = MarkaAuto.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to markas_path
  end
end
