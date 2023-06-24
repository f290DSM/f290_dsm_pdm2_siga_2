import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/pages/content/vagas_pages.dart';
import 'package:flutter/material.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VagasPage(),
                ),
              );
            },
            leading: const Icon(Icons.business_center),
            title: const Text(
              'Vagas',
            ),
          ),
        ],
      ),
    );
  }
}
