
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




