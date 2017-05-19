class GroupsController < ApplicationController
  before_action :replace_action, only: [:update,:edit]
  #renderメソッドは移動先のアクションの変数を持ってこなくてはならない。上記のreplace_actionはその変数をまとめたもの。
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    # @users = User.where.not(name: current_user.name)
  end

  def create
    @group = Group.new(post_params)
    if @group.save
       redirect_to :root, notice: "グループをさくせい"
    else
      @users = User.where.not(name: current_user.name)
      flash.now[:notice] = 'グループの作成にシッパイ'
      render :new
    end

  end

  def edit
    @users = User.where.not(name: current_user.name)
    #@をつける、インスタンス変数にすることは可視化のため？
  end

  def update
    group = Group.find(params[:id])
      # / form_forタグに最初からupdateパスは埋め込まれている。すでにカラムが存在しているインスタンスならupdateアクションに自動的に振り分けられる。つまりパスを指定していたpictweetの<%= form_tag("/tweets/#{@tweet.id}", method: :patch ) do %>はform_forにおいてはいらないということになる
      if group.update(post_params)
        # flash.now[:notice]='グループを作成しました'
        redirect_to group_messages_path(group),notice: 'グループをさくせいしました'
      else
        flash.now[:notice]='グループの作成にシッパイ'
        render :edit
      # renderはbeforeアクションを呼ばない。だからbeforeアクションに記載していたコードを
      end
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do|format|
      format.json
    end
  end

  private

  def post_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def replace_action
    @group = Group.find(params[:id])
  end
end
