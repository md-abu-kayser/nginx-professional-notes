require 'yaml'
require 'net/http'

upstreams = YAML.load_file('upstreams.yml') # example: [ "http://10.0.0.1:80", "http://10.0.0.2:80" ]

upstreams.each do |url|
    begin
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        if response.code.to_i == 200
            puts "#{url} OK"
        else
            puts "#{url} DOWN (status #{response.code})"
        end
    rescue => e
        puts "#{url} DOWN (#{e.message})"
    end
end