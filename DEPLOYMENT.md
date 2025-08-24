# Railway Deployment Guide for Expense Manager

This guide will help you deploy your Laravel Expense Manager application to Railway with automated CI/CD pipeline via GitHub.

## Prerequisites

1. **GitHub Account** - Your code must be in a GitHub repository
2. **Railway Account** - Sign up at [railway.app](https://railway.app)
3. **Git** - Installed on your local machine

## Step 1: Push Code to GitHub

First, let's push your code to the GitHub repository:

```bash
# Navigate to your project directory
cd ExpenseManager

# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Commit your changes
git commit -m "Initial commit: Expense Manager with Railway deployment"

# Add your GitHub repository as remote
git remote add origin https://github.com/eaincorp-dev/expense-management.git

# Set main as default branch
git branch -M main

# Push to GitHub
git push -u origin main
```

## Step 2: Set Up Railway Project

1. **Login to Railway**:
   - Go to [railway.app](https://railway.app)
   - Sign in with your GitHub account

2. **Create New Project**:
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your `expense-management` repository
   - Railway will automatically detect it's a PHP application

3. **Add MySQL Database**:
   - In your project dashboard, click "New"
   - Select "Database" → "MySQL"
   - Railway will create a MySQL database service

## Step 3: Configure Environment Variables

1. **Go to your project settings** in Railway
2. **Add these environment variables**:

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

**Important**: Replace `your-mysql-host.railway.app` and `your-mysql-password` with the actual values from your Railway MySQL service.

## Step 4: Set Up GitHub Secrets

1. **Go to your GitHub repository**
2. **Navigate to Settings → Secrets and variables → Actions**
3. **Add these repository secrets**:

   - `RAILWAY_TOKEN`: Your Railway API token
   - `RAILWAY_SERVICE`: Your Railway service ID

### How to get Railway Token:
1. Go to Railway dashboard
2. Click on your profile → "Account Settings"
3. Go to "API" tab
4. Generate a new token

### How to get Service ID:
1. In your Railway project
2. Go to your service settings
3. Copy the service ID from the URL or settings

## Step 5: Configure Railway Service

1. **In your Railway project dashboard**:
   - Go to your service settings
   - Set the following:

**Build Command**: (Leave empty - Nixpacks will handle this)
**Start Command**: `php artisan serve --host=0.0.0.0 --port=$PORT`

2. **Health Check**:
   - Path: `/`
   - Timeout: 100 seconds

## Step 6: Deploy

1. **Railway will automatically deploy** when you push to the main branch
2. **Monitor the deployment** in Railway dashboard
3. **Check the logs** if there are any issues

## Step 7: Post-Deployment Setup

After successful deployment:

1. **Run migrations** (if not already done by Nixpacks):
   ```bash
   # In Railway terminal or via Railway CLI
   php artisan migrate --force
   ```

2. **Seed the database** (if not already done):
   ```bash
   php artisan db:seed --force
   ```

3. **Access your application**:
   - Your app will be available at the Railway-provided URL
   - Default admin credentials:
     - Email: `admin@admin.com`
     - Password: `password`

## Troubleshooting

### Common Issues:

1. **Build Fails**:
   - Check that `composer.json` is in the root directory
   - Ensure PHP version compatibility (7.4+)
   - Check Railway build logs

2. **Database Connection Error**:
   - Verify environment variables are set correctly
   - Check that MySQL service is running
   - Ensure database credentials are correct

3. **500 Error**:
   - Check Railway logs for specific error messages
   - Ensure `APP_KEY` is generated
   - Verify file permissions

4. **Migration Errors**:
   - Run migrations manually in Railway terminal
   - Check database connection settings

### Useful Commands:

```bash
# Check Railway logs
railway logs

# Access Railway terminal
railway shell

# Run artisan commands
php artisan migrate --force
php artisan config:cache
php artisan route:cache
```

## CI/CD Pipeline

The GitHub Actions workflow (`.github/workflows/railway-deploy.yml`) will:

1. **Trigger on push** to main branch
2. **Set up PHP environment**
3. **Install dependencies**
4. **Deploy to Railway automatically**

## Environment Variables Reference

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

## Support

- [Railway Documentation](https://docs.railway.app)
- [Railway Discord](https://discord.gg/railway)
- [Laravel Documentation](https://laravel.com/docs)

## Next Steps

After successful deployment:

1. **Set up custom domain** (optional)
2. **Configure SSL certificate** (automatic with Railway)
3. **Set up monitoring** and alerts
4. **Configure backups** for your database
5. **Set up staging environment** for testing

Your Expense Manager application is now ready for production use! 🚀
