class ModelsController < ApplicationController

  #GET
  def allModels
    if params.has_key? 'model'
      @models = ModelMarkaAuto.where("model LIKE '%#{params[:name]}%'")
    else
      @models = ModelMarkaAuto.all
    end
    @models.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    @markas = MarkaAuto.all
    render 'create'
  end

  #POST
  def create
    @new = ModelMarkaAuto.new()
    @new.name = params[:name]
    @new.marka_auto_id = params[:marka_auto_id]
    @new.save
    redirect_to models_path
  end

  #GET
  def editPage
    @markas = MarkaAuto.all
    @tmp = ModelMarkaAuto.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = ModelMarkaAuto.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.marka_auto_id = params[:marka_auto_id]
      @tmp.save
    end
    redirect_to models_path
  end

  #DELETE
  def delete
    @tmp = ModelMarkaAuto.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to models_path
  end

end
