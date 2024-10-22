#!/bin/bash

echo "Running deploy script"

echo "[1/4] Pulling from github"
git pull origin

echo "[1/5] Creating database if one isn't found"
touch database/database.sqlite

echo "[2/6] Installing packages using composer"
composer install

echo "[3/7] Publishing API Platform assets"
php artisan api-platform:install

echo "[4/8] Migrating database"
php artisan migrate --force 

echo "Site has been deployed!"
