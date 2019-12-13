class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            token = JsonWebToken.encode(user_id: @user.id)
            render json: { token: token, username: @user.username}, status: :ok
        else
            render json: { error: 'unauthoried' }, status: :unauthorized
        end
    end


    private

    def login_params
        params.permit(:email, :password)
    end
end
