import 'package:f290_dsm_pdm2_siga_2/assets/constants.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/card_expand_widgets.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/card_widgets.dart';
import 'package:f290_dsm_pdm2_siga_2/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final _noticias = Supabase.instance.client
      .from('noticia')
      .select<List<Map<String, dynamic>>>();
  //
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
              final sbDb = noticias[index];
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
                              leading: const Icon(
                                  size: 40, Icons.person, color: kRedColor),
                              title: Text(
                                sbDb['sigla_curso'],
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                sbDb['descricao_curso'],
                                style: const TextStyle(color: Colors.grey),
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
                                  sbDb['url_imagem'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 72,
                            child: ListTile(
                              subtitle: Text(
                                sbDb['conteudo'],
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              title: Text(
                                sbDb['titulo'],
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                  child: Row(children: [
                                    Text(
                                      style: TextStyle(color: Colors.black),
                                      sbDb['curtidas'].toString(),
                                    ),
                                    const Icon(
                                        color: Colors.black,
                                        Icons.favorite_border_outlined),
                                  ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
