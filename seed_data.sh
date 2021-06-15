#!/bin/bash

# Update this file for your project

# rm -rf deploy_test/migrations
# rm db.sqlite3
python manage.py makemigrations deploy_test
# python manage.py migrate
# python manage.py loaddata users
# python manage.py loaddata tokens
# python manage.py loaddata customers
# python manage.py loaddata product_category
# python manage.py loaddata product
# python manage.py loaddata productrating
# python manage.py loaddata payment
# python manage.py loaddata order
# python manage.py loaddata order_product
# python manage.py loaddata favoritesellers
