#!/bin/bash

echo "Running deploy script \n"

echo "1/5 Pull new changes\n"
git pull origin main

echo "2/5 Create database if one isn't found \n"
touch database/database.sqlite

echo "3/5 Installing packages using composer\n"
composer install

echo "4/5 Publishing API Platform assets\n"
php artisan api-platform:install

echo "5/5 Migrating database\n"
php artisan migrate

echo "Site has been deployed!\n"

