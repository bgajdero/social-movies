class ForumsController < ApplicationController
  PER_PAGE = 40
  def index
    @page = params[:page] || 1
    @forums = Forum.all
  end
  
  def load
    forums = Forum.trending_threads
    Forum.load_comments(forums)
    redirect_to :action => 'index'
  end
end
