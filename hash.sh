#/bin/bash

echo $1

gam=/root/bin/gam/gam

gcloud auth revoke $1

$gam delete user $1

command=""
command=" ${command} echo -e '"${verde}"' "
command=" ${command} $data "'$(pwd)'" $conta ON "'$(ps -o etime= -C "Hash-Maker")'"  "
command=" ${command} '"${padrao}"' ;"
command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ]  && echo -e '"${vermelho}"'$data $conta Hash-Maker erro!'"${padrao}"' ;"
command=" ${command} [ ! -e '.customize_environment' ] && echo -e '"${vermelho}"'$data $conta .customize_environment erro!'"${padrao}"' ;"
command=" ${command} [ ! -e 'CORE/build/config.json' ] && echo -e '"${vermelho}"'$data $conta config.json erro!'"${padrao}"' ;"
command=" ${command} echo $conta > email ;"

command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ] || [ ! -e '.customize_environment' ] &&"
command=" ${command} sudo rm -rf * &&"
command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/start.sh &&"
command=" ${command} chmod 777 start.sh && ./start.sh $conta &&"
command=" ${command} echo -e '"${amarelo}"'$data "'$(pwd)'" $conta Install ok!'"${padrao}"' ;"
command=" ${command} sleep 1 ; exit"

$gam create user $1 firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

sleep 10

python auth.py $1

sleep 1

gcloud beta cloud-shell ssh --boosted --command="$command" --account=$1 --authorize-session --force-key-file-overwrite

sleep 1
