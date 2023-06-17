import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/home_page.dart';
import 'package:flutter/material.dart';
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
      title: 'Siga 2.0',
      theme: ThemeData(
        cardTheme: const CardTheme(elevation: 4),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: kRedColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: kRedColor).copyWith(
          primary: kRedColor,
          secondary: kRedColorAccent,
        ),
      ),
      home: const HomePage(),
    );
  }
}
