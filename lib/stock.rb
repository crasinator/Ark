class Stock 
    attr_accessor :ticker, :open, :close, :title

    @@all = []

    def initialize(ticker, open, close, percent, title)
        @ticker = ticker
        @open = open 
        @close = close 
        @percent = percent 
        @title = title
        @@all << self 
    end 

    def percent
        (@percent).round / 100.0
    end 

    def self.all 
        @@all 
    end 

end