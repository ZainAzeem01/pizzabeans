import 'package:flutter/material.dart';

void main() {
  runApp(AddToCartApp());
}

class AddToCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Details',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PizzaDetailsListPage(),
    );
  }
}

class PizzaDetailsListPage extends StatefulWidget {
  @override
  _PizzaDetailsListPageState createState() => _PizzaDetailsListPageState();
}

class _PizzaDetailsListPageState extends State<PizzaDetailsListPage> {
  int quantity = 1;

  final List<Map<String, dynamic>> pizzas = [
    {
      'name': 'Margherita Pizza',
      'description': 'Classic cheese and tomato pizza with fresh basil.',
      'price': 8.99,
      'image': 'lib/assets/images.jpeg', // Replace with your actual asset path
    },
    {
      'name': 'Pepperoni Pizza',
      'description': 'Topped with spicy pepperoni and gooey mozzarella.',
      'price': 10.99,
      'image': 'lib/assets/pepperoni.jpeg', // Replace with your actual asset path
    },
    {
      'name': 'Veggie Pizza',
      'description': 'Loaded with fresh veggies and cheese.',
      'price': 9.99,
      'image': 'lib/assets/veggie.jpeg', // Replace with your actual asset path
    },
  ];

  void addToCart(String pizzaName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $quantity $pizzaName(s) to the cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Details'),
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          final pizza = pizzas[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pizza Image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        pizza['image'], // Use the dynamic image path
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pizza Name
                  Text(
                    pizza['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Pizza Description
                  Text(
                    pizza['description'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pizza Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${pizza['price'].toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$quantity',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Add to Cart Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => addToCart(pizza['name']),
                      icon: Icon(Icons.shopping_cart),
                      label: Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
