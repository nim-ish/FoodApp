import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalOrderValue;

  const CheckoutScreen({Key? key, required this.totalOrderValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Menu Item',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Burger')),
                    TableCell(child: Text('\$9')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Pizza')),
                    TableCell(child: Text('\$13')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Sandwich')),
                    TableCell(child: Text('\$8')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('French Fires')),
                    TableCell(child: Text('\$4')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Soda')),
                    TableCell(child: Text('\$4')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Chips')),
                    TableCell(child: Text('\$4')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Total order value: \$${totalOrderValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            totalOrderValue > 0 ? ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Order Placed'),
                      content: Text('Your order has been placed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Confirm Order'),
            ) : Text('Cart is empty', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
              ),
              child: Text('Back to Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
