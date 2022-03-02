import 'package:flutter/material.dart';

class Category {
  final String title;
  final String id;
  final Color color;

  Category({
    required this.id,
    required this.title,
    this.color = Colors.white
});
}

var categories = [
  Category(
      id: 'c1',
      title: 'Dessert',
    color: Color(0xffFFEEAD)
  ),
  Category(
      id: 'c2',
      title: 'Lunch',
      color: Color (0xff96CEB4)
  ),
  Category(
      id: 'c3',
      title: 'Dinner',
      color: Color (0xffE8E8A6)
  ),
  Category(
      id: 'c4',
      title: 'Breakfast',
      color: Color (0xffD67D3E)
  ),
  Category(
      id: 'c5',
      title: 'Snack',
      color: Color (0xffF3C5C5)
  ),
  Category(
      id: 'c6',
      title: 'Italian',
      color: Color (0xff886F6F)
  ),
  Category(
      id: 'c7',
      title: 'Indonesian',
      color: Color (0xffFFEEAD)
  ),
  Category(
      id: 'c8',
      title: 'Turkey',
      color: Color (0xffE7FBBE)
  ),

];