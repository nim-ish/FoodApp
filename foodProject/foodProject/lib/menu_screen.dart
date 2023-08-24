import 'package:flutter/material.dart';
import 'checkout_screen.dart';
import 'sides_screen.dart';
import 'menu_item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<MenuItem> _menuItems = [
    MenuItem(
      name: 'Burger',
      description: 'A delicious burger with beef patty, cheese, lettuce and tomato',
      price: 9,
      id: 1,
      imagePath: 'images/image1.jpg',
    ),
    MenuItem(
      name: 'Pizza',
      description: 'A classic pizza with tomato sauce, cheese and pepperoni',
      price: 13,
      id: 2,
      imagePath: 'images/image2.jpg',
    ),
    MenuItem(
      name: 'Sandwich',
      description: 'A tasty grilled sandwich filled with veggies and cheese',
      price: 8,
      id: 3,
      imagePath: 'images/image3.jpg',
    ),
  ];

  double _totalOrderValue = 0.0;
  List<MenuItem> _cartItems = [];

  void _addToCart(MenuItem item) {
    setState(() {
      _cartItems.add(item);
      _totalOrderValue += item.price;
    });
  }

  void _removeFromCart(MenuItem item) {
    setState(() {
      _cartItems.remove(item);
      _totalOrderValue -= item.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    _menuItems[index].imagePath,
                    width: 190,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_menuItems[index].name),
                  subtitle: Text(_menuItems[index].description),
                  trailing: Text('\$${_menuItems[index].price.toStringAsFixed(2)}'),
                  onTap: () => _addToCart(_menuItems[index]),
                );
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Add sides to your order"),
            trailing: ElevatedButton(
              child: Text('Sides'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SidesScreen(totalOrderValue: _totalOrderValue)),
                );
              },
            ),
          ),
          ListTile(
            title: Text('Total order value: \$${_totalOrderValue.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              child: Text('Checkout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen(totalOrderValue: _totalOrderValue)),
                );
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          if (_cartItems.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_cartItems[index].name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeFromCart(_cartItems[index]),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}