
json.set! :time, @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.set! :body, @message.body
json.set! :id,   @message.id

# create.json.jbulederにすることでcreateアクションとつながっているから@messageをここで定義する必要はない