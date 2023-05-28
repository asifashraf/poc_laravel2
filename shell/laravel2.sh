#!/bin/bash
action=$1
if [[ -z "$action" || "$action" == "--help" ]]; then
  echo  "== Laravel 2 == "
  echo  "comp complong compls complsall compfile"
  echo  "dk:- build, up, down, re, ls, info, bash, logs"
  echo  "g: push"
else
 case $action in

  "comp")
    docker ps -a --format "{{.Label \"com.docker.compose.project\"}}" | awk '!seen[$0]++ && NF' | sort
    ;;

  "complong")
	  docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Label "com.docker.compose.project"}}'
    ;;



  "compls")
    docker ps --filter "label=com.docker.compose.project=$2" --format "table {{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Ports}}"
    ;;


  "complsall")
    docker ps -a --filter "label=com.docker.compose.project=$2" --format "table {{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Ports}}"
    ;;


  "compfile")
	cat docker-compose.yml
    ;;


  "dkinfo")
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}\t{{.Command}}" | grep $2
    ;;


  "dklogs")
    docker logs -f  $2
    ;;


  "dkbash")
    docker exec -it $2 bash
    ;;

  "dkbuild")
    cd $p_l2
	  docker-compose build
  ;; 

  "dkup")
    cd $p_l2
	  docker-compose up -d
  ;;

  "dkdown")
    cd $p_l2
	  docker-compose down
  ;;

  "dkre")
    cd $p_l2
	  docker-compose restart
  ;;

  "dkls")
    cd $p_l2
	  docker-compose ls
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

