#!/bin/bash

# Railway Deployment Script for Laravel Expense Manager

echo "🚀 Starting Railway deployment..."

# Install dependencies
echo "📦 Installing dependencies..."
composer install --no-dev --optimize-autoloader

# Generate application key
echo "🔑 Generating application key..."
php artisan key:generate --force

# Clear and cache configurations
echo "⚙️ Caching configurations..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run migrations
echo "🗄️ Running database migrations..."
php artisan migrate --force

# Set proper permissions
echo "🔒 Setting permissions..."
chmod -R 755 storage bootstrap/cache

echo "✅ Deployment preparation complete!"
echo "🌐 Your app will be available at: https://your-app-name.railway.app"
