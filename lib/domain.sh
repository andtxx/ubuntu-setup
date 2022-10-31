function write_config {
  nginx_config=$(cat "$1")
  nginx_config="${nginx_config//USER/$USER}"
  nginx_config="${nginx_config//DOMAIN/$domain}"

  sudo echo $nginx_config >$domain
  sudo mv $domain /etc/nginx/sites-available/$domain
  sudo ln -sf /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/$domain
  sudo systemctl reload nginx
}

function domain_with_ssl {
  header "Setting domain with letsencrypt ssl"

  read -p "Enter domain: " domain

  write_config "$dir/lib/.nginx.conf"

  mkdir www
  mkdir www/$domain
  echo "<h1>$domain</h1>" >www/$domain/index.html

  sudo apt install certbot python3-certbot-nginx
  sudo certbot --nginx -d $domain -d www.$domain
  sudo systemctl status certbot.timer
  sudo certbot renew --dry-run

  write_config "$dir/lib/.nginx.ssl.conf"
}
