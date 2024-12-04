import 'package:flutter/material.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: PizzaHomePage(),
    );
  }
}

class PizzaHomePage extends StatefulWidget {
  @override
  _PizzaHomePageState createState() => _PizzaHomePageState();
}

class _PizzaHomePageState extends State<PizzaHomePage> {
  bool isGridView = false;
  List<Pizza> cart = [];

  final List<Pizza> pizzas = [
    Pizza(
      name: 'Margherita',
      price: 8.99,
      description: 'Classic cheese and tomato pizza with fresh basil.',
      imagePath: 'lib/assets/images.jpeg',
    ),
    Pizza(
      name: 'Pepperoni',
      price: 10.99,
      description: 'Topped with spicy pepperoni and gooey mozzarella.',
      imagePath: 'lib/assets/images-2.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _showCartDialog();
            },
          ),
        ],
      ),
      body: isGridView ? _buildGridView(context) : _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isGridView = !isGridView;
          });
        },
        child: Icon(isGridView ? Icons.list : Icons.grid_view),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        final pizza = pizzas[index];
        return Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                pizza.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              pizza.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(pizza.description),
            trailing: Text(
              '\$${pizza.price.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(pizza: pizza),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        final pizza = pizzas[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(pizza: pizza),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    pizza.imagePath,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    pizza.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  '\$${pizza.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Cart"),
          content: cart.isEmpty
              ? Text("Your cart is empty.")
              : Column(
            mainAxisSize: MainAxisSize.min,
            children: cart.map((pizza) => Text(pizza.name)).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Pizza pizza;

  ProductDetailPage({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pizza.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                pizza.imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              pizza.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              pizza.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '\$${pizza.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pizza {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Pizza({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}
