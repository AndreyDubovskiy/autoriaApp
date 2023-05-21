class TypeKuzovsController < ApplicationController

  #GET
  def allTypeKuzovs
    if params.has_key? 'name'
      @typeKuzovs = TypeKuzov.where("name LIKE '%#{params[:name]}%'")
    else
      @typeKuzovs = TypeKuzov.all
    end
    @typeKuzovs.page(params[:page]).per(10)
    render 'all'
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new = TypeKuzov.new()
    @new.name = params[:name]
    @new.save
    redirect_to typekuzovs_path
  end

  #GET
  def editPage
    @tmp = TypeKuzov.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = TypeKuzov.find(params[:id])
    if @tmp
      @tmp.name = params[:name]
      @tmp.save
    end
    redirect_to typekuzovs_path
  end

  #DELETE
  def delete
    @tmp = TypeKuzov.find(params[:id])
    if @tmp
      @tmp.delete
    end
    redirect_to typekuzovs_path
  end

end
