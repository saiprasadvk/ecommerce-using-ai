# E-commerce Application with PostgreSQL

A complete e-commerce application built with React, Node.js, and PostgreSQL. This application includes product listings, shopping cart functionality, checkout process, and order management.

## Features

- Product browsing and filtering by category
- Product detail pages
- Shopping cart with local storage persistence
- Checkout process with form validation
- Order management
- Responsive design for mobile and desktop
- PostgreSQL database for data storage
- Kubernetes deployment with Helm

## Tech Stack

- **Frontend**: React, React Router, TailwindCSS
- **Backend**: Node.js, Express
- **Database**: PostgreSQL (via Supabase)
- **Authentication**: Supabase Auth
- **Containerization**: Docker
- **Orchestration**: Kubernetes with Helm

## Prerequisites

- Node.js (v16+)
- Docker and Docker Compose
- Kubernetes cluster (for production deployment)
- Helm (v3+)
- Supabase account

## Local Development

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/ecommerce-app.git
cd ecommerce-app
```

### 2. Set up environment variables

Copy the example environment file and update it with your Supabase credentials:

```bash
cp .env.example .env
```

Edit the `.env` file with your Supabase URL and anon key.

### 3. Install dependencies

```bash
npm install
```

### 4. Start the development server

```bash
npm run dev
```

This will start the Vite development server for the frontend.

### 5. Start the backend server

In a separate terminal:

```bash
npm start
```

## Database Setup

This application uses Supabase for PostgreSQL database management.

### 1. Create a Supabase project

Go to [Supabase](https://supabase.com/) and create a new project.

### 2. Run migrations

The SQL migration files are located in the `supabase/migrations` directory. You can run these migrations in the Supabase SQL editor in the following order:

1. `create_products_table.sql`
2. `create_orders_table.sql`
3. `seed_products.sql`

## Docker Deployment

You can run the application using Docker Compose:

```bash
docker-compose up -d
```

This will start both the application and a PostgreSQL database.

## Kubernetes Deployment with Helm

### 1. Build and push the Docker image

```bash
docker build -t your-registry/ecommerce-app:latest .
docker push your-registry/ecommerce-app:latest
```

### 2. Update Helm values

Edit `helm/ecommerce-app/values.yaml` to set your image repository and other configuration options.

### 3. Deploy with Helm

```bash
helm install ecommerce-app ./helm/ecommerce-app \
  --set secretEnv.DATABASE_URL="postgresql://postgres:postgres@ecommerce-app-postgresql:5432/ecommerce" \
  --set secretEnv.VITE_SUPABASE_URL="your-supabase-url" \
  --set secretEnv.VITE_SUPABASE_ANON_KEY="your-supabase-anon-key" \
  --set image.repository=your-registry/ecommerce-app
```

### 4. Access the application

If you've enabled the Ingress (default in values.yaml), you can access the application at the hostname specified in your Ingress configuration.

## Kubernetes Architecture

The Helm chart deploys the following resources:

- **Deployment**: Runs the application containers
- **Service**: Exposes the application within the cluster
- **Ingress**: Exposes the application outside the cluster
- **Secret**: Stores sensitive environment variables
- **ServiceAccount**: Identity for the application pods
- **HorizontalPodAutoscaler**: Automatically scales the application based on CPU usage (if enabled)

## Database Schema

### Products Table

- `id`: UUID (Primary Key)
- `name`: Text (Not Null)
- `description`: Text
- `price`: Numeric (Not Null)
- `image`: Text
- `category`: Text
- `inventory`: Integer (Default 0)
- `created_at`: Timestamp with time zone (Default now())

### Orders Table

- `id`: UUID (Primary Key)
- `customer_email`: Text (Not Null)
- `customer_name`: Text (Not Null)
- `shipping_address`: Text (Not Null)
- `total_amount`: Numeric (Not Null)
- `status`: Text (Not Null)
- `created_at`: Timestamp with time zone (Default now())

### Order Items Table

- `id`: UUID (Primary Key)
- `order_id`: UUID (Foreign Key to orders.id)
- `product_id`: UUID (Foreign Key to products.id)
- `quantity`: Integer (Not Null)
- `price`: Numeric (Not Null)

## Security

- Row-Level Security (RLS) is enabled on all tables
- Users can only access their own orders
- Admin users have full access to all data

## License

MIT