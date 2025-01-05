import 'package:flutter/material.dart';
import 'package:menu_app/cartModel.dart';
// import 'package:menu_app/cartPage.dart';
// import 'package:menu_app/constants.dart';
import 'package:provider/provider.dart';

// int quantity = 0;

class FoodCard extends StatefulWidget {
  final String foodName;
  final int price;
  int quantity = 0;
  FoodCard({required this.foodName, required this.price});
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  void increaseQuantity() {
    setState(() {
      widget.quantity++;
      print('adding $widget.quantity');
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (widget.quantity > 0) {
        widget.quantity--;
      }
      print('removing $widget.quantity');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        // color: KCardColor,
        width: 400,
        height: 350,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.foodName),
            // SizedBox(height: 10),
            Text('Price ${widget.price} RS'),
            // SizedBox(height: 10),
            Text('Quantity: ${widget.quantity}'),
            // SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: decreaseQuantity,
                    icon: Icon(Icons.remove),
                  ),
                  Text('${widget.quantity}'),
                  IconButton(
                    onPressed: increaseQuantity,
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  if (widget.quantity > 0) {
                    Provider.of<CartModel>(context, listen: false).addItem(
                        widget.foodName, widget.price, widget.quantity);
                    print(widget.quantity);
                    final snackBar = SnackBar(content: Text('Added to cart'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    setState(() {
                      widget.quantity = 0;
                    });
                  } else {
                    final snackBar = SnackBar(
                      content: Text('Please Select Quantity'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}

List<Widget> foodCardList = [
  FoodCard(
    foodName: 'Chicken Briyani',
    price: 100,
  ),
  FoodCard(
    foodName: 'Mutton Briyani',
    price: 100,
  ),
  FoodCard(
    foodName: 'Butter Chicken',
    price: 100,
  ),
  FoodCard(
    foodName: 'Paneer butter',
    price: 100,
  ),
  FoodCard(
    foodName: 'Nizami Handi ',
    price: 100,
  ),
  FoodCard(
    foodName: 'Nahari paya',
    price: 100,
  ),
  FoodCard(
    foodName: 'Afgani chicken',
    price: 100,
  ),
  FoodCard(
    foodName: 'Paneer masala',
    price: 100,
  ),
  FoodCard(
    foodName: 'Masala Dosa',
    price: 100,
  ),
  FoodCard(
    foodName: 'Veg Handi',
    price: 100,
  ),
];
