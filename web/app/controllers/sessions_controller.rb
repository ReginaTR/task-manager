class SessionsController < ApplicationController
    
    def new
      
    end
  
    def create
      email = params[:email]
      password = params[:password]
  
      response = authenticate_user(email, password)
  
      if response[:status] == 'success'
        session[:auth_token] = response[:token]
        redirect_to task_path 
      else
        flash[:alert] = 'Credenciais inválidas.'
        render :new
      end
    end
  
    def destroy
      session.delete(:auth_token)
      redirect_to root_path, notice: 'Você foi desconectado com sucesso.'
    end
  
    private
  
    def authenticate_user(email, password)
      connection = Faraday.new(url: 'http://auth:3001/authenticate') do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.response :logger
      end
  
      response = connection.post('/authenticate') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = { email: email, password: password }.to_json
      end
  
      if response.status == 200
        JSON.parse(response.body, symbolize_names: true)
      else
        { status: 'failure' }
      end
    end
  end
  