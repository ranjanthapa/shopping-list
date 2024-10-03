import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main(){
  return runApp(const App());
}

final themeData = ThemeData.dark().copyWith(
  colorScheme:  ColorScheme.fromSeed(
    seedColor:  const Color.fromARGB(255, 147, 229, 250),
    brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 42, 51, 59),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
);




class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: themeData,
      home:const HomeScreen() ,
    );
  }
}
