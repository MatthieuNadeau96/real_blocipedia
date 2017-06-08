class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @collaborator = Collaborator.new
  end

  def edit
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    
    @user = User.where(email: params[:email]).take
    
    if @user == nil
      flash[:error] = "Collaborator could not be found."
      redirect_to edit_wiki_path(@wiki)
    elsif @wiki.collaborators.include?(@user)
      flash[:error] = "Collaborator already exists."
      redirect_to edit_wiki_path(@wiki)
    else 
      collaborator = @wiki.collaborators.build(user_id: @user.id)
      
      if collaborator.save
        flash[:notice] = "Your collaborator has been added to the wiki."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:error] = "Collaborator could not be added. Check the spelling!"
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    # @wiki = @collaborator.wiki
    
    if @collaborator.destroy 
      flash[:notice] = "Collaborator removed from wiki."
      redirect_to @wiki
    else
      flash[:error] = "Collaborator could not be removed."
      redirect_to @wiki
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaborator_params
      params.fetch(:collaborator, {})
    end
end
