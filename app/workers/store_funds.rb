
class StoreFunds
  require 'open-uri'
  require 'json'
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform
begin
  	  @funds = URI.parse("http://web.juhe.cn:8080/fund/netdata/all?key=#{ENV['JUHE_APPKEY']}").read
  	rescue Exception
  		retry
  	end
  	@getfunds = JSON.parse(@funds)

#@getfunds = {"resultcode"=>"200", "reason"=>"SUCCESSED!", "result"=>[{"1"=>{"code"=>"000940", "name"=>"富国中小盘精选混合", "newnet"=>"1.303", "totalnet"=>"1.303", "dayincrease"=>"0.031", "daygrowrate"=>"2.4371", "weekgrowrate"=>"6.6285", "monthgrowrate"=>"25.8937", "annualincome"=>"", "time"=>"2015年04月03日 "}, "2"=>{"code"=>"660001", "name"=>"农银行业成长股票", "newnet"=>"2.6634", "totalnet"=>"3.2634", "dayincrease"=>"0.0633", "daygrowrate"=>"2.4345", "weekgrowrate"=>"10.1216", "monthgrowrate"=>"28.3752", "annualincome"=>"76.6649", "time"=>"2015年04月03日 "}}]}

  	@allfunds = Hash.new
  	@getfunds["result"].each { |x| @allfunds = x }
  	@allfunds.each_value do |x|
  		x["time"] = x["time"].gsub(/\W/,"")
  		Fund.create(code:x["code"],name:x["name"],newnet:x["newnet"],totalnet:x["totalnet"],dayincrease:x["dayincrease"],
  			daygrowrate:x["daygrowrate"],weekgrowrate:x["weekgrowrate"],monthgrowrate:x["monthgrowrate"],annualincome:x["annualincome"],time:x["time"])
  	end
  	end
  end