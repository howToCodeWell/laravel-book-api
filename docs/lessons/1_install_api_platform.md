
# Lesson 1: Install and host the API platform

- Install Laravel and the API platform
- Configure the API
- Host the API on Cloudways

1. How to install Laravel

```bash
composer create-project laravel/laravel books-app
cd books-app
```

2. How to install API platform

```bash
# Install api-platform
composer require api-platform/laravel

# publish assets
php artisan api-platform:install

# Serve website
php artisan serve

# Publishing api-platform config
php artisan api-platform:install
```

3. How to update the database
```bash
# Create book model
php artisan make:model Book

# Create book migration
php artisan make:migration create_books_table

# Add to database/migrations/<timestamp>_create_books_table.php migration
$table->string('isbn')->nullable();
$table->string('title');
$table->text('description');
$table->string('author');
$table->date('publication_date')->nullable();


# Run migration
php artisan migrate
```


4. Updating model
```bash
# Update app/Models/Book.php

# Add namespace 
# use ApiPlatform\Metadata\ApiResource

# Add class attribute
#[ApiResource]

```

5. Open site http://127.0.0.1:8000/api/ in browser

6. Make requests to http://127.0.0.1:8000/api/books via Postman

## Cloudways

7. Login to Cloudways and add a server with the following details:
- Application = PHP Custom App
- Application name = book-app
- Server name = demo
- Project = book-app
- Server = DigialOcean
- Server size = 1GB
- Location = London

8. From Servers -> demo -> Settings and Packages -> Packages update the PHP version to PHP 8.3

9. From Applications -> book-app -> Application Settings Change the webroot from `public_html` to `public_html/public`

10. From Applications -> book-app -> Deployment via Git click on Generate SSH Keys

11. Once SSH keys have been created view and copy key

## GitHub

12. Log in to GitHub and go to repository `https://github.com/howToCodeWell/laravel-book-api`

13. From Settings -> Deploy keys click add deploy key

14. Paste copied key and give it the title of `Cloudways`. Click on add key.

## Cloudways

15. From Applications -> book-app -> Deployment via Git add git remote address `git@github.com:howToCodeWell/laravel-book-api.git` and click authenticate

16. From Applications -> book-app -> Deployment via Git select main branch and click start deployment


## SSH
17. SSH onto the VPN use credentials found in  Servers -> demo -> Master Credentials

18. Go to applications/<app>/public_html

19. SSH onto the VPS copy `.env.test` to `.env` 

20. Create database file `touch database/database.sqlite`

21. Install composer `composer install`

22. Install assets `php artisan api-platform:install`

23. Migrate the database `php artisan migrate`

24. View app in browser 