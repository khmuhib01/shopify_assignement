import React, { useEffect, useState } from 'react';
import './App.css';
import { useParams } from 'react-router-dom';

const API_BASE_URL = 'http://127.0.0.1:8000';
const IMAGE_BASE_URL = API_BASE_URL + '/assets/img/';

function ProductStatsPage() {
	const { id } = useParams();
	const [stats, setStats] = useState(null);
	const [loading, setLoading] = useState(true);

	useEffect(() => {
		fetch(API_BASE_URL + `/api/product/${id}/stats`)
			.then(res => res.json())
			.then(data => {
				setStats(data.data);
				setLoading(false);
			})
			.catch(() => setLoading(false));
	}, [id]);

	if (loading) return <div className="centered-view">Loading...</div>;
	if (!stats) return <div className="centered-view">Stats not found.</div>;

	return (
		<div className="centered-view">
			<div className="product-view-card">
				<img src={IMAGE_BASE_URL + stats.image_url} alt={stats.product_name} className="product-view-image" />
				<div className="product-view-info">
					<h1>{stats.product_name}</h1>
					<p>{stats.description}</p>
					<p className="product-view-price">Price: ${stats.price}</p>
						<p>Status: {stats.status}</p>
						
						<p>Views Today: {stats.views_today_count}</p>
						<p>Purchases Today: {stats.purchases_today_count}</p>
						
				</div>
			</div>
		</div>
	);
}

export default ProductStatsPage;
