/*
  # Create products table

  1. New Tables
    - `products`
      - `id` (uuid, primary key)
      - `name` (text, not null)
      - `description` (text)
      - `price` (numeric, not null)
      - `image` (text)
      - `category` (text)
      - `inventory` (integer, default 0)
      - `created_at` (timestamp with time zone, default now())
  2. Security
    - Enable RLS on `products` table
    - Add policy for authenticated users to read products
    - Add policy for admin users to insert, update, delete products
*/

CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  price numeric NOT NULL,
  image text,
  category text,
  inventory integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read products"
  ON products
  FOR SELECT
  TO authenticated, anon
  USING (true);

CREATE POLICY "Admin users can modify products"
  ON products
  USING (auth.uid() IN (
    SELECT auth.uid() FROM auth.users WHERE auth.email() = 'admin@example.com'
  ));