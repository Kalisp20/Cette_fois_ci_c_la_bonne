class UserController < ApplicationController

  def new
    @user= User.new 
  end

  def create
if params[:user]
  @user = User.new(name: params['user']['name'], email: params['user']['email'], password: params['user']['password'], bio: params['user']['bio'])
  @user.save
else 
  @user = User.new(name: params['name'], email: params['email'], password: params['password'], bio: params['bio'])
  @user.save
  end
end

def masked_authenticity_token(session, form_options: {}) # :doc:
  action, method = form_options.values_at(:user, :create)

  raw_token = if per_form_csrf_tokens && action && method
    action_path = user_create_path(create)
    per_form_csrf_token(session, action_path, method)
  else
    real_csrf_token(session)
  end

  one_time_pad = SecureRandom.random_bytes(AUTHENTICITY_TOKEN_LENGTH)
  encrypted_csrf_token = xor_byte_strings(one_time_pad, raw_token)
  masked_token = one_time_pad + encrypted_csrf_token
  Base64.strict_encode64(masked_token)
end

end
