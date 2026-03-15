import React from 'react';
import ReactDOM from 'react-dom/client';
import ProductStats from './components/ProductStats';

const container = document.getElementById('react-product-stats');
if (container) {
  const productId = container.getAttribute('data-product-id');
  const apiUrl = container.getAttribute('data-api-url');
  
  const root = ReactDOM.createRoot(container);
  root.render(
    <React.StrictMode>
      <ProductStats productId={productId} apiUrl={apiUrl} />
    </React.StrictMode>
  );
}
