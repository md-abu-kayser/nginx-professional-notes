require 'time'
require 'open3'

domains = ['example.com', 'www.example.com']
cert_dir = '/etc/letsencrypt/live'

domains.each do |domain|
    cert_file = "#{cert_dir}/#{domain}/fullchain.pem"
    next unless File.exist?(cert_file)
    expire_date = `openssl x509 -enddate -noout -in #{cert_file}`.chomp.split('=')[1]
    next unless expire_date
    expire = Time.parse(expire_date)
    days_left = (expire - Time.now) / 86400
    puts "#{domain}: #{days_left.to_i} days left"
    if days_left < 30
        puts "Renewing #{domain}..."
        system("certbot renew --cert-name #{domain} --quiet --deploy-hook 'systemctl reload nginx'")
    end
end