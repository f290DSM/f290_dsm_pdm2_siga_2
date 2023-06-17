import 'package:f290_dsm_pdm2_siga_2/widgets/card_widgets.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Pagina Inicial',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const SafeArea(
        child: DrawerNavigator(),
      ),
      body: ListView(
        children: [
          CardForHomePage(),
          CardForHomePage(),
          CardForHomePage(),
          CardForHomePage(),
          CardForHomePage(),
          CardForHomePage(),
        ],
      ),
    );
  }
}
