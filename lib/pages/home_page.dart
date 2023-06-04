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
        title: const Center(
          child: Text('Home Page'),
        ),
      ),
      endDrawer: const SafeArea(child: DrawerNavigator()),
      body: ListView(
        children: [
          CardForHomePage(),
          CardForHomePage(),
          CardForHomePage(),
        ],
      ),
    );
  }
}
