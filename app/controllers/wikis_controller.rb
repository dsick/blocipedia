class WikisController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = Wiki.all
  end

  def new

    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    #@wiki = Wiki.new(wiki_params)
    byebug
    if @wiki.save
      redirect_to @wiki, notice: "Wiki was saved successfully."
    else
      flash.now[:alert] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user_id)
  end
end
