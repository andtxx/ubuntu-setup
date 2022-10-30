function letsencrypt_ssl {
  header "Add letsencrypt ssl"

  read -p "Enter domain: " domain
  nginx_config=$(cat "$dir/lib/.nginx.config")
  nginx_config="${nginx_config//user/$USER}"
  nginx_config="${nginx_config//domain/$domain}"

  sudo echo $nginx_config >$domain
  sudo mv $domain /etc/nginx/sites-available/$domain
  sudo ln -sf /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/$domain
  sudo systemctl reload nginx

  mkdir www
  mkdir www/$domain
  echo "<h1>$domain</h1>" >www/$domain/index.html

  sudo apt install certbot python3-certbot-nginx
  sudo certbot --nginx -d $domain -d www.$domain
  sudo systemctl status certbot.timer
  sudo certbot renew --dry-run
}
