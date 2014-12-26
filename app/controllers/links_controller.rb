class LinksController < ApplicationController


  before_action :set_user
  before_action :authenticate_user!, except: [:vote_up, :vote_down]
  before_action :set_link

  def index
    @links = @user.links.all.paginate(:page => params[:page], :per_page => 10)
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
    redirect_to root_path
  end

  def vote_down
    @link.votes -= 1
    @link.save
    redirect_to root_path
  end

  private

   def set_user
     @user = current_user
   end

   def set_link
     @link = Link.find(params[:id])
   end

   def link_params
     params.require(:link).permit(:title, :url, :votes, :user_id)
   end

end