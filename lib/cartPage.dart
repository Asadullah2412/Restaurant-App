import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:menu_app/constants.dart';
import 'package:menu_app/cartModel.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  void totalSum() {}
  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Have a happy meal 😃'),
      action: SnackBarAction(
        label: 'Clear Cart',
        onPressed: () {
          Provider.of<CartModel>(context, listen: false).clearCart();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: KAppbarcolor,
        actions: [
          Text(
              'Total Cost: ${Provider.of<CartModel>(context).getTotalCost()} RS'),
          IconButton(
              onPressed: () {
                showSnackbar(context);
              },
              icon: Icon(Icons.monetization_on))
        ],
      ),
      backgroundColor: KScaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartModel>(
          builder: (context, cartModel, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cartModel.cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cartModel.cartItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: ${item['price']} Rs',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Total Quantity: ${item['quantity']}',
                          // 'Total Quantity: $quantity',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            cartModel.removeItem(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
