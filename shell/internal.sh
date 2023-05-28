#!/bin/bash
action=$1
if [[ -z "$action" || "$action" == "--help" ]]; then
  echo  "== Laravel 2 interanl == "
  echo  "v"
  echo "art: clear makeauth"
  echo "cpr: install"
  echo "db: mig"
else
 case $action in

  "v")
    cd /app
    php artisan --version
    ;;

  "artclear")
    cd /app
    php artisan optimize:clear
    ;;

  "artmakeauth")
    cd /app
    php artisan make:auth
    ;;

    "cprinstall")
    cd /app
    composer install
    ;;


    "dbmig")
    cd /app
    php artisan migrate
    ;;


  *)
    # Handle unknown or missing arguments
    echo "Invalid or missing argument. Please specify a valid action or use --help for usage information."
    ;;

    
 esac
fi

