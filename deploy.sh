#!/bin/bash

echo "Running deploy script \n"

echo "1/4 Pull new changes\n"
git pull origin main

echo "3/4 Create database if one isn't found \n"
touch database/database.sqlite

echo "2/4 Installing packages using composer\n"
composer install

echo "4/4 Publishing API Platform assets\n"
php artisan api-platform:install

echo "5/4 Migrating database\n"
php artisan migrate

echo "Site has been deployed!\n"

