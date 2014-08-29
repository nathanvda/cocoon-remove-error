class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
	end

	# GET /usuarios
	# GET /usuarios.json
	def index
		@users = User.all
	end

	# GET /usuarios/1
	# GET /usuarios/1.json
	def show
		@user = User.find(params[:id])
	end

	# GET /usuarios/new
	def new
		@user = User.new
	end

	# GET /usuarios/1/edit
	def edit
		@user = User.find(params[:id])
	end

	# POST /usuarios
	# POST /usuarios.json
	def create
		@user = User.new(user_params)

		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'Usuário cadastrado com sucesso.' }
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /usuarios/1
	# PATCH/PUT /usuarios/1.json
	def update
		respond_to do |format|
			@user = User.find(params[:id])
			params[:user].delete(:password) if params[:user][:password].blank?
			params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
			if @user.update_attributes(user_params)
				format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: unprocessable_entity }
			end
		end
	end

	# DELETE /usuarios/1
	# DELETE /usuarios/1.json
	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			respond_to do |format|
				format.html { redirect_to users_url, notice: 'Usuário excluido com sucesso.' }
				format.json { head :no_content }
			end
		end
	end
end
