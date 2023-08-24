import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class SidesScreen extends StatefulWidget {
  final double totalOrderValue;

  SidesScreen({required this.totalOrderValue});

  @override
  _SidesScreenState createState() => _SidesScreenState();
}

class _SidesScreenState extends State<SidesScreen> {
  double _totalOrderValue = 0;
  List<String> _selectedSides = [];
  String _selectedMeal = 'Pizza';
  List<String> _meals = ['Pizza', 'Burger', 'Sandwich'];

  void _selectSide(String side) {
    setState(() {
      _selectedSides.add(side);
      _totalOrderValue += 4.0;
    });
  }

  void _deselectSide(String side) {
    setState(() {
      _selectedSides.remove(side);
      _totalOrderValue -= 4.0;
    });
  }

  void _goToCheckoutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(totalOrderValue: _totalOrderValue + widget.totalOrderValue),
      ),
    );
  }

  void _goToMenuScreen() {
    Navigator.pop(context);
  }

  void _onMealSelectionChanged(String? selectedMeal) {
    setState(() {
      _selectedMeal = selectedMeal ?? _selectedMeal;
      _selectedSides.clear(); // clear the previously selected sides
    });
  }

  bool _canSelectSide() {
    return (widget.totalOrderValue + _totalOrderValue) > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sides',
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'For which food item is the side for?',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: _selectedMeal,
            onChanged: _onMealSelectionChanged,
            items: _meals.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 18)),
              );
            }).toList(),
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black, fontSize: 20),
            underline: Container(
              height: 2,
              color: Colors.blueGrey[900],
            ),
            dropdownColor: Colors.white,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSideOption('French Fries', 4.0),
                  SizedBox(height: 20),
                  _buildSideOption('Soda', 4.0),
                  SizedBox(height: 20),
                  _buildSideOption('Chips', 4.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total order value: \$${widget.totalOrderValue + _totalOrderValue}'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[900],
                  ),
                  onPressed: _goToCheckoutScreen,
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            _goToMenuScreen();
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildSideOption(String title, double price) {
    final bool isSelected = _selectedSides.contains(title);

    return ListTile(
      title: Text(title),
      subtitle: Text('\$$price'),
      trailing: Icon(isSelected ? Icons.check_circle : Icons.radio_button_unchecked),
      onTap: () {
        if (isSelected) {
          _deselectSide(title);
        } else {
          _selectSide(title);
        }
      },
    );
  }
}


