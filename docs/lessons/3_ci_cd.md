
# Lesson 2: CI / CD

- Install PHPStan
- Configure GitHub actions
- Demonstrate CI
- Configure GitHub actions to deploy to Cloudways VPS

1. How to install PHPStan

```bash
composer require phpstan/phpstan --dev
composer require larastan/larastan --dev
```

2. How to configure PHPStan

```bash
# Create config file

touch phpstan.neon

# Add the following config to phpstan.neon
includes:
    - vendor/larastan/larastan/extension.neon

parameters:

    paths:
        - app/

    level: 5

```

3. How to run PHPStan

```bash
 ./vendor/bin/phpstan analyse    
```


4. How to run PHPUnit

```bash
 ./vendor/bin/phpunit    
```


5. How to create GitHub actions

```bash
# Create workflow file

touch .github/workflows/main.yml

```

6. Create pipeline for main and develop

```bash
name: Build, test and deploy

on:
  push:
    branches: [ main ]
```

8. Add APP_KEY to env.example
```bash
APP_KEY=base64:d9a9xJWd3Zn6aBuApVpYTrtGZwyfIC+EErLA7zNh1vg=
```

7. Create build job
```bash
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        
      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: 8.3

      - name: Create database
        run: touch ./database/database.sqlite

      - name: Copy .env
        run: cp .env.test .env

      - name: Install app
        run: composer install

      - name: Run migrations
        run: php artisan migrate

      - name: Test PHPStan
        run: ./vendor/bin/phpstan analyse

      - name: Test PHPUnit
        run: ./vendor/bin/phpunit



```

8. Create deploy job


6. CI/CD to VPS