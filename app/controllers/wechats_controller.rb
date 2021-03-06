class WechatsController < ApplicationController
	  wechat_responder

  # 默认的文字信息responder
  on :text do |request, content|
  	if Fund.exists?(code:content)
  	@newnet = Fund.order(created_at: :desc).find_by_code(content)
    request.reply.text "基金名字：#{@newnet[:name]}
最新净值：#{@newnet[:newnet].to_s}
日增长率：#{@newnet[:daygrowrate].to_s}
更新日期：#{@newnet[:time]}"
    else
    	request.reply.text "基金不存在，请检查输入的基金代码是否正确"
    end
  end

  # 当请求的文字信息内容为'help'时, 使用这个responder处理
  on :text, with:"help" do |request, help|
    request.reply.text "help content" #回复帮助信息
  end
end
