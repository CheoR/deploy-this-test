#!/bin/bash

# Script clears tables from the postgreql db.
# Then recreates the migrations and migrates to db.
# Then loads your data into the tables with fixtures.
#
# tablesArray - array of tabes to drop
# fixturesArray - array of fixtures to load
# -e enables interpretation of backslash escapes
#
# Use:
#  $ bash seed_data.sh
#
######################
# Data Order Example #
######################
# python manage.py loaddata users
# python manage.py loaddata tokens
# python manage.py loaddata customers
# python manage.py loaddata product_category


# Scipt will only apply to this app
appName="app1"
pathToFixtures="data/fixtures"


declare -a tablesArray=($appName "authtoken" "auth" )
declare -a fixturesArray=("users" "tokens" "appusers")


echo -e '\n==============='
echo 'Dropping tables'
echo '==============='

for val in ${tablesArray[@]}; do
   echo -e "\n*************"
   echo "Dropping $val"
   echo "*************"
   python manage.py migrate $val zero
done


echo -e '\n========================'
echo 'Deleteing app migrations'
echo '========================'
rm -rf $appName/migrations


echo -e '\n============================='
echo 'Running makemigrations on app'
echo '============================='
python3 manage.py makemigrations $appName


echo -e '\n==============='
echo 'Running migrate'
echo '==============='
python3 manage.py migrate



echo -e '\n================'
echo 'Loading fixtures'
echo '================'

for fixture in ${fixturesArray[@]}; do
   echo -e "\n*************"
   echo "Loading $fixture"
   echo "*************"
   python manage.py loaddata $pathToFixtures/$fixture
done

echo -e '\n================'
echo 'DONE'
echo '================'