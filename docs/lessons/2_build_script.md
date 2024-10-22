# Lesson 3: Create build script to deploy Laravel

1. Create `build.sh`

```bash
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

```

3. Change permissions of `build.sh` to allow for executable 

```bash
sudo chmod +x deploy.sh   
```

4. Commit changes to repo

5. Change Cloudways PHP version setting to use PHP 8.3

6. Change Cloudways webroot to `public_html/public`

7. SSH on VPS and create SSH key

```bash
 ssh-keygen -t rsa
 ```

8. Copy SSH key 
```bash
cat /home/master/.ssh/id_rsa.pub
```
9. Log in to GitHub and add key as deploy key

10. Set Git config

```bash
git config pull.rebase false
```

11. Make directory safe for git

```bash

pwd
/home/master/applications/ejpujunzye/public_html

git config --global --add safe.directory /home/1352768.cloudwaysapps.com/ejpujunzye/public_html
```
12. SSH into VPS and clone the app onto `public_html`

13. Run `./build.sh` to update app