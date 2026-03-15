# Shopify Product Stats Backend

This is the Laravel REST API backend for the Shopify Product Stats assignment.

## Features
- **POST /api/product/view**: Record a product view.
- **POST /api/product/purchase**: Record a product purchase (Add to Cart).
- **GET /api/product/{id}/stats**: Retrieve today's views and purchases for a product.

## Local Setup
1. Clone the repository.
2. Install dependencies:
   ```bash
   composer install
   ```
3. Copy `.env.example` to `.env` and configure your database.
4. Generate application key:
   ```bash
   php artisan key:generate
   ```
5. Run migrations and seed the database:
   ```bash
   php artisan migrate:fresh --seed
   ```
6. Start the server:
   ```bash
   php artisan serve --no-reload
   ```

## Ubuntu Deployment Guide (Nginx + MySQL)

### 1. Update System
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install PHP 8.3 & Extensions
```bash
sudo apt install -y php8.3 php8.3-fpm php8.3-mysql php8.3-xml php8.3-curl php8.3-mbstring php8.3-zip
```

### 3. Install Nginx
```bash
sudo apt install -y nginx
```

### 4. Install MySQL
```bash
sudo apt install -y mysql-server
sudo mysql_secure_installation
```

### 5. Configure Nginx
Create a file `/etc/nginx/sites-available/candidate.api.example.com`:
```nginx
server {
    listen 80;
    server_name candidate.api.example.com;
    root /var/www/shopify-product-stats-backend/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```
Enable the site:
```bash
sudo ln -s /etc/nginx/sites-available/candidate.api.example.com /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### 6. SSL Configuration (Certbot)
```bash
sudo apt install snapd
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx -d candidate.api.example.com
```

### 7. Database Setup
```sql
CREATE DATABASE shopify_extensions;
CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON shopify_extensions.* TO 'laravel_user'@'localhost';
FLUSH PRIVILEGES;
```
Update your `.env` on the server with these credentials.
