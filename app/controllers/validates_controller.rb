class ValidatesController < ApplicationController
  require 'digest/sha1'
  def index
  	@signature = params[:signature]
  	@timestamp = params[:timestamp]
  	@nonce = params[:nonce]
  	@echostr = params[:echostr]
  	@token = "123abc"
  	@result = [@token,@timestamp,@nonce].sort.join
  	@result = Digest::SHA1.hexdigest @result
  	if @result == @signature
  		return @echostr
  	end
  end
end
