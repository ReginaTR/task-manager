class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:authenticate]
  
  def register
    if User.exists?(email: params[:email])
      return render json: { status: 'failure', message: 'Email já cadastrado' }, status: :unprocessable_entity
    end

    @user = User.new(user_params)

    if @user.save
      token = generate_jwt(@user.id)  # Gera o token JWT
      render json: { status: 'success', token: token, user_id: @user.id }, status: :created
    else
      render json: { status: 'failure', message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def authenticate
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])  
      token = generate_jwt(@user.id)  
      render json: { status: 'success', token: token, user_id: @user.id }, status: :ok
    else
      render json: { status: 'failure', message: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  def validate_token
    token = request.headers['Authorization']&.split(' ')&.last
    user_id = decode_jwt(token)

    if user_id
      user = User.find(user_id)
      render json: { user_id: user.id, email: user.email }, status: :ok
    else
      render json: { error: 'Token inválido' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
  
  def generate_jwt(user_id)
    payload = { user_id: user_id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def decode_jwt(token)
    decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
    decoded.first['user_id']
  rescue JWT::DecodeError
    nil
  end
end
