class UserStocksController < ApplicationController

    def create
        stock = Stock.find_by_ticker(params[:ticker])
        if stock.blank?
            stock = Stock.new_from_lookup(params[:ticker])
            stock.save
        end
        @user_stock = UserStock.create(stock:stock, user:current_user)
        flash[:success] = "Stock #{@user_stock.stock.ticker} was successfully added to your stocks!"
        redirect_to my_portfolio_path
    end

    def destroy
        u_stock = current_user.user_stocks.find_by(stock_id: params[:id])
        stock = Stock.find_by(id:params[:id])
        u_stock.destroy
        flash[:success] = "Stock #{stock.ticker} was successfully removed from your portfolio"
        redirect_to my_portfolio_path
    end
end
