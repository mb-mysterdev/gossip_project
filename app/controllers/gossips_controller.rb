class GossipsController < ApplicationController
  def show
  end
  def index
  end
  def new
  end
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])
    if @gossip.save
      flash[:success] = "Rumeur créée avec succès"
      redirect_to gossips_path
    else
      flash[:danger] = "Erreur dans la création de la rumeur"
      render new_gossip_path
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content], user_id: session[:user_id])
      redirect_to gossip_path(params[:id])
    else
      render edit_gossip_path
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
  private
end
