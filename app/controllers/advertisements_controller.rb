class AdvertisementsController < ApplicationController
  #GET
  def allAdvertisements
    @advs = AdvertisementQuery.new(Advertisement.all).call(params)
    @advs.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = City.new()
    @new.name = params[:name]
    @new.save
    redirect_to cities_path
  end

  #GET
  def editPage
    @tmp = City.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = City.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to cities_path
  end

  #DELETE
  def delete
    @tmp = City.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to cities_path
  end
end
