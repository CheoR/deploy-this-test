#!/bin/bash

# Script clears app tables from the postgreql db.
# Then recreates the migratoins and migrates to db.
# Then loads your data into the tables.

echo '\n==============='
echo 'Dropping tables'
echo '==============='
python manage.py migrate app1 zero
python manage.py migrate authtoken zero
python manage.py migrate auth zero

echo '\n========================'
echo 'Deleteing app migrations'
echo '========================'
rm -rf app1/migrations


echo '\n============================='
echo 'Running makemigrations on app'
echo '============================='
python3 manage.py makemigrations app1

echo '\n==============='
echo 'Running migrate'
echo '==============='
python3 manage.py migrate

# # python manage.py loaddata users
# # python manage.py loaddata tokens
# # python manage.py loaddata customers
# # python manage.py loaddata product_category
# # python manage.py loaddata product
# # python manage.py loaddata productrating
# # python manage.py loaddata payment
# # python manage.py loaddata order
# # python manage.py loaddata order_product
# # python manage.py loaddata favoritesellers

echo '\n================'
echo 'Loading fixtures'
echo '================'

python manage.py loaddata data/fixtures/users
python manage.py loaddata data/fixtures/tokens
python manage.py loaddata data/fixtures/appusers

echo '\n================'
echo 'DONE'
echo '================'