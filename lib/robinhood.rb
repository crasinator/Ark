class Robinhood
    def self.get_company_name(ticker)
        site = Nokogiri::HTML(open("https://robinhood.com/stocks/#{ticker}"))
        heading = site.css("h1").text.split(".")
        
        company_name = heading[0]
    end 

    def self.get_marketcap(ticker)
        site = Nokogiri::HTML(open("https://robinhood.com/stocks/#{ticker}"))
        titles = site.css(".css-6e9jx2").text
        arr = titles.split("Market Cap")
        values = arr[1].split("Price")
        marketcap = values[0]
    end 
end



# arkk = Robinhood.get_company_info("ARKK")
#=> "ARK Innovation ETF" 
# tsla = Robinhood.get_company_info("TSLA")
#=> "Tesla" 
# pypl = Robinhood.get_company_info("PYPL")
# => "PayPal" 

