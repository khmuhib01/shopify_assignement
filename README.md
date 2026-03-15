# Shopify Product Stats Assignment

This repository contains both the Backend API and the Shopify Theme App Extension for the Product Stats assignment.

## Project Structure
- **/shopify_product_laravel**: Laravel REST API backend.
- **/shopify_product_app**: Shopify Theme App Extension.

## Quick Links
- [Backend Documentation & Deployment Guide](./shopify_product_laravel/README.md)
- [Shopify Extension Setup Guide](./shopify_product_app/README.md)

## How to Run Locally

### 1. Start Backend API
```bash
cd shopify_product_laravel
php artisan serve --no-reload
```
- **Login**: admin@admin.com / 12345
- **Stats URL**: http://127.0.0.1:8000/api/product/1/stats

### 2. Run Shopify Extension
```bash
cd shopify_product_app
npx shopify app dev
```
Or test manually using the [Test Page](./test_extension.html).

### 3. Database
- MySQL database: `shopify_extensions`
- Seeders included for Admin and Products.
