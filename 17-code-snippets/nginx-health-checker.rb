require 'net/http'
require 'uri'

# Process check
unless system('pgrep nginx')
    puts "Nginx process not found!"
    exit 1
end

# HTTP check
url = ARGV[0] || 'http://localhost'
begin
    response = Net::HTTP.get_response(URI.parse(url))
    if response.code.to_i == 200
        puts "Nginx is healthy (HTTP #{response.code})"
        exit 0
    else
        puts "Nginx returned status #{response.code}"
        exit 1
    end
rescue => e
    puts "HTTP check failed: #{e.message}"
    exit 1
end