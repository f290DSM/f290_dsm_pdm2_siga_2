import 'package:f290_dsm_pdm2_siga_2/pages/grades-and-absences.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/account_page.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/login_page.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/splash_page.dart';
import 'assets/constants.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://mlsymiabawlmyicyhiap.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1sc3ltaWFiYXdsbXlpY3loaWFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODczNzgxOTIsImV4cCI6MjAwMjk1NDE5Mn0.8wveDs-lP94TW2ZsylD5YpadyYJ_KQ7LAoMtDerIJrI',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siga 2.0',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: mColorGrena).copyWith(
          primary: mColorGrena,
          secondary: mColorGrey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
        '/grades-and-absences': (_) => const GradesAbsencesPage(),
      },
    );
  }
}
