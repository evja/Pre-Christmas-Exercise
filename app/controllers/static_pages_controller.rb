class StaticPagesController < ApplicationController

  def home
    # @links = Link.all.paginate(:page => params[:page], :per_page => 10)
  end

  def about
  end

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

end
