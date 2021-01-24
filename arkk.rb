class Arkk

    def initialize(doc)
        @all_transations 
            //all securities transations 
        @all_sold = []
            //securities sold for the week
        @all_buy = []
            //securities bought for the week
        @all_ticker = []
            //all tickers for the week
        @all_docs
            //all 5 trading docs for the week 
        @hot_buy_tick
            //returns the tick of the most bought //stock 4 da week 
        @hot_sell_tick
            //returns the tick of the most sold stock 4 da week
        @tsla.buy
            //found $tsla transations 
    end 

    def all_ticker 
        arr = []
        1. go thru each document, collect all tickers 
        2. @all_tickers  << arr.uniq
    end 
    
    def tesla?
      //returns t/f if ark has traded $tsla for said range
        var = @all_ticker.find do |ticker|
            ticker == "TSLA"
        end
            if var == nil 
                false 
            else 
                true 
            end 
    end 
    
    def tsla 
        // if there are tsla trades, return sold/bought count 
    1. find all $tsla transations 
        a. go thru each doc
        b. find ticker tsla; collect all info in that row 
            *seperate buys and sells 
            *add the total shares for each row 
                // #=> [ticker: $tsla {
                // #=> 			buys: #{sum of "shares" cells where "direction" == buy}
                // #=>          sells: #{sum of "shares" cells where "direction" == sell}
    2. @tsla.buy << $tsla buys 
    3. @tsla.sell << $tsla sells
    
    end
    
    def self.tesla
        //returns all known tesla transations 
    end 
    
    
    def all_sold 
        ////securities sold for the week
    1. go thru doc - direction 
     a. find buy and push into arr @all_buy
     b. find buy and push into arr @all_buy
    
    2. store in all transations in @all_sold
    
    end
    
    end 