class Stock < ApplicationRecord

    def self.new_from_lookup(ticker_symbol)
        begin
            StockQuote::Stock.new(api_key: 'sk_6febc4a662524d0eb3d9ca0ce77b5406')
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil 
        end
    end
end
