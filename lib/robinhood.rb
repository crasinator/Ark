class Robinhood
    def self.get_company_name(ticker)
        site = Nokogiri::HTML(URI.open("https://robinhood.com/stocks/#{ticker}"))
        heading = site.css("h1").text.split(".")
        company_name = heading[0]
    end 

    def self.get_marketcap(ticker)
        html = URI.open("https://robinhood.com/stocks/#{ticker}").read
        raw = html[/"market_cap":"(\d+(?:\.\d+)?)"/, 1]
        return "n/a" if raw.nil?

        amount = raw.to_f
        if amount >= 1_000_000_000_000
            format("$%.2fT", amount / 1_000_000_000_000)
        elsif amount >= 1_000_000_000
            format("$%.2fB", amount / 1_000_000_000)
        elsif amount >= 1_000_000
            format("$%.2fM", amount / 1_000_000)
        else
            format("$%.0f", amount)
        end
    end 
end

# arkk = Robinhood.get_company_info("ARKK")
#=> "ARK Innovation ETF" 
# tsla = Robinhood.get_company_info("TSLA")
#=> "Tesla" 
# pypl = Robinhood.get_company_info("PYPL")
# => "PayPal" 

