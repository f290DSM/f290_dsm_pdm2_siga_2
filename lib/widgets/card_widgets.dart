import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardForHomePage extends StatelessWidget {
  CardForHomePage({super.key});

  final DateTime minAgo = DateTime.now().subtract(
    const Duration(minutes: 1),
  );
  final DateTime dayAgo = DateTime.now().subtract(
    const Duration(days: 1),
  );
  final DateTime monthAgo = DateTime.now().subtract(
    const Duration(days: 31),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: SizedBox(
          height: 382,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.redAccent.shade100,
            child: SizedBox(
              height: 382,
              child: Column(
                children: [
                  SizedBox(
                    height: 72,
                    child: ListTile(
                      leading: const Icon(size: 40, Icons.person),
                      title: const Text('FATEC'),
                      subtitle: Text(
                        timeago.format(
                          minAgo,
                          locale: 'pt_BR',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 194,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 72,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Acao 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Acao 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
