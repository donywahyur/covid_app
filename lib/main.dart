import 'package:covid_app/provider/data.dart';
import 'package:covid_app/screen/provinsi_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid App',
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ], child: ProvinsiScreen()),
    );
  }
}
