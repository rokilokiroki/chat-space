class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    Group.create(post_parms)
    redirect_to controller: :messages, action: :index
  end

  def edit
    
  end
  private
  def post_parms
    params.require(:group).permit(:name, {:user_ids => []})
  end
end
  
