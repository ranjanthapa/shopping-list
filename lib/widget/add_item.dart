import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shoppinglist/data/categories.dart';
import 'package:shoppinglist/models/category.dart';
import 'package:shoppinglist/models/grocery_item.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {



  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = '';
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.of(context).pop(
          GroceryItem(
            id: DateTime.now().toString(),
            name: _enteredName,
            quantity: int.parse(_enteredQuantity),
            category: _selectedCategory
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add new Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                  decoration: const InputDecoration(
                    label:  Text("Name")
                  ),
                validator: (value){
                  if (value == null || value.isEmpty || value.trim().length > 50
                      || value.trim().length <=1 ){
                    return "Character must be between 30 and 50";
                  }
                  return null;
                },
                onSaved:(value){
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label:  Text("Quantity"),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || int.tryParse(value) == null || int.tryParse(value)! <=0){
                          return "Value must be positive";
                        }
                        return null;
                      },
                      onSaved: (value){
                        _enteredQuantity = value!;
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: DropdownButtonFormField(value: _selectedCategory,items: [
                      for(final category in categories.entries)
                        DropdownMenuItem(value: category.value,
                            child: Row(
                              children: [
                                Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color
                                ),
                                const Gap(6),
                                Text(category.value.title)
                              ],
                            ))
                    ], onChanged: (value){
                      setState(() {
                        _selectedCategory = value!;
                      });
                        }),
                  )
                ],
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    _formKey.currentState!.reset();
                  }, child:const Text("Reset")),
                  ElevatedButton(onPressed: _saveItem, child:const Text("Add Item"))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
