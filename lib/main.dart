// void main() async {
//   await Supabase.initialize(
//     url: 'https://mlsymiabawlmyicyhiap.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1sc3ltaWFiYXdsbXlpY3loaWFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODczNzgxOTIsImV4cCI6MjAwMjk1NDE5Mn0.8wveDs-lP94TW2ZsylD5YpadyYJ_KQ7LAoMtDerIJrI',
//     authFlowType: AuthFlowType.pkce,
//   );
//   runApp(const MyApp());
// }
//
// final supabase = Supabase.instance.client;
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         useMaterial3: false,
//         colorScheme: ColorScheme.fromSeed(seedColor: mColorGrena).copyWith(
//           primary: mColorGrena,
//           secondary: mColorGrey,
//         ),
//       ),
//       home: const MyHomePage(title: 'SIGA 2.0'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   int c = 0;
//   var _slider = 5.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(children: [
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                   labelText: 'LabelText',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8)))),
//             ),
//           ),
//           FilledButton(onPressed: () {}, child: const Text('FilledButton')),
//           const Card(
//             elevation: 5,
//             child: SizedBox(
//               height: 100,
//               width: 300,
//             ),
//           ),
//           OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
//           Slider(
//             min: 1,
//             max: 10,
//             divisions: 10,
//             value: _slider,
//             onChanged: (value) => setState(() => _slider = value),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               10,
//               (index) => Container(
//                 height: 30,
//                 width: 30,
//                 color: mColorGrena.withAlpha(c += 25),
//               ),
//             ),
//           ),
//         ]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/account_page.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/login_page.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/splash_page.dart';

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
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
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
      },
    );
  }
}
