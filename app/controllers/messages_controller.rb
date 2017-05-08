class MessagesController < ApplicationController
  before_action :replace_message, only: [:index,:create]
  def index
    #このgroup_idは/groups/:group_id/messages(.:format)のgroup_idである。参照rake routes
    #group_idをとってくることによってそのグループの情報を取ってくることが出来る。そしてその情報からeditに飛べる。editに跳ぶにはここのindexの情報が必須だった。
    #ここはmessageコントローラーだが、普通に他のテーブルのモデル、例えば上でいうgroupモデルも取ってくる事が出来る。
  end

  def create
    message = current_user.messages.new(post_parms)
    group = Group.find(params[:group_id])
   if message.save
      redirect_to group_messages_path(message),notice: "メッセージをさくせい"
    else
      flash.now[:notice]='メッセージの作成にシッパイ'
      render :index
    end
  end


  private

  def post_parms
        # params.require(:message)はモデルから送られてくるキーの名前。モデル名ではない。
    params.require(:message).permit(:body).merge(group_id: params[:group_id],user_id: current_user.id)
  end
  def replace_message
    @group = Group.find(params[:group_id])
    @message = Message.new
  end


end
