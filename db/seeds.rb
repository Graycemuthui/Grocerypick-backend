Product.destroy_all
Order.destroy_all
Payment.destroy_all
Category.destroy_all
Customer.destroy_all

product = Product.create([
                           { product_name: 'Apples', product_description: 'Apples are an incredibly nutritious fruit that offers multiple health benefits. You know what they say an apple an day keeps the doctors away.', product_price: 510,
                             product_quantity: 1, product_image: 'https://www.pexels.com/@andie-2026776/' }
                         ])
