class LinksController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = @user.links.all
  end

  def show
  end

  def new
    @link = @user.links.build
  end

  def create
    @link = @user.links.build(link_params)
    if @link.save notice: "Thanks"
      redirect_to user_link_path(@user, @link)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update_attributes(link_params)
      redirect_to user_link_path(@user, @link)
    else
      render :edit
    end
  end

  def destroy
    @link.delete
    redirect_to user_links_path
  end

   def vote_up
    @link.votes += 1
    @link.save
    redirect_to links_path
  end

  def vote_down
    @link.votes -= 1
    @link.save
    redirect_to links_path
  end

  private

   def set_user
     @user = current_user
   end

   def set_link
     @link = Link.find(params[:id])
   end

   def link_params
     params.require(:link).permit(:title, :url, :votes)
   end

end
