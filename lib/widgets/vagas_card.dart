import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/vagas_expand_widgets.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class VagaCard extends StatefulWidget {
  const VagaCard({super.key});

  @override
  State<VagaCard> createState() => _VagaCardState();
}

var faker = Faker();

class _VagaCardState extends State<VagaCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VagasExpand(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            leading: Icon(Icons.business_sharp),
            title: Text(
              faker.job.title(),
            ),
            subtitle: Text(
              faker.lorem.sentence(),
            ),
            trailing: Text(
              faker.company.name(),
            ),
          ),
        ),
      ),
    );
  }
}
