class Robinhood
    def self.get_company_info(ticker)
        doc = Nokogiri::HTML(open("https://robinhood.com/stocks/#{ticker}"))
        title = doc.css("h1").text.split(".")
        name = title[0]
    end 
end

# arkk = Robinhood.get_company_info("ARKK")
#=> "ARK Innovation ETF" 
# tsla = Robinhood.get_company_info("TSLA")
#=> "Tesla" 
# pypl = Robinhood.get_company_info("PYPL")
# => "PayPal" 