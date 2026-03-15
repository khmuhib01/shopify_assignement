# Shopify Product Stats Extension

This is a Shopify Theme App Extension built as part of the Shopify Product Stats assignment. It integrates directly into the Shopify ecosystem as an App Block for the Product Page.

## Features
- **App Block Integration**: Can be added to any product page via the Shopify Theme Editor.
- **Real-time Stats**: Displays views and purchases (today) fetched from the Laravel backend.
- **Event Tracking**:
  - Automatically records a **Product View** event when the page loads.
  - Automatically records a **Purchase** event when the "Add to Cart" button is clicked.
- **Responsive Design**: Matches the Shopify Polaris look and feel.

## Project Structure
- `extensions/product-stats/`: Contains the Theme App Extension.
- `extensions/product-stats/blocks/product_stats.liquid`: The core logic for tracking and display.
- `extensions/product-stats/shopify.extension.toml`: Extension configuration.

## Setup Instructions

### 1. Prerequisites
- [Shopify CLI](https://shopify.dev/docs/apps/tools/cli) installed.
- A Shopify Partner account and a Development Store.

### 2. Connect to Shopify
1. Open your terminal in this directory.
2. Link the app to your Shopify Partner account:
   ```bash
   npx shopify app config link
   ```
3. Deploy the extension to Shopify:
   ```bash
   npx shopify app deploy
   ```

### 3. Enable the Extension in Theme
1. Go to your Shopify Store Admin.
2. Navigate to **Online Store > Themes**.
3. Click **Customize** on your active theme.
4. Go to any **Product Page**.
5. Click **Add Block** (usually under Product Information).
6. Select **Product Stats Box**.
7. In the block settings, set the **Backend API URL** (e.g., your local Laravel URL or production domain).
8. Save the theme.

## How it Works
- **Liquid**: Uses `{{ product.id }}` to get the current context.
- **JavaScript**: Uses `fetch()` to communicate with the Laravel REST API.
- **Event Listeners**: Attaches a listener to the theme's "Add to Cart" form to track purchases without requiring custom theme code edits.
