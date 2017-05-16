class MessagesController < ApplicationController
  before_action :replace_post, only: [:index,:create]

  def index
    #このgroup_idは/groups/:group_id/messages(.:format)のgroup_idである。参照rake routes
    #group_idをとってくることによってそのグループの情報を取ってくることが出来る。そしてその情報からeditに飛べる。editに跳ぶにはここのindexの情報が必須だった。
    #ここはmessageコントローラーだが、普通に他のテーブルのモデル、例えば上でいうgroupモデルも取ってくる事が出来る。
    @messages = @group.messages.includes(:user)
    @message = Message.new

  end

  def create
    @messages = @group.messages.includes(:user)
    @message = current_user.messages.new(post_params)
    if @message.save
      respond_to do|format|
        format.html { redirect_to group_messages_path(@group), notice: "メッセージをさくせい" }
        format.json
        #  { render json: @message}がいらない理由はjbuilderで@messageを経由しているからいらない？
      end
    else
      flash.now[:notice] = 'メッセージの作成にシッパイ'
      render :index
    end
  end

  private

  def post_params
    # params.require(:message)はモデルから送られてくるキーの名前。モデル名ではない。でもモデル名ぽく書けばいいと思う。
    # params.require(:user).permit(:name, :email)」となっています。
    # これに対してform_forを使用したMoooviのparamsは、ハッシュの中にハッシュが存在する二重構造になっています。reviewというキーに対応する値そのものがハッシュだからです。そのハッシュの中には、カラム名がキーとなり、入力した情報が値として紐付いています。

    # このコードは「params が :user というキーを持ち、params[:user] は :name 及び :email というキーを持つハッシュであること」を検証します。

    # 例えば、params[:user] が {:name => 'taro', :email => 'taro@example.com'} のようなハッシュである場合に検証 OK となります。

    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

  def replace_post
    @group = Group.find(params[:group_id])
  end
end
