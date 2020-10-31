#/bin/bash

gam=/root/bin/gam/gam

echo $1

#$gam create user $1 firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

python auth.py $1

echo 'ok'

#$gam delete user $1
