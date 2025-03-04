/*
  # Seed products table with sample data

  This migration adds sample product data to the products table.
*/

INSERT INTO products (name, description, price, image, category, inventory)
VALUES
  (
    'Wireless Headphones',
    'Premium wireless headphones with noise cancellation and 20-hour battery life.',
    99.99,
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Electronics',
    50
  ),
  (
    'Smart Watch',
    'Track your fitness, receive notifications, and more with this sleek smart watch.',
    199.99,
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Electronics',
    30
  ),
  (
    'Laptop Backpack',
    'Durable backpack with padded laptop compartment and multiple storage pockets.',
    49.99,
    'https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Accessories',
    100
  ),
  (
    'Coffee Maker',
    'Programmable coffee maker with 12-cup capacity and auto shut-off feature.',
    79.99,
    'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Home & Kitchen',
    25
  ),
  (
    'Yoga Mat',
    'Non-slip yoga mat with carrying strap, perfect for home or studio use.',
    29.99,
    'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Fitness',
    75
  ),
  (
    'Portable Bluetooth Speaker',
    'Waterproof Bluetooth speaker with 10-hour battery life and rich sound.',
    59.99,
    'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Electronics',
    40
  ),
  (
    'Stainless Steel Water Bottle',
    'Vacuum insulated water bottle that keeps drinks cold for 24 hours or hot for 12 hours.',
    24.99,
    'https://images.unsplash.com/photo-1602143407151-7111542de6e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Accessories',
    120
  ),
  (
    'Desk Lamp',
    'Adjustable LED desk lamp with multiple brightness levels and color temperatures.',
    39.99,
    'https://images.unsplash.com/photo-1534073828943-f801091bb18c?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'Home & Kitchen',
    35
  );