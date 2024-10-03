import 'package:flutter/material.dart';
import 'package:shoppinglist/models/grocery_item.dart';
import 'package:shoppinglist/widget/add_item.dart';
import 'package:shoppinglist/widget/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<GroceryItem> _groceryItems = [];

  void _addNewItem() async{
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx)=> const  AddItem())
    );

    if (newItem == null){
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });

  }

  void _onRemove(int index){
    setState(() {
      _groceryItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child:  Text("Grocery list is empty"));

    return Scaffold(
      appBar: AppBar(title:const  Text("Your Groceries",),
        actions: [
          IconButton(onPressed: _addNewItem, icon: const Icon(Icons.add))
        ],
      ),
      body: _groceryItems.isEmpty ? content :  Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: _groceryItems.length,
            itemBuilder: (ctx, index) => Dismissible(
              key: Key(_groceryItems[index].id),
              onDismissed: (direction){
                _onRemove(index);
              },
              child: Item(
                onUpdate:_addNewItem,
                color: _groceryItems[index].category.color ,
                itemName: _groceryItems[index].name,
                quantity: _groceryItems[index].quantity,
                      ),
            ))
      ),
    );
  }
}
