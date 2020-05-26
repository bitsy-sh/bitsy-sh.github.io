#!/usr/bin/env bash


case "$1" in
make)
  docker build -f ./Dockerfile \
    -t hugo \
    .
;;

serve)
  docker run -i -v $(pwd)/src:/src -p 1313:1313 hugo hugo server --disableFastRender -D --bind 0.0.0.0
;;
build)
  echo "bitsy.sh" > dist/CNAME
  docker run -it \
    -v $(pwd)/src:/src \
    -v $(pwd)/dist:/dist \
    hugo \
    hugo \
      -d /dist \
      -b https://bitsy.sh
;;
publish)
  git push origin `git subtree split --prefix dist src`:master --force
;;
*)
  docker run -i -v $(pwd)/src:/src hugo hugo "$@"

;;
esac
