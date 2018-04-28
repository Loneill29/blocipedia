class WikisController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
     @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])

    if current_user.standard?

    unless (@wiki.private == false) || @wiki.user_id == current_user || current_user.admin?
        flash[:alert] = "You are not authorized to view this wiki."
        redirect_to new_charge_path
      end
    else
      flash[:alert] = "You are not authorized to view this wiki."
      redirect_to new_user_registration_path
    end
  end

  def new
   @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
  @wiki = Wiki.find(params[:id])
  authorize @wiki
  if @wiki.update(wiki_params)
    flash[:notice] = "Wiki was updated."
    redirect_to @wiki
  else
    flash.now[:alert] = "There was an error saving the wiki. Please try again."
    render :edit
  end
end

  def create
    @wiki = Wiki.new
    @wiki.assign_attributes(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
  end
