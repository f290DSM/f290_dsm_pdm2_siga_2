import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';

import 'package:f290_dsm_pdm2_siga_2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

main() async {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  await Supabase.initialize(
    url: 'https://ttoqlukioexgbwldsbbf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0b3FsdWtpb2V4Z2J3bGRzYmJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxOTAxMTIsImV4cCI6MjAwMTc2NjExMn0.Hjb7aH-MI5qXR9L1sTc-7PX5aUgHf6e7I-ex0S2Sxl4',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

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
