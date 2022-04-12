class RelationshipsController < ApplicationController
  def create
    follow = Relationship.new
    follow.following_id = current_user.id
    follow.follower_id = params[:user_id]
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = Relationship.find_by(following_id: current_user.id, follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end

  def follows
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
