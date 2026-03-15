# Shopify Product Extension (React-powered)

This is a Shopify Theme App Extension built with **React** as part of the Shopify Product Stats assignment. It integrates directly into the Shopify ecosystem as an App Block for the Product Page.

## Features
- **App Block Integration**: Can be added to any product page via the Shopify Theme Editor.
- **React Components**: Stats display is powered by a React component (`ProductStats.jsx`) for a dynamic and modern UI.
- **Real-time Stats**: Displays views and purchases (today) fetched from the Laravel backend.
- **Event Tracking**:
  - Automatically records a **Product View** event on page load.
  - Automatically records a **Purchase** event when the "Add to Cart" button is clicked.
- **Responsive Design**: Clean UI that matches Shopify's Polaris design system.

## Project Structure
- `extensions/product-stats/`: Contains the Theme App Extension.
- `extensions/product-stats/blocks/product_stats.liquid`: The entry point that mounts the React component.
- `extensions/product-stats/assets/product-stats-bundle.js`: The bundled React application.
- `src/components/ProductStats.jsx`: The React component logic.
- `src/index.js`: The React entry point.
- `shopify.app.toml`: App configuration.

## Setup Instructions

### 1. Prerequisites
- [Shopify CLI](https://shopify.dev/docs/apps/tools/cli) installed.
- Node.js (v18+) installed.
- A Shopify Partner account and a Development Store.

### 2. Installation & Bundling
1. Open your terminal in this directory.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Bundle the React code:
   ```bash
   npx esbuild src/index.js --bundle --minify --outfile=extensions/product-stats/assets/product-stats-bundle.js --loader:.js=jsx --loader:.jsx=jsx --platform=browser
   ```

### 3. Connect to Shopify
1. Link and start development:
   ```bash
   npx shopify app dev
   ```
2. Follow the prompts to select your partner account and development store.

### 4. Enable the Extension in Theme
1. Go to your Shopify Store Admin.
2. Navigate to **Online Store > Themes**.
3. Click **Customize** on your active theme.
4. Go to any **Product Page**.
5. Click **Add Block**.
6. Select **Product Stats Box**.
7. In the block settings, set the **Backend API URL** (e.g., `http://localhost:8000`).
8. Save the theme.

## How it Works
- **React**: The `ProductStats.jsx` component uses hooks to fetch statistics from the backend.
- **Bundling**: `esbuild` is used to bundle the React application into a single `.js` file for Shopify's `assets` folder.
- **Liquid Bridge**: The liquid file passes the `product.id` and `api_url` settings to the React component via data attributes.
