class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user.name
  end


end
