class PagesController < ApplicationController
  def my_page
    render 'pages'
  end

  def allPost
    @posts = Advertisement.all
    render 'adv'
  end

end
