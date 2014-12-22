class StaticPagesController < ApplicationController
  before_action :list_links, only:(:home)

  def home
  end

  def about
  end

  private

    def list_links
      @list_links = Link.all
    end

end
