require 'net/http'
require 'uri'
require 'thread'

url = ARGV[0] || 'http://localhost'
concurrency = (ARGV[1] || 10).to_i
results = Queue.new

threads = concurrency.times.map do
    Thread.new do
        begin
            uri = URI(url)
            response = Net::HTTP.get_response(uri)
            results << response.code
        rescue => e
            results << "ERROR: #{e}"
        end
    end
end
threads.each(&:join)

counts = Hash.new(0)
concurrency.times { counts[results.pop] += 1 }
puts "Results:"
counts.each { |code, cnt| puts "  #{code}: #{cnt}" }
puts "Rate limit hit? #{counts['429'] || 0} requests got 429."