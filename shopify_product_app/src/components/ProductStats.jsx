import React, { useState, useEffect } from 'react';

const ProductStats = ({ productId, apiUrl }) => {
  const [stats, setStats] = useState({ views_today: 0, purchases_today: 0 });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // 1. Record View
    fetch(`${apiUrl}/api/product/view`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ product_id: productId })
    });

    // 2. Fetch Stats
    fetch(`${apiUrl}/api/product/${productId}/stats`)
      .then(res => res.json())
      .then(data => {
        setStats(data);
        setLoading(false);
      })
      .catch(err => console.error("Error fetching stats:", err));
  }, [productId, apiUrl]);

  return (
    <div className="shopify-product-stats-box">
      {loading ? (
        <div className="stats-loading">Loading statistics (React)...</div>
      ) : (
        <div className="stats-content">
          <div className="stats-row" style={{display: 'flex', justifyContent: 'space-between', marginBottom: '5px'}}>
            <span className="stats-label" style={{fontWeight: '600', color: '#5c5f62'}}>Product Views:</span>
            <span className="stats-value">{stats.views_today}</span>
          </div>
          <div className="stats-row" style={{display: 'flex', justifyContent: 'space-between'}}>
            <span className="stats-label" style={{fontWeight: '600', color: '#5c5f62'}}>Purchases (Today):</span>
            <span className="stats-value">{stats.purchases_today}</span>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProductStats;
