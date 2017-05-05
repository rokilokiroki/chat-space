class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    #このgroup_idは/groups/:group_id/messages(.:format)のgroup_idである。参照rake routes
    #group_idをとってくることによってそのグループの情報を取ってくることが出来る。そしてその情報からeditに飛べる。editに跳ぶにはここのindexの情報が必須だった。
    #ここはmessageコントローラーだが、普通に他のテーブルのモデル、例えば上でいうgroupモデルも取ってくる事が出来る。
  end

  def edit
  end


end
