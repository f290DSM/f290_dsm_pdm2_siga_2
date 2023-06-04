import 'package:f290_dsm_pdm2_siga_2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'assets/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

main() async {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation and Themes',
      theme: ThemeData(
        useMaterial3: false,
        cardTheme: const CardTheme(elevation: 5),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        colorScheme: ColorScheme.fromSeed(seedColor: colorpalette).copyWith(
          primary: colorpalette,
          secondary: colorpaletteAccent,
        ),
      ),
      home: const HomePage(),
    );
  }
}
