class StocksController < ApplicationController

    def search
        
        if params[:stock][0].blank?
            flash[:error] = "You have entered a blank search result"
        else
            @stock_item = Stock.new_from_lookup(params[:stock])
            flash[:error] = "You have entered an incorrect symbol" unless @stock_item  
        end
        respond_to do |format|
            format.js {render partial: 'users/result'}
        end 
    end

end