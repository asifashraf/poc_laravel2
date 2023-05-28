#!/bin/bash
action=$1
if [[ -z "$action" || "$action" == "--help" ]]; then
  echo  "== Laravel 2 == "
  echo  "dk: up"
  echo  "g: push"
else
 case $action in

  "hi")
	    echo "-- hi --"
  ;;
 
  "dkup")
    cd $p_l2
	  docker-compose up -d
  ;;

  "gpush")
    cd $p_l2
	  git add .
    git commit -m "$2"
    git push 
  ;;

  *)
    # Handle unknown or missing arguments
    echo "Invalid or missing argument. Please specify a valid action or use --help for usage information."
    ;;

    
 esac
fi

