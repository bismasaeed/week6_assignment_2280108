import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_plugin/provider.dart';
import 'home.dart';
import 'provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NumberProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
