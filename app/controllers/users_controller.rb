class UsersController < ApplicationController
  def show
  end
  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], password: params[:password], email: params[:email], age: params[:age], city_id: City.all.sample.id)
      if @user.save
        flash[:success] = "Utilisateur créé avec succès"
        redirect_to root_path
      else
        flash[:danger] = "Erreur dans la création de l'utilisateur"
        render new_user_path
      end    
    else
      flash[:danger] = "Le mot de passe et sa confirmation ne correspondent pas"
      render new_user_path
    end
  end
end
