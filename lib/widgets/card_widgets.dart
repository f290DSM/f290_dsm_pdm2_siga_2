import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/card_expand_widgets.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardForHomePage extends StatelessWidget {
  CardForHomePage({super.key});

  final DateTime minAgo = DateTime.now().subtract(
    const Duration(minutes: 1),
  );
  final _future = Supabase.instance.client
      .from('noticia')
      .select<List<Map<String, dynamic>>>();
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 382,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CardExpand(),
              ),
            );
          },
          splashColor: kRedColorAccent,
          child: SizedBox(
            height: 382,
            child: Column(
              children: [
                SizedBox(
                  height: 72,
                  child: ListTile(
                    leading:
                        const Icon(size: 40, Icons.person, color: kRedColor),
                    title: Text(
                      '${faker.person.firstName()}',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      style: const TextStyle(color: Colors.grey),
                      timeago.format(
                        minAgo,
                        locale: 'pt_BR',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                  height: 72,
                  child: ListTile(
                    subtitle: Text(
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                      faker.lorem.sentence(),
                    ),
                    title: Text('${faker.company.name()}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
        ),
      ),
    );
  }
}
