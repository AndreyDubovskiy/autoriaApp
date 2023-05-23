class PagesController < ApplicationController
  before_action :authenticate_user_login!
  def my_page
    render 'pages'
  end

  def allPost
    @posts = Advertisement.all
    render 'adv'
  end

end
