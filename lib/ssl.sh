function letsencrypt_ssl {
  read -p 'Enter domain: ' domain
  nginx_config=$(cat ./lib/.nginx.config)
  nginx_config="${nginx_config//user/$USER}"
  nginx_config="${nginx_config//domain/$domain}"

  sudo echo $nginx_config >/etc/nginx/sites-availables/$domain
  sudo ln -sf /etc/nginx/sites-availables/$domain /etc/nginx/sites-enabled/$domain
  sudo systemctl reload nginx

  sudo apt install certbot python3-certbot-nginx
  sudo certbot --nginx -d $domain -d www.$domain
  sudo systemctl status certbot.timer
  sudo certbot renew --dry-run
}
