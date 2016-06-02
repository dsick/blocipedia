class CollaboratorsController < ApplicationController
  
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.all
  end

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params) 
    @collaborator.user = params[:user_id]

    if @collaborator.save
      flash[:notice] = "You Added a collaborator"
    else
      flash[:alert] = "Was not about to add collaborator. Please try again"
    end
    redirect_to wiki_path(@wiki)
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was deleted successfully."
    else
      flash[:alert] = "Collaborator couldn't be deleted. Try again."
    end

  end

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end