class ValidatesController < ApplicationController
  require 'digest/sha1'
  def index
  	@signature = params[:signature]
  	@timestamp = params[:timestamp]
  	@nonce = params[:nonce]
  	@echostr = params[:echostr]
  	@token = "123abc"
  	@result = [@token,@timestamp,@nonce].sort.join
  	@results = Digest::SHA1.hexdigest(@result)
    if @results == @signature
    	render plain: @echostr
    end
  end
end
