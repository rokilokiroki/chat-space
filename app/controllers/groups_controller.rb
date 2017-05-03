class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.new(post_parms)
    group.save
    redirect_to controller: :messages, action: :index
  end

  def edit

  end

  private

  def post_parms
    params.require(:group).permit(:name, {:user_ids => []})
  end

end
