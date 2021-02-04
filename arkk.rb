require 'rubygems'
require 'httparty'

require 'json'

class Twelvedata
    attr_accessor :arkk_open, :arkk_close
    include HTTParty
    base_uri "api.twelvedata.com/"

    def startup
        self.arkk
        self.tsla
        self.pypl
    end

    def stock
        stock = self.new
        stock.startup
        @stock = stock
    end 

    def arkk
        arkk_info = '/time_series?symbol=ARKK&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'
        
        var = self.class.get(arkk_info)
        @arkk_open = var["values"][0]["open"].to_i
        @arkk_close = var["values"][0]["close"].to_i
        @arkk_symbol = var["meta"]["symbol"]
        @arkk_percent = (100.0 * (@arkk_close - @arkk_open) / @arkk_open) * 100 
        puts "$ARKK DATA HAS BEEN UPDATED"
        return "------------------------"
    end 

    def arkk_open
        @arkk_open
    end 
    
    def arkk_close
        @arkk_close
    end 

    def arkk_symbol
        @arkk_symbol
    end 
 
    def arkk_percent_change
        (@arkk_percent).round / 100.0
    end  

    def tsla
        tsla_info = '/time_series?symbol=TSLA&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'

        var = self.class.get(tsla_info)

        @tsla_open = var["values"][0]["open"].to_i
        @tsla_close = var["values"][0]["close"].to_i
        @tsla_symbol = var["meta"]["symbol"]
        @tsla_percent = (100.0 * (@tsla_close - @tsla_open ) / @tsla_open) * 100 
        puts "$TSLA DATA HAS BEEN UPDATED"
        return "------------------------"
    end  

    def tsla_open
        @tsla_open
    end 
    
    def tsla_close
        @tsla_close
    end 

    def tsla_symbol
        @tsla_symbol
    end 
 
    def tsla_percent_change
        (@tsla_percent).round / 100.0
    end 

    def pypl
        pypl_info = '/time_series?symbol=PYPL&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'
        
        var = self.class.get(pypl_info)

        @pypl_open = var["values"][0]["open"].to_i
        @pypl_close = var["values"][0]["close"].to_i
        @pypl_symbol = var["meta"]["symbol"]
        @pypl_percent = (100.0 * (@pypl_close - @pypl_open) / @pypl_open) * 100 
        puts "stock DATA HAS BEEN UPDATED"
        return "------------------------"
    end  

    def pypl_open
        @pypl_open
    end 
    
    def pypl_close
        @pypl_close
    end 

    def pypl_symbol
        @pypl_symbol
    end 
 
    def pypl_percent_change
        (@pypl_percent).round / 100.0
    end 

end



class Arkk
  

    def initialize(stock)
        @stock = stock
    end 

    def call 
        puts "\e[H\e[2J"
        time = Time.new

        puts "Welcome to Ark Tracker"
        sleep(1)
        puts    "      in Cathie we trust"
        sleep(1)
        puts "---------------------------------------------"
        puts "$ARKK for #{time.strftime("%d/%m/%Y")}"
        puts "   $#{@stock.arkk_close} per share"
        puts "       $ARKK opened at $#{@stock.arkk_open} today"
        sleep(1)
        puts "---------------------------------------------"
        puts "ARKK intraday tracker availble for documents_week"
        sleep(1)
        puts "---------------------------------------------"
        puts "There have been no $TSLA trades within ARK for documents_week"
        puts "$TSLA transactions within ARK documents_week"
        sleep(1)
        puts "---------------------------------------------"
        puts "$TSLA buys: @tsla_buy}"
        puts "$TSLA sells: @tsla_sell}"
        sleep(1)
        puts "---------------------------------------------"

        self.menu
    end

    def done

        lucky = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]

        sample = lucky.sample(5)

        puts "\e[H\e[2J"
        sleep(0.5) 
        puts "#=>     ---------------------------------------"
        puts "#=>     Lucky Numbers: "
        puts "#=>        #{sample.sort}"
        puts "#=>     ---------------------------------------"
        sleep(1) 
        puts "#=>     Thank you for using Ark Tracker!"
        puts "#=>         May the odds be in your favor "    
        puts "#=>     ---------------------------------------"
        
    end

    def menu
        puts "To see all Ark ETF transactions for documents.week, type '1'"
        sleep(0.5)
        puts "To see $ARKK movement for this week, type '2'"
        sleep(0.5)
        puts "If you're feeling lucky, type '3'"
        sleep(0.5)
        puts "To see all of ARK Invest's $TSLA transactions, type '40'"
        sleep(0.5)
        puts "To exit Ark Tracker, type '0'"

        input = gets.chomp
        
        
        user_in = input.to_i

        
            case user_in
               
                when 0 
                    self.done
                when 2
                    self.arkk_move
                when 3 
                    self.cathie
                else
                    puts "\e[H\e[2J"
                    puts "invalid value. try again"
                    sleep(0.5)
                    self.menu
            end 

    end

    def arkk_move 
        puts "\e[H\e[2J"
        time = Time.new
            
        puts  "#=>     $ARKK Movement for #{time.strftime("%d/%m/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     ARK INNOVATION ETF"
        puts  "#=>       $#{@stock.arkk_close}"  
        puts  "#=>            #{@stock.arkk_percent_change}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>"

        self.menu
    end

    def cathie
        puts "\e[H\e[2J"
        time = Time.new
            
        puts  "#=>     ✩ Cathie's Pick ✩ #{time.strftime("%d/%m/%Y")}"
        puts  "#=>     ---------------------------------------"
        puts  "#=>     PAYPAL HOLDINGS INC"
        puts  "#=>       $#{@stock.pypl_close}"  
        puts  "#=>            #{@stock.arkk_percent_change}%"
        puts  "#=>     ---------------------------------------"
        puts  "#=>"

        self.menu
    end 

    File.open("","r") do |file|

    end

  
end 



