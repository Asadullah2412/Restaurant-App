import 'package:flutter/material.dart';
import 'package:menu_app/FoodCard.dart';
import 'package:menu_app/cartPage.dart';
import 'package:menu_app/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _showInputDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Food Name and Price'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: ' Food Name'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = nameController.text;
                int price = int.parse(priceController.text);
                Navigator.of(context).pop();

                setState(() {
                  foodCardList.add(FoodCard(
                    foodName: name,
                    price: price,
                  ));
                });

                print('Name: $name, Price: $price ');
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant '),
        actions: [
          IconButton(
              onPressed: () => _showInputDialog(context),
              icon: Icon(Icons.food_bank_rounded)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart_rounded))
        ],
        backgroundColor: Color(0xffe8d59e),
      ),
      backgroundColor: Color(0xfff7e6ca),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: foodCardList.length,
            itemBuilder: (BuildContext context, int index) {
              return foodCardList[index];
            },
          ),
        ),
      ),
    );
  }
}
