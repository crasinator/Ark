class ArkCLI

    def initialize(api, logic)
        @api = api
        @logic = logic
    end 

    def call 
        puts "\e[H\e[2J"
        time = DateTime.now

        puts "Welcome to Ark Tracker"
        sleep(1)
        puts    "      in Cathie we trust"
        sleep(1)
        puts "---------------------------------------------"
        puts "$ARKK for #{time.strftime("%m/%d/%Y")}"
        puts "  $#{@api.arkk_close} per share"
        puts "      $ARKK opened at $#{@api.arkk_open} today"
        sleep(1)
        puts "---------------------------------------------"
        puts "ARKK intraday tracker availble"
        puts "  #{@logic.buy_share_count} shares purchased "
        puts "      #{@logic.sell_share_count} shares sold "
        sleep(1)
        puts "---------------------------------------------"

        self.menu
    end

    def menu
        puts "---------------------------------------------"
        sleep(0.5)
        puts "To see all Ark ETF transactions, type '1'"
        sleep(0.5)
        puts "To see $ARKK movement, type '2'"
        sleep(0.5)
        puts "To see $TSLA movement, type '3'"
        sleep(0.5)
        puts "If you're feeling lucky, type '4'"
        sleep(0.5)
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
                    self.cathie
                else
                    self.done
            end 

    end

    def etf 
        puts "\e[H\e[2J"

        puts  "        Ark Investments"
        puts  "#=>     ---------------------------------------"
        sleep(0.5)
        puts  "#=>     Ark has increased positions in:"
        puts  "         #{@logic.buy_list}"     
        sleep(0.5)     
        puts  "#=>     ---------------------------------------"
        puts  "#=>     Ark has decreased positions in:"
        puts  "         #{@logic.sell_list}"  
        
        self.menu
    end 

    def arkk_move 
        puts "\e[H\e[2J"

        time = DateTime.now
            
        puts  "#=>     $ARKK Movement for #{time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     ARK INNOVATION ETF"
        puts  "#=>       $#{@api.arkk_close}"  
        puts  "#=>            #{@api.arkk_percent_change}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>"

        self.menu
    end

    def tsla_move
        puts "\e[H\e[2J"

        time = DateTime.now

        puts  "#=>     $TSLA Movement for #{time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     Tesla, Inc."
        puts  "#=>       $#{@api.tsla_close}"  
        puts  "#=>            #{@api.tsla_percent_change}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>"

        self.menu
    end 

    def cathie
        puts "\e[H\e[2J"
        
        time = DateTime.now
            
        puts  "#=>     ✩ Cathie's Pick ✩ #{time.strftime("%m/%d/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     PAYPAL HOLDINGS INC"
        puts  "#=>       $#{@api.pypl_close}"  
        puts  "#=>            #{@api.arkk_percent_change}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>"

        self.menu
    end 

    def done
        puts "\e[H\e[2J"

        lucky = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
                10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
                20, 21, 22, 23, 24, 25,26, 27, 28, 29, 
                30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 
                40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
                50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 
                60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 
                70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 
                80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 
                90, 91, 92, 93, 94, 95, 96, 97, 98, 99]

        sample = lucky.sample(5)
    
        puts "#=>     ---------------------------------------"
        puts "#=>     Lucky Numbers: "
        puts "#=>        #{sample.sort}"
        puts "#=>     ---------------------------------------"
        puts "#=>     Thank you for using Ark Tracker!"
        puts "#=>         May the odds be in your favor "    
        puts "#=>     ---------------------------------------"
    end

end 
