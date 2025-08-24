# Laravel Expense Manager

A comprehensive expense and income management system built with Laravel 5.5.

## Features

- ✅ User authentication and authorization
- ✅ Expense and income tracking
- ✅ Multi-currency support
- ✅ Category management
- ✅ Monthly reports
- ✅ Role-based access control
- ✅ Responsive AdminLTE interface

## Railway Deployment

### Prerequisites

1. **GitHub Account** - Your code must be in a GitHub repository
2. **Railway Account** - Sign up at [railway.app](https://railway.app)
3. **Database** - Railway provides MySQL databases

### Step 1: Prepare Your Repository

1. **Push to GitHub** (if not already done):
   ```bash
   git add .
   git commit -m "Prepare for Railway deployment"
   git push origin main
   ```

### Step 2: Deploy to Railway

1. **Login to Railway**:
   - Go to [railway.app](https://railway.app)
   - Sign in with your GitHub account

2. **Create New Project**:
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your expense-manager repository

3. **Add Database**:
   - In your project, click "New"
   - Select "Database" → "MySQL"
   - Railway will automatically create a MySQL database

4. **Configure Environment Variables**:
   - Go to your project settings
   - Add these environment variables:

   ```env
   APP_NAME="Laravel Expense Manager"
   APP_ENV=production
   APP_DEBUG=false
   APP_URL=https://your-app-name.railway.app
   
   DB_CONNECTION=mysql
   DB_HOST=your-mysql-host.railway.app
   DB_PORT=3306
   DB_DATABASE=railway
   DB_USERNAME=root
   DB_PASSWORD=your-mysql-password
   
   CACHE_DRIVER=file
   SESSION_DRIVER=file
   QUEUE_CONNECTION=sync
   ```

5. **Deploy**:
   - Railway will automatically detect it's a PHP application
   - It will install dependencies and run the build process
   - Your app will be deployed and available at the provided URL

### Step 3: Post-Deployment Setup

1. **Run Migrations**:
   - Go to your project's "Deployments" tab
   - Click on the latest deployment
   - Open the terminal and run:
   ```bash
   php artisan migrate --force
   ```

2. **Seed Database** (optional):
   ```bash
   php artisan db:seed --force
   ```

3. **Access Your Application**:
   - Your app will be available at the Railway-provided URL
   - Default admin credentials:
     - Email: `admin@admin.com`
     - Password: `password`

### Environment Variables Reference

| Variable | Description | Required |
|----------|-------------|----------|
| `APP_NAME` | Application name | Yes |
| `APP_ENV` | Environment (production) | Yes |
| `APP_DEBUG` | Debug mode (false for production) | Yes |
| `APP_URL` | Your Railway app URL | Yes |
| `DB_HOST` | MySQL host from Railway | Yes |
| `DB_DATABASE` | Database name (usually 'railway') | Yes |
| `DB_USERNAME` | Database username | Yes |
| `DB_PASSWORD` | Database password | Yes |

### Troubleshooting

**Common Issues:**

1. **Build Fails**:
   - Check that `composer.json` is in the root directory
   - Ensure PHP version compatibility (7.0+)

2. **Database Connection Error**:
   - Verify environment variables are set correctly
   - Check that MySQL service is running

3. **500 Error**:
   - Check Railway logs for specific error messages
   - Ensure `APP_KEY` is generated
   - Verify file permissions

4. **Migration Errors**:
   - Run migrations manually in Railway terminal
   - Check database connection settings

### Support

For Railway-specific issues, check:
- [Railway Documentation](https://docs.railway.app)
- [Railway Discord](https://discord.gg/railway)

For Laravel issues, check:
- [Laravel Documentation](https://laravel.com/docs)

## Local Development

To run locally:

```bash
# Install dependencies
composer install

# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Configure database in .env file

# Run migrations
php artisan migrate

# Start development server
php artisan serve
```

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
