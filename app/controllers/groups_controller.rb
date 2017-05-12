class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :replace_action, only: [:update,:edit]
  #renderメソッドは移動先のアクションの変数を持ってこなくてはならない。上記のreplace_actionはその変数をまとめたもの。
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(post_params)
    group.save
    redirect_to controller: :groups, action: :index
  end

  def edit
    #@をつける、インスタンス変数にすることは可視化に便利？
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
      end
  end

  private

  def post_params
    user_ids = params[:group]["user_ids"]
    user_ids << current_user.id.to_s
    # コレクションボックスのidは文字列だからto_s
    params.require(:group).permit(:name, user_ids: [])
  end

  def replace_action
    @group = Group.find(params[:id])
    @users = User.where.not(name: current_user.name)
  end

end
