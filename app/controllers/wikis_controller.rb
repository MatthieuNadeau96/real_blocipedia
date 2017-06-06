class WikisController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  # before_action :authorize_user, except: [:index, :show, :new, :create]
  
  def index
    @wikis = Wiki.visible_to(current_user)
    
    if current_user.premium? || current_user.admin?
      @wikis = Wiki.all
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
    unless (@wiki.private == false) || current_user.premium? || current_user.admin?
      flash[:alert] = "You must be a premium user to view private wikis."
      if current_user
        redirect_to new_charge_path
      else
        redirect_to new_user_registration_path
      end
    end
  end

  def new
    @wiki = Wiki.new
  end
  
  def create 
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving this wiki. Try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update 
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:notice] = "There was a problem saving this wiki. Please try again."
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting this wiki."
      render :show
    end
  end
  
  private
  
  
  # def authorize_user
  #   wiki = Wiki.find(params[:id])
  #   unless current_user.admin?
  #     flash[:alert] = "You must be an admin to do that."
  #     redirect_to wikis_path
  #   end
  # end
  
end
