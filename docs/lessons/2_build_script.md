# Lesson 3: Create build script to deploy Laravel

1. Create `build.sh`

```bash
#!/bin/bash

echo "Running deploy script"

echo "[1/5] Pulling from GitHub"
git pull origin

echo "[2/5] Creating database if one isn't found"
touch database/database.sqlite

echo "[3/5] Installing packages using composer"
composer install

echo "[4/5] Publishing API Platform assets"
php artisan api-platform:install

echo "[5/5] Migrating database"
php artisan migrate --force

echo "The app has been built!"

```

3. Change permissions of `build.sh` to allow for executable 

```bash
sudo chmod +x build.sh   
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

14. `ssh  master_pfgrjtrjsv@54.225.152.93 'cd /home/master/applications/bwjdzjxpkt/public_html && ./build.sh'`
