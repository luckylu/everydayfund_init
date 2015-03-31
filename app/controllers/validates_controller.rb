class ValidatesController < ApplicationController
  require 'digest/sha1'
  def index
  	@signature = params[:signature]
  	@timestamp = params[:timestamp]
  	@nonce = params[:nonce]
  	@token = "123abc"
  	@result = [@token,@timestamp,@nonce].sort.join
  	@result = Digest::SHA1.hexdigest @result
  	@result == @signature ? true : false
  end
end
