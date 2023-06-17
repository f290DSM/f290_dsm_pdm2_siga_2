import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardExpand extends StatefulWidget {
  const CardExpand({super.key});

  @override
  State<CardExpand> createState() => _CardExpandState();
}

final DateTime minAgo = DateTime.now().subtract(
  const Duration(minutes: 1),
);

var faker = Faker();

class _CardExpandState extends State<CardExpand> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Card(
        child: Column(
          children: [
            SizedBox(
              height: 72,
              child: Container(
                color: kRedColor,
                child: ListTile(
                  trailing: CloseButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  leading:
                      const Icon(size: 40, Icons.person, color: Colors.white),
                  title: Text(
                    faker.person.firstName(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    style: const TextStyle(color: Colors.white),
                    timeago.format(
                      minAgo,
                      locale: 'pt_BR',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    faker.image.image(
                      random: true,
                      keywords: ['programming'],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36,
              child: ListTile(
                title: Text(
                  faker.company.name(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      style: TextStyle(fontSize: 14),
                      '${faker.lorem.sentences(70)}'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
