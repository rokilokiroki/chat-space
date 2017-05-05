class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(post_parms)
    group.save
    redirect_to controller: :groups, action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(post_parms)
    redirect_to controller: :groups, action: :index
  end

  private

  def post_parms
    params.require(:group).permit(:name, {:user_ids => []})
  end

end
