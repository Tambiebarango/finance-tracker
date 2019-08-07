class FriendshipsController < ApplicationController

    def destroy
        
        friend = User.where(id:params[:id])
        friendship = Friendship.where(user: current_user, friend_id: params[:id])
        friendship[0].destroy
        flash[:success] = "You are no longer friends"
        redirect_to my_friends_path
    end

end 