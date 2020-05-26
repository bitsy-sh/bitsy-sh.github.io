#!/usr/bin/env bash


case "$1" in
make)
  docker build -f ./Dockerfile \
    -t hugo \
    .
;;

serve)
  docker run -it -v $(pwd)/src:/site -p 1313:1313 hugo hugo server -D
;;
build)
  rm -r dist/*
  echo "bitsy.sh" > dist/CNAME
  docker run -it \
    -v $(pwd)/src:/site \
    -v $(pwd)/dist:/dist \
    -p 1313:1313 \
    hugo \
    hugo \
      -b https://bitsy.sh \
      -d /dist
;;
--)

    ;;
*)
    echo "Programming error"
    exit 3
    ;;
  esac
