import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/Utils/color_scheme.dart';
import 'package:weather_app/Screen/my_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Demo',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
              // colorScheme:
              //     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 202, 196, 206)),
              )
          .copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor:
                kColorScheme.onPrimaryContainer, //Colors.transparent,
            elevation: 0.0),
        scaffoldBackgroundColor: Colors.transparent,
        cardTheme: const CardTheme().copyWith(),
        textTheme: ThemeData().textTheme.copyWith(),
      ),
      home: const MyHomePage(),
    );
  }
}
