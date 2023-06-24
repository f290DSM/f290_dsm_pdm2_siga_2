import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VagasPage extends StatefulWidget {
  const VagasPage({Key? key}) : super(key: key);

  @override
  State<VagasPage> createState() => _VagasPageState();
}

class _VagasPageState extends State<VagasPage> {
  int expandedIndex = -1;

  final _vagas = Supabase.instance.client
      .from('vaga')
      .select<List<Map<String, dynamic>>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerNavigator(),
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Vagas de Emprego',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _vagas,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final vagas = snapshot.data!;
          return ListView.builder(
            itemCount: vagas.length,
            itemBuilder: ((context, index) {
              final supaBaseVaga = vagas[index];
              final isExpanded = expandedIndex == index;
              return Card(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = -1;
                      } else {
                        expandedIndex = index;
                      }
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              supaBaseVaga['logo_empresa'],
                            ),
                          ),
                          title: Text(
                            supaBaseVaga['nome_empresa'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: Text(
                            supaBaseVaga['titulo'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isExpanded ? null : 0,
                        child: ListTile(
                          subtitle: Text(
                            supaBaseVaga['descricao'],
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
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    supaBaseVaga['curtidas'].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const Icon(
                                    color: Colors.black,
                                    Icons.favorite_border_outlined,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
