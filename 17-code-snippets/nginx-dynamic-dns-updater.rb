require 'resolv'
require 'fileutils'

domain = ARGV[0] || 'backend.example.com'
cache_file = "/tmp/nginx_dns_cache_#{domain}"

new_ip = Resolv.getaddress(domain)
old_ip = File.exist?(cache_file) ? File.read(cache_file).strip : nil

if new_ip != old_ip
    puts "IP changed from #{old_ip} to #{new_ip}. Updating Nginx config and reloading."
    # Here you would rewrite the upstream block or use Nginx Plus API
    File.write(cache_file, new_ip)
    system('systemctl reload nginx')
else
    puts "No change (#{new_ip})"
end