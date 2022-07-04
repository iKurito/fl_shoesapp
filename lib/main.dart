import 'package:fl_shoesapp/src/models/zapato_model.dart';
import 'package:flutter/material.dart';

import 'package:fl_shoesapp/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() { 
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoModel())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ShoesApp',
      debugShowCheckedModeBanner: false,
      home: ZapatoPage()
    );
  }
}