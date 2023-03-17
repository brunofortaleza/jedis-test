class UsersController < ApplicationController
  before_action :set_user, except: %i[index new create]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  end

  def new
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to users_path, notice: "Usuário criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      UserMailer.update_user_email(@user).deliver_now
      redirect_to users_path, notice: "Usuário atualizado com sucesso."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :cpf, :cns, :email, :birth_date, :phone_number, :image, :status,
                                 address_attributes: [:cep, :street, :complement, :neighborhood, :city, :state, :ibge])
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
