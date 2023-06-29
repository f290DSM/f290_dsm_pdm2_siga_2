import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int expandedIndex = -1;

  final _noticias = Supabase.instance.client
      .from('noticia')
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
                'Pagina Inicial',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _noticias,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final noticias = snapshot.data!;
          return ListView.builder(
            itemCount: noticias.length,
            itemBuilder: ((context, index) {
              final supaBaseNoticia = noticias[index];
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
                    children: [
                      SizedBox(
                        height: 72,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              supaBaseNoticia['img_logo'],
                            ),
                          ),
                          title: Text(
                            supaBaseNoticia['sigla_curso'],
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            supaBaseNoticia['descricao_curso'],
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                  supaBaseNoticia['url_imagem'],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                supaBaseNoticia['titulo'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: isExpanded ? null : 0,
                        child: ListTile(
                          subtitle: Text(
                            supaBaseNoticia['conteudo'],
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
                                    supaBaseNoticia['curtidas'].toString(),
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
