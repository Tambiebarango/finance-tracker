class StocksController < ApplicationController

    def search
        if params[:stock][0].present?
            @stock_item = Stock.new_from_lookup(params[:stock])
            if @stock_item
                render 'users/search_results'
            else
                flash[:error] = "You have entered an incorrect symbol"
                redirect_to my_portfolio_path
            end
        else
            flash[:error] = "You have entered a blank search result"
            redirect_to my_portfolio_path
        end
    end

end