class UsersController < ApplicationController
  before_action :authenticate_user_login!
  def show
    @tmp = nil
    if params.has_key? 'id'
      @tmp = User.find(params[:id])
    end

    if(@tmp)
      render 'show'
    else
      @tmp = current_user_login.user
      render 'show'
    end

  end

  #GET
  def editPage
    @tmp = User.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = User.find(params[:id])
    if @tmp
      @tmp.city_id = params[:city_id].to_i
      @tmp.name = params[:name]
      @tmp.surname = params[:surname]
      @tmp.pobatkovi = params[:pobatkovi]
      @tmp.phone = params[:phone]
      @tmp.save
    end
    redirect_to users_show_path(id: @tmp.id)
  end

  #DELETE
  def delete
    @tmp = User.find(params[:id])
    if @tmp and current_user_logins.user.id == params[:id]
      @tmp.delete
    end
    redirect_to advertisements_path
  end

end
