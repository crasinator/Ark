require "httparty"
require "uri"

class ArkQuote
    include HTTParty
    base_uri "https://query1.finance.yahoo.com"
    headers "User-Agent" => "Mozilla/5.0"
    format :json

    def self.get_stock_info(ticker)
        symbol = ticker.to_s.strip
        raise "Yahoo Finance: missing ticker" if symbol.empty?

        response = get(
            "/v8/finance/chart/#{URI.encode_uri_component(symbol)}",
            query: { interval: "1d", range: "5d" }
        )
        body = response.parsed_response
        body = {} unless body.is_a?(Hash)
        result = body.dig("chart", "result", 0)
        if !response.success? || result.nil?
            detail = body.dig("chart", "error", "description").to_s
            detail = "no quote for #{symbol}" if detail.empty?
            raise "Yahoo Finance: #{detail}"
        end

        meta = result["meta"] || {}
        bars = result.dig("indicators", "quote", 0) || {}
        open_price = Array(bars["open"]).compact.last
        close_price = meta["regularMarketPrice"] || Array(bars["close"]).compact.last
        if open_price.nil? || close_price.nil?
            raise "Yahoo Finance: no quote for #{symbol}"
        end

        percent = meta["regularMarketChangePercent"]
        percent = percent_change(bars, close_price) if percent.nil?
        title = meta["longName"].to_s
        title = meta["shortName"].to_s if title.empty?
        title = Robinhood.get_company_name(symbol) if title.empty?
        market_cap = Robinhood.get_marketcap(symbol)
        fiftytoo_week = week_range(meta)

        Stock.new(symbol, open_price, close_price, percent, title, market_cap, fiftytoo_week)
    end

    def self.percent_change(bars, close_price)
        closes = Array(bars["close"]).compact
        previous_close = closes.length >= 2 ? closes[-2].to_f : 0
        raise "Yahoo Finance: no percent change" if previous_close.zero?

        (close_price.to_f - previous_close) / previous_close * 100
    end

    def self.week_range(meta)
        low = meta["fiftyTwoWeekLow"]
        high = meta["fiftyTwoWeekHigh"]
        return "0 - 0" if low.nil? || high.nil?

        "#{low} - #{high}"
    end
    private_class_method :percent_change, :week_range
end
