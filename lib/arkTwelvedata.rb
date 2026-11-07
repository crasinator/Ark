class ArkTwelvedata
    include HTTParty
    base_uri "api.twelvedata.com"

    def self.get_stock_info(ticker)
        key = ENV["TWELVE_DATA_API_KEY"].to_s
        raise "Set TWELVE_DATA_API_KEY to your Twelve Data API key." if key.empty?

        response = get("/quote", query: { symbol: ticker, apikey: key })
        if response["status"] == "error" || response["close"].nil?
            detail = response["message"] || "no quote for #{ticker}"
            raise "Twelve Data: #{detail}"
        end

        open = response["open"].to_f
        close = response["close"].to_f
        percent = response["percent_change"].to_f
        title = response["name"].to_s
        title = Robinhood.get_company_name(ticker) if title.empty?
        market_cap = Robinhood.get_marketcap(ticker)
        fiftytoo_week = response.dig("fifty_two_week", "range") || "0 - 0"

        Stock.new(ticker, open, close, percent, title, market_cap, fiftytoo_week)
    end
end

