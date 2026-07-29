require 'yaml'

config = YAML.load_file(ARGV[0] || 'services.yml')
puts "upstream backend {"
config['backends'].each do |server|
    puts "  server #{server};"
end
puts "}"

puts "\nserver {"
puts "  listen 80;"
puts "  server_name #{config['domain']};"
config['locations'].each do |loc|
    puts "  location #{loc['path']} {"
    puts "    proxy_pass http://backend#{loc['backend_suffix']};"
    if loc['websocket']
        puts "    proxy_http_version 1.1;"
        puts '    proxy_set_header Upgrade $http_upgrade;'
        puts '    proxy_set_header Connection "upgrade";'
    end
    puts "  }"
end
puts "}"