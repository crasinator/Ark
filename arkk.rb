class Arkk

    def initialize(doc)
        @arkk_share_price #defined
            #//find the most recent $ARKK Market Price 
        @arkk_percent_change
            #//finds the current intraday percentage chage for #{todays date}
        @all_transactions 
            #//all securities transactions 
        @all_sold = []
            #//securities sold for the week
        @all_buy = []
            #//securities bought for the week
        @all_ticker = []
            #//all tickers for the week
        @all_docs
            #//all 5 trading docs for the week 
        @hot_buy_tick
            #//returns the tick of the most bought stock 4 da week 
        @hot_sell_tick
            #//returns the tick of the most sold stock 4 da week
        @tsla.buy
            #//found $tsla transactions 
    end 

    def call 

        puts "Welcome to Ark Tracker"
        puts    "in Cathie we trust"

        if Arkk.market? == false 
            puts  "the NYSE is currently closed" 
        else
            puts "$ARKK for #{todays date}"
            puts "#{@arkk_share_price} per share"
                     #//finds the current share price from robinhood api 
            puts "#{@arkk_percent_change} today"
                     #//finds the current intraday percentage chage for #{todays date}
            puts "ARKK intraday tracker availble for #{documents.week}"
                     #//goes thru the fold of exiting trade documents 
        end

        if tesla? == false             
            puts "there have been no $TSLA trades within ARK for #{documents.week}"
        else 
            puts "$TSLA transactions within ARK #{documents.week}"
            puts "---------------------------------------------"
            puts "$TSLA buys: #{@tsla.buy}"
            puts "$TSLA sells: #{@tsla.sell}"
        end
    end

    def market? 
        #//return t/f to check if market is open 
        #//returns f when NYSE is closed (holidays/weekends/afterhours)
    end 
    
    def menu
        if tesla?
            puts "To see all Ark ETF transactions for #{documents.week}, type '1'"
            puts "To see $ARKK movement for this week, type '2'"
            puts "If you're feeling lucky, type 'lucky'"
            puts "To see all of ARK Invest's $TSLA transactions, type 'moon'"
    end 

    def arkk_share_price
            1. go to stock api 
            2. find $ARKK Market Price 
            3. store in @arkk_share_price
    end 

    def all_ticker 
        arr = []
        1. go thru each document, collect all tickers 
        2. @all_tickers  << arr.uniq
    end 
    
    def tesla?
    #//returns t/f if ark has traded $tsla for said range
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
    #// if there are tsla trades, return sold/bought count 
        1. find all $tsla transactions 
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
    #//returns all known tesla transactions 
    end 
    
    
    def all_sold 
    #//securities sold for the week
        1. go thru doc - direction 
        a. find buy and push into arr @all_buy
        b. find buy and push into arr @all_buy
        
        2. store in all transactions in @all_sold
    end
    
    def most_sold 
        1. go thru all sold, consolidate
        2. return "$" + the ticker with the highest number shares sold
            #=> $PLTR 
    end 

    
end 