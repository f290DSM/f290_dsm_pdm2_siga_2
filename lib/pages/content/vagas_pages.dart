import 'package:f290_dsm_pdm2_siga_2/widgets/vagas_card.dart';
import 'package:flutter/material.dart';

class VagasPage extends StatefulWidget {
  const VagasPage({super.key});

  @override
  State<VagasPage> createState() => _VagasPageState();
}

class _VagasPageState extends State<VagasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.business_center),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Vagas',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
          VagaCard(),
        ],
      ),
    );
  }
}
