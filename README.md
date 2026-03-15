# Shopify Product Stats Assignment - Full Stack

This repository contains the full source code for the Shopify Technical Interview Assignment. It consists of two main components: a **Shopify Product Page Extension** and a **Laravel REST API Backend**.

## Project Structure

| Component | Path | Description |
|-----------|------|-------------|
| **Backend API** | `shopify-product-stats-backend/` | Laravel 11 project with REST endpoints and MySQL schema. |
| **Shopify Extension** | `shopify-product-extension/` | Shopify Extension project featuring React components and event tracking. |

## Quick Start

### 1. Backend Setup
Navigate to the `shopify-product-stats-backend` directory and follow these steps:
1. `composer install`
2. `cp .env.example .env` (Configure your MySQL database here)
3. `php artisan key:generate`
4. `php artisan migrate:fresh --seed`
5. `php artisan serve`

*Default Admin Credentials:*  
**Email:** `admin@admin.com`  
**Password:** `12345`

### 2. Extension Setup
Navigate to the `shopify-product-extension` directory and follow these steps:
1. `npm install`
2. Bundle React: `npx esbuild src/index.js --bundle --minify --outfile=extensions/product-stats/assets/product-stats-bundle.js --loader:.js=jsx --loader:.jsx=jsx --platform=browser`
3. `npx shopify app dev`
4. Enable the "Product Stats Box" in your Shopify Theme Editor.

## Requirements Checklist
- [x] **Shopify extension** on product page
- [x] **React components** for stats display
- [x] **Event tracking** (View & Purchase)
- [x] **Laravel REST API** endpoints
- [x] **MySQL** database design
- [x] **Input validation** and Clean controllers
- [x] **README** with setup/deployment instructions

---
**Candidate:** [Your Name/Email]  
**Submission Date:** March 15, 2026
