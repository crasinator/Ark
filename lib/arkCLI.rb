class ArkCLI

    def initialize(logic)
        @logic = logic
        @watchlist = []
    end 

    def call 
        @time = DateTime.now
        @arkk = fetch("ARKK")
        exit 1 if @arkk.nil?

        puts "\e[H\e[2J"
        puts "Welcome to Ark Tracker"
        puts    "      in Cathie we trust"
        puts "---------------------------------------------"
        puts "$ARKK for #{@time.strftime("%m/%d/%Y")}"
        puts "  $#{@arkk.close} per share"
        puts "      $ARKK opened at $#{@arkk.open} today"
        puts "---------------------------------------------"
        puts "ARKK intraday tracker available"
        puts "  #{@logic.buy_share_count} shares purchased "
        puts "      #{@logic.sell_share_count} shares sold "
        puts "---------------------------------------------"

        self.menu
    end

    def menu
        puts "---------------------------------------------"
        puts "To see all Ark ETF transactions, type '1'"
        puts "To see $ARKK movement, type '2'"
        puts "To see $TSLA movement, type '3'"
        puts "To see a sell recommendation, type '4'"
        puts "To see a buy recommendation, type '5'"
        puts ""
        puts "Any other input will exit Ark Tracker"

        input = gets.chomp
        user_in = input.to_i
    
        case user_in
            when 0 
                self.done
            when 1 
                self.etf 
            when 2
                self.arkk_move
            when 3 
                self.tsla_move
            when 4
                self.sell_now
            when 5
                self.buy_now
            else
                self.done
        end 
    end

    def etf 
        puts "\e[H\e[2J"

        puts  "        Ark Investments"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     Ark has increased positions in:"
        puts  "         #{@logic.buy_list}"     
        puts  "#=>     ---------------------------------------"
        puts  "#=>     Ark has decreased positions in:"
        puts  "         #{@logic.sell_list}"  
        
        self.menu
    end 

    def arkk_move 
        puts "\e[H\e[2J"
            
        puts  "#=>     $ARKK Movement for #{@time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{@arkk.title} [ $#{@arkk.ticker} ]"
        puts  "#=>       $#{@arkk.close}"  
        puts  "#=>            #{@arkk.percent}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{@arkk.display_fiftytoo_week_range}"
        puts  "#=>       Market Cap: #{@arkk.market_cap}"

        self.add_to_watchlist(@arkk)
    end

    def tsla_move
        puts "\e[H\e[2J"

        tsla = fetch("TSLA")
        return self.menu if tsla.nil?

        puts  "#=>     $TSLA Movement for #{@time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{tsla.title} [ $#{tsla.ticker} ]"
        puts  "#=>       $#{tsla.close}"  
        puts  "#=>            #{tsla.percent}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{tsla.display_fiftytoo_week_range}"
        puts  "#=>       Market Cap: #{tsla.market_cap}"

        self.add_to_watchlist(tsla)
    end 

    def buy_now
        puts "\e[H\e[2J"

        ticker = @logic.question_box
        pick = fetch(ticker)
        return self.menu if pick.nil?
            
        puts  "#=>     Buy Recommendation #{@time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.title} [ $#{pick.ticker} ]" 
        puts  "#=>       $#{pick.close}"  
        puts  "#=>            #{pick.percent}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.display_fiftytoo_week_range}"
        puts  "#=>       Market Cap: #{pick.market_cap}"

        self.add_to_watchlist(pick)
    end 

    def cathie
        puts "\e[H\e[2J"

        ticker = @logic.question_box
        pick = fetch(ticker)
        return if pick.nil?
            
        puts  "#=>     ✩ Cathie's Pick ✩ #{@time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.title} [ $#{pick.ticker} ]" 
        puts  "#=>       $#{pick.close}"  
        puts  "#=>            #{pick.percent}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.display_fiftytoo_week_range}"
        puts  "#=>       Market Cap: #{pick.market_cap}"
        puts   ""
    end 

    def sell_now 
        puts "\e[H\e[2J"

        ticker = @logic.bowser_box
        pick = fetch(ticker)
        return self.menu if pick.nil?
            
        puts  "#=>     Sell Recommendation #{@time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.title} [ $#{pick.ticker} ]" 
        puts  "#=>       $#{pick.close}"  
        puts  "#=>            #{pick.percent}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     #{pick.display_fiftytoo_week_range}"
        puts  "#=>       Market Cap: #{pick.market_cap}"

        self.add_to_watchlist(pick)
    end 

    def done
        puts "\e[H\e[2J"

        self.cathie

        lucky = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
        sample = lucky.sample(5)

        puts ""
        puts "#=>     Lucky Numbers: "
        puts "#=>        #{sample.sort}"
        puts "#=>     ---------------------------------------"
        puts "#=>     Thank you for using Ark Tracker!"
        puts "#=>         May the odds be in your favor "   
        puts ""
        
        if @watchlist.count == 0 
            puts "Nothing was added to watchlist"   
        else 
            puts "Watchlist:"
            @watchlist.each do |x|
            puts "       ✩ #{x}"
            end 
        end 

        puts ""
    end

    def fetch(ticker)
        ArkQuote.get_stock_info(ticker)
    rescue StandardError => e
        puts e.message
        nil
    end

    def add_to_watchlist(stock)
        puts  ""
        puts  "Add to watchlist? (y/n)"

        input = gets.strip 

        case input 
        when "y"
            @watchlist << "#{stock.title} [ $#{stock.ticker} ]"
            puts "  Added [ $#{stock.ticker} ]"
            self.menu
        when "yes"
            @watchlist << "#{stock.title} [ $#{stock.ticker} ]"
            puts "  Added [ $#{stock.ticker} ]"
            self.menu
        else 
            self.menu
        end 
    end 

end 

