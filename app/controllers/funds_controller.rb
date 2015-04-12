class FundsController < ApplicationController

#	@@funds = {
#	"resultcode":"200",
#	"reason":"SUCCESSED!",
#	"result":[
#	{
#		"1":{
#			"code":"990001",
#			"name":"新点FOF固定收益",
#			"newnet":"1.0393",
#			"totalnet":"1.0393",
#			"dayincrease":"0.0002",
#			"daygrowrate":"0.0192",
#			"weekgrowrate":"0.1500",
#			"monthgrowrate":"0.7100",
#			"annualincome":"3.9300",
#			"time":" 2012年12月18日"
#		},
#		"2":{
#			"code":"980001",
#			"name":"新点FOF超越一号",
#			"newnet":"1.0600",
#			"totalnet":"1.0600",
#			"dayincrease":"-0.0078",
#			"daygrowrate":"-0.7305",
#			"weekgrowrate":"4.5800",
#			"monthgrowrate":"8.8300",
#			"annualincome":"6",
#			"time":" 2012年12月18日"
#		}
#	}
#	]
#}

  def create
  	StoreFunds.perform_async
  	
  end



end
