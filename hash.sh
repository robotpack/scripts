#/bin/bash

rm -rf auth.py && wget -q -N https://raw.githubusercontent.com/robotpack/scripts/GAM/auth.py

echo $1

gam create user $1 firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

python auth.py $1

