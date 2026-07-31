log_file = ARGV[0] || '/var/log/nginx/access.log'
requests = File.readlines(log_file)

ips = Hash.new(0)
urls = Hash.new(0)
statuses = Hash.new(0)
total_bytes = 0

requests.each do |line|
    # Combined format
    if line =~ /^(\S+) - .+ "(\S+) (\S+) \S+" (\d+) (\d+|-) /
        ip = $1
        method = $2
        url = $3
        status = $4.to_i
        bytes = $5 == '-' ? 0 : $5.to_i
        ips[ip] += 1
        urls[url] += 1
        statuses[status] += 1
        total_bytes += bytes
    end
end

puts "Total requests: #{requests.size}"
puts "Total bytes sent: #{total_bytes}"
puts "\nTop 10 IPs:"
ips.sort_by{|k,v| -v}.first(10).each {|ip,cnt| puts "  #{ip}: #{cnt}" }
puts "\nTop 10 URLs:"
urls.sort_by{|k,v| -v}.first(10).each {|u,c| puts "  #{u}: #{c}" }
puts "\nStatus Codes:"
statuses.sort.each {|code,cnt| puts "  #{code}: #{cnt}" }