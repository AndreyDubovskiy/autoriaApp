

class PagesController < ApplicationController
  before_action :authenticate_user_login!
  def my_page
    render 'pages'
  end

end
