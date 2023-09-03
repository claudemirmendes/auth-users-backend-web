class AuthTokenController < DeviseTokenAuth::SessionsController
    def render_create_success
      render json: {
        data: @resource_data.merge({
          'access-token' => @token,
          'token-type' => 'Bearer'
        })
      }
    end
  end