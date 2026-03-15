import React from 'react';
import './App.css';
import { Routes, Route, useNavigate, useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import ProductViewPage from './ProductViewPage';
import ProductStatsPage from './ProductStatsPage';

const API_BASE_URL = 'http://127.0.0.1:8000';
const IMAGE_BASE_URL = API_BASE_URL + '/assets/img/';

function ProductList() {
	const [products, setProducts] = useState([]);
	const [loading, setLoading] = useState(true);
	const navigate = useNavigate();

	const handlePreview = (productId) => {
		navigate(`/products/${productId}`);
	};

	useEffect(() => {
		fetch(API_BASE_URL + '/api/product/list')
			.then(res => res.json())
			.then(data => {
				setProducts(data.data || []);
				setLoading(false);
			})
			.catch(() => setLoading(false));
	}, []);

	if (loading) return <div>Loading...</div>;

	return (
		<div>
			<div className="product-grid">
				{products.map(product => (
					<div className="product-card" key={product.id}>
						<div className="product-image">
							<img src={IMAGE_BASE_URL + product.image_url} alt={product.product_name} />
						</div>
						<div className="product-info">
							<div className="product-category">{product.description.split(' ')[0] || 'Category'}</div>
							<div className="product-name">{product.product_name}</div>
							<div className="product-price">${product.price}</div>
							<div className="product-actions">
								<button onClick={() => handlePreview(product.id)}>View</button>
								<button onClick={() => navigate(`/purchase/${product.id}`)}>Purchase</button>
							</div>
						</div>
					</div>
				))}
			</div>
		</div>
	);
}

function ProductView() {
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

	if (loading) return <div>Loading...</div>;

	if (!product) return <div>Product not found.</div>;

	return (
		<div>
			<h2>{product.product_name}</h2>
			<p>{product.description}</p>
			<p>Price: ${product.price}</p>
			<img src={IMAGE_BASE_URL + product.image_url} alt={product.product_name} style={{width:200}} />
			<p>Views: {product.views_count}</p>
		</div>
	);
}

function ProductPurchase() {
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
					<p>Product ID: {stats.id}</p>
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

function App() {
	const stats = {
		views_today: 42,
		purchases_today: 7,
	};

	return (
		<Routes>
			<Route path="/products" element={<ProductList />} />
			<Route path="/products/:id" element={<ProductViewPage />} />
			<Route path="/products/:id/stats" element={<ProductStatsPage />} />
			<Route path="/purchase/:id" element={<ProductPurchase />} />
			<Route path="*" element={<ProductList />} />
		</Routes>
	);
}

export default App;

