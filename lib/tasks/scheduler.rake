require 'httparty'

desc "This task is called by the Heroku scheduler add-on"

task :fetch_candles do 
    puts "fetching candles"
    #get a list of the coins you need to use
    coins = CoinPair.all.pluck(:coin_pair_name)
    #iterate through each element of coins and make http request
    coins.each do |coin_pair|
        response = HTTParty.get("https://poloniex.com/public?command=returnChartData&currencyPair=#{coin_pair}&start=1405699200&end=9999999999&period=14400")
        response.parsed_response.each do |entry|
            entry[:coin_pair] = coin_pair
            entry[:quote_volume] = entry.delete "quoteVolume"
            entry[:weighted_avg] = entry.delete "weightedAverage"
            Candle.new do |c|
                c.
            end
        end
    end
    #save that in a variable
    #create new entry on Candle table with that data

end