class GossipController < ApplicationController
  def new
    @gossip= Gossip.new 
  end

  def create
if params[:user]
  @gossip = Gossip.new(anonymous_gossip: params['gossip']['anonymous_gossip'])
  @user.save
else 
  @gossip = Gossip.new(anonymous_gossip: params['anonymous_gossip'])
  @gossip.save
  end
end

def show
  @gossip = Gossip.find(rand(Gossip.first.id..Gossip.last.id))
end

private
def parameters
  params.require(:gossip).permit(:anonymous_gossiper, :content)
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
