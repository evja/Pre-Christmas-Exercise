class StaticPagesController < ApplicationController

  def home
    @links = Link.all
  end

  def about
  end

  def index
    @users = User.all
    @links = Link.all
  end

end
