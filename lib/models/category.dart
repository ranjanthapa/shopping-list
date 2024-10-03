import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  convenience,
  hygiene,
  spices,
  other
}

class Category{
  final String title;
  final Color color;

  const Category(this.title, this.color);
}