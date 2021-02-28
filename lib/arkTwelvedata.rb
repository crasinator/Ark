class ArkTwelvedata
    include HTTParty
    base_uri "api.twelvedata.com/"

    def self.get_stock_info(ticker)
        stock_info = "/time_series?symbol=#{ticker}&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8"
        responce = self.get(stock_info)
        
        open = responce["values"][0]["open"].to_i
        close = responce["values"][0]["close"].to_i
        percent = (100.0 * (close - open) / open) * 100 
        title = Robinhood.get_company_info(ticker)

        return stock = Stock.new(ticker, open, close, percent, title)
    end 
    
end

# arkk = ArkTwelvedata.get_stock_info("ARKK")
# tsla = ArkTwelvedata.get_stock_info("TSLA")
# pypl = ArkTwelvedata.get_stock_info("PYPL")