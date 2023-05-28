#!/bin/bash
action=$1
if [[ -z "$action" || "$action" == "--help" ]]; then
  echo "== Laravel 2 interanl == "
  echo "v"
  echo "artisan(art):   clear, makeauth"
  echo "composer(cpr):  install"
  echo "db(db):         mig"
  echo "node(n):        install, dev, watch"

else
 case $action in

  "v")
    cd /app
    php artisan --version
    ;;

  "art.clear")
    cd /app
    php artisan optimize:clear
    ;;

  "art.makeauth")
    cd /app
    php artisan make:auth
    ;;

  "cpr.install")
    cd /app
    composer install
    ;;


  "db.mig")
    cd /app
    php artisan migrate
    ;;

  "n.install")
    cd /app
    npm install
    ;;

  
  "n.dev")
    cd /app
    npm install
    ;;

  "n.watch")
    cd /app
    npm run watch
    ;;

  *)
    # Handle unknown or missing arguments
    echo "Invalid or missing argument. Please specify a valid action or use --help for usage information."
    ;;

    
 esac
fi

