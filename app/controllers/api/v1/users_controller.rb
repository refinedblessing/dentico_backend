class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :appts]

  # GET /users
  def index
    # how to include new field like total no of appts and revenue cost
    @users = User.all

    render json: @users
  end

  # GET /users/1?receipts=true&appts=true
  def show
    @user.includes(:receipts) if params[:receipts]
    @user.includes(:appointments) if params[:appts]
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # def destroy
  #   @user.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]).includes(:total_revenue, :no_of_appts)
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_type, :name, :email, :phone, :sex, :age)
    end
end
