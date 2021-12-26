import 'package:electronic_shop/app_theme.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './frontend/home_page.dart';
import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderManagement(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(),
        title: 'Electronic Shop',
        home: HomePage(),
      ),
    );
  }
}
