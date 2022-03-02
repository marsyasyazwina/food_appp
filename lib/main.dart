import 'package:flutter/material.dart';
import 'package:food_appp/model/meal.dart';
import 'package:food_appp/screen/categories_meals_screen.dart';
import 'package:food_appp/screen/detail_meals_screen.dart';
import 'package:food_appp/screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<Meal> _favoriteMeals = [];
  // function untuk berfungsi
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  //untuk mengubah warnanya
  bool _isfavorite(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(
          secondary: Colors.black38,
        ),
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          headline6: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
              fontWeight: FontWeight.bold
          )
        )

      ),
      //home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(_favoriteMeals),
        CategoriesMealsScreen.routeName : (context) => CategoriesMealsScreen(),
        DetailMealsScreen.routesName : (context) => DetailMealsScreen(_toggleFavorite, _isfavorite)
      },
    );
  }
}


