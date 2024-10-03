import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Item extends StatelessWidget {
  final Color color;
  final Function onUpdate;
  final String itemName;
  final int quantity;
  const Item({super.key, required this.color, required this.itemName, required this.quantity, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onUpdate();
      },
      title: Text(itemName),
      leading: Container(
          height: 20,
          width: 20,
          color: color,
        ),
      trailing: Text("$quantity"),

    );
  }
}
