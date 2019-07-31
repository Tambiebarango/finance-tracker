class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  def find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
