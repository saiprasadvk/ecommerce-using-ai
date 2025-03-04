import React from 'react';
import { Link } from 'react-router-dom';
import { ShoppingBag } from 'lucide-react';

const HomePage: React.FC = () => {
  return (
    <div>
      {/* Hero Section */}
      <div className="bg-gray-900 text-white">
        <div className="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:px-8 flex flex-col items-center text-center">
          <h1 className="text-4xl md:text-5xl font-extrabold mb-6">Welcome to EcommerceApp</h1>
          <p className="text-xl max-w-3xl mb-8">
            Discover amazing products at unbeatable prices. Shop now and enjoy fast delivery!
          </p>
          <Link 
            to="/products" 
            className="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg inline-flex items-center"
          >
            <ShoppingBag className="mr-2 h-5 w-5" />
            Shop Now
          </Link>
        </div>
      </div>

      {/* Featured Categories */}
      <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-center mb-10">Featured Categories</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {[
            { name: 'Electronics', image: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
            { name: 'Clothing', image: 'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
            { name: 'Home & Kitchen', image: 'https://images.unsplash.com/photo-1556911220-bff31c812dba?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
          ].map((category, index) => (
            <Link to="/products" key={index} className="group">
              <div className="relative overflow-hidden rounded-lg shadow-lg h-64">
                <img 
                  src={category.image} 
                  alt={category.name} 
                  className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end">
                  <h3 className="text-white text-xl font-bold p-4">{category.name}</h3>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Featured Products */}
      <div className="bg-gray-100 py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-center mb-10">Featured Products</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              { id: 1, name: 'Wireless Headphones', price: 99.99, image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
              { id: 2, name: 'Smart Watch', price: 199.99, image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
              { id: 3, name: 'Laptop Backpack', price: 49.99, image: 'https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
              { id: 4, name: 'Coffee Maker', price: 79.99, image: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60' },
            ].map((product) => (
              <div key={product.id} className="bg-white rounded-lg shadow-md overflow-hidden">
                <Link to={`/products/${product.id}`}>
                  <img 
                    src={product.image} 
                    alt={product.name} 
                    className="w-full h-48 object-cover"
                  />
                </Link>
                <div className="p-4">
                  <Link to={`/products/${product.id}`} className="text-lg font-semibold hover:text-blue-600">
                    {product.name}
                  </Link>
                  <p className="text-gray-800 font-bold mt-2">${product.price.toFixed(2)}</p>
                  <Link 
                    to={`/products/${product.id}`}
                    className="mt-3 inline-block bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded"
                  >
                    View Details
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Testimonials */}
      <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-center mb-10">What Our Customers Say</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {[
            { name: 'John D.', text: 'Great products and fast shipping! Will definitely shop here again.' },
            { name: 'Sarah M.', text: 'The customer service is exceptional. They helped me find exactly what I needed.' },
            { name: 'Michael T.', text: 'Quality products at reasonable prices. Very satisfied with my purchase.' },
          ].map((testimonial, index) => (
            <div key={index} className="bg-gray-50 p-6 rounded-lg shadow">
              <p className="text-gray-600 italic mb-4">"{testimonial.text}"</p>
              <p className="font-semibold">{testimonial.name}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default HomePage;