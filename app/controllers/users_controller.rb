class UsersController < ApplicationController

    def my_portfolio
        @user = current_user
        @user_stocks = @user.stocks
    end

    def my_friends
        @friends = current_user.friends
    end

    def show
        
        @user = User.find(params[:id])
        @user_stocks = @user.stocks
    end

    def search
        
        
        if params[:search_params][0].blank?
            flash.now[:error] = "You have entered an empty search string"
        else
            @users = User.search(params[:search_params][0])
            @users = current_user.except_current_user(@users)
            flash.now[:error] = "No users match this search criteria" unless @users.size > 0 
        end
        respond_to do |format|
            format.js {render partial: 'friends/result'}
        end 
        
    end

    def add_friend
        Friendship.create(user_id: params[:user], friend_id: params[:friend])
        flash[:success] = "You and #{(User.find(params[:friend])).first_name} are now friends"

        redirect_to my_friends_path

    end

end
