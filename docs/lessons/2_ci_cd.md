
# Lesson 2: CI / CD

- Install PHPStan
- Configure GitHub actions
- Demonstrate CI
- Configure GitHub actions to deploy to Cloudways VPS

1. How to install PHPStan

```bash
composer require  phpstan/phpstan   --dev
composer require nunomaduro/larastan:^2.0 --dev
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

6. CI/CD to VPS