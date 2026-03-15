import React, { useEffect, useState } from 'react';
import './App.css';
import { useParams } from 'react-router-dom';

const API_BASE_URL = 'http://127.0.0.1:8000';
const IMAGE_BASE_URL = API_BASE_URL + '/assets/img/';

function ProductStats({ productId }) {
	const [stats, setStats] = useState(null);
	const [loading, setLoading] = useState(true);

	useEffect(() => {
		fetch(API_BASE_URL + `/api/product/${productId}/stats`)
			.then(res => res.json())
			.then(data => {
				setStats(data.data);
				setLoading(false);
			})
			.catch(() => setLoading(false));
	}, [productId]);

	if (loading) return <div className="centered-view">Loading...</div>;
	if (!stats) return <div className="centered-view">Stats not found.</div>;

	return (
		<div className="product-stats">
			<h3>Product Stats</h3>
			<p>Views Today: {stats.views_today_count}</p>
		</div>
	);
}

function ProductViewPage() {
	const [product, setProduct] = useState(null);
	const [loading, setLoading] = useState(true);
	const { id } = useParams();

	useEffect(() => {
		fetch(API_BASE_URL + '/api/product/view', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ product_id: id }),
		})
			.then(res => res.json())
			.then(data => {
				setProduct(data.data);
				setLoading(false);
			})
			.catch(() => setLoading(false));
	}, [id]);

	if (loading) return <div className="centered-view">Loading...</div>;
	if (!product) return <div className="centered-view">Product not found.</div>;

	return (
		<div className="centered-view">
			<div className="product-view-card">
				<img src={IMAGE_BASE_URL + product.image_url} alt={product.product_name} className="product-view-image" />
				<div className="product-view-info">
					<h1>{product.product_name}</h1>
					<p>{product.description}</p>
					<p className="product-view-price">Price: ${product.price}</p>
					<p>Views: {product.views_count}</p>
					<ProductStats productId={id} />
				</div>
			</div>
		</div>
	);
}

export default ProductViewPage;
