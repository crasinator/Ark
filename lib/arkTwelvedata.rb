class ArkTwelvedata
    include HTTParty
    base_uri "api.twelvedata.com/"

    def self.get_stock_info(ticker)
        stock_quote = "/quote?symbol=#{ticker}&apikey=716b4530d098461283fb2c02408a6bb8"
        responce = self.get(stock_quote)
        
        open = responce["open"].to_f
        close = responce["close"].to_f
        percent = (100.0 * (close - open) / open) * 100 
        title = Robinhood.get_company_name(ticker)
        market_cap = Robinhood.get_marketcap(ticker)
        fiftytoo_week = responce["fifty_two_week"]["range"]

        return stock = Stock.new(ticker, open, close, percent, title, market_cap, fiftytoo_week)
    end 
end

# # arkk = ArkTwelvedata.get_stock_info("ARKK")
# # tsla = ArkTwelvedata.get_stock_info("TSLA")
# # pypl = ArkTwelvedata.get_stock_info("PYPL")

