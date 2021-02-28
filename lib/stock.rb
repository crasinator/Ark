class Stock 
    attr_accessor :ticker, :open, :close, :title, :market_cap, :fiftytoo_week
    attr_reader :fiftytoo_week_low, :fiftytoo_week_high

    @@all = []

    def initialize(ticker, open, close, percent, title, market_cap, fiftytoo_week)
        @ticker = ticker
        @open = open 
        @close = close.to_f.round(2)
        @percent = percent 
        @title = title
        @market_cap = market_cap
        @fiftytoo_week = fiftytoo_week
        @fiftytoo_week_low = @fiftytoo_week.split(" - ")[0].to_f.round(2)
        @fiftytoo_week_high = @fiftytoo_week.split(" - ")[1].to_f.round(2)
        @@all << self 
    end 

    def display_fiftytoo_week_range
       "52 Week Range #{@fiftytoo_week_low} - #{@fiftytoo_week_high}"
    end 

    def percent
        (@percent).round / 100.0
    end 

    def self.all 
        @@all 
    end 

end