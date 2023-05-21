class CountriesController < ApplicationController

  #GET
  def allCountries
    if params.has_key? 'name'
      @countries = Country.where("name LIKE '%#{params[:name]}%'")
    else
      @countries = Country.all
    end
    @countries.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = Country.new()
    @new.name = params[:name]
    @new.save
    redirect_to countries_path
  end

  #GET
  def editPage
    @tmp = Country.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Country.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to countries_path
  end

  #DELETE
  def delete
    @tmp = Country.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to countries_path
  end

end
