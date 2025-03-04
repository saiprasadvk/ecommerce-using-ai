/*
  # Create orders and order_items tables

  1. New Tables
    - `orders`
      - `id` (uuid, primary key)
      - `customer_email` (text, not null)
      - `customer_name` (text, not null)
      - `shipping_address` (text, not null)
      - `total_amount` (numeric, not null)
      - `status` (text, not null)
      - `created_at` (timestamp with time zone, default now())
    - `order_items`
      - `id` (uuid, primary key)
      - `order_id` (uuid, foreign key to orders.id)
      - `product_id` (uuid, foreign key to products.id)
      - `quantity` (integer, not null)
      - `price` (numeric, not null)
  2. Security
    - Enable RLS on both tables
    - Add policies for users to read their own orders
    - Add policies for admin users to read all orders
*/

CREATE TABLE IF NOT EXISTS orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_email text NOT NULL,
  customer_name text NOT NULL,
  shipping_address text NOT NULL,
  total_amount numeric NOT NULL,
  status text NOT NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS order_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id uuid REFERENCES orders(id) ON DELETE CASCADE,
  product_id uuid REFERENCES products(id),
  quantity integer NOT NULL,
  price numeric NOT NULL
);

ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

-- Users can read their own orders
CREATE POLICY "Users can read their own orders"
  ON orders
  FOR SELECT
  TO authenticated
  USING (customer_email = auth.email());

-- Admin can read all orders
CREATE POLICY "Admin can read all orders"
  ON orders
  FOR ALL
  TO authenticated
  USING (auth.email() = 'admin@example.com');

-- Order items policies
CREATE POLICY "Users can read their own order items"
  ON order_items
  FOR SELECT
  TO authenticated
  USING (
    order_id IN (
      SELECT id FROM orders WHERE customer_email = auth.email()
    )
  );

-- Admin can read all order items
CREATE POLICY "Admin can read all order items"
  ON order_items
  FOR ALL
  TO authenticated
  USING (auth.email() = 'admin@example.com');