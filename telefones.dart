import 'package:f290_dsm_pdm2_siga_2/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Telefones extends StatelessWidget {
  const Telefones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Telefones',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Telefones'),
            ),
            endDrawer: const Drawer(),
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 45),
                ),
                Container(
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 80),
                          child: Text(
                            "Secretaria",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 35),
                          child: Text(
                            "19 999482233",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchTel();
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Colors.grey,
                    child: const Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, top: 30, right: 15, bottom: 20),
                          child: Text(
                            "Assuntos relacionados a documentação, problemas com presença, requisição de informações e outros.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),

                // ********** Container 2 *************

                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 80),
                          child: Text(
                            "Biblioteca",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 35),
                          child: Text(
                            "19 35442869",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchTel2();
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: const Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, top: 30, right: 15, bottom: 20),
                          child: Text(
                            "Assuntos relacionados a livros, devoluções, disponibilidade de material e outros.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),

                // ********** Container 3 *************

                Container(
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 52),
                          child: Text(
                            "Coordenação",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            "19 985236449",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchTel3();
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Colors.grey,
                    child: const Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, top: 30, right: 15, bottom: 20),
                          child: Text(
                            "Assuntos relacionados especificamente ao curso prestado, como dúvidas em relação a agendamento, calendário e outros.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              child: const Icon(Icons.arrow_back),
            )));
  }

  void _launchTel() async {
    const phoneNumber = '19999482233';
    const url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Não foi possível abrir o teclado de discagem';
    }
  }

  void _launchTel2() async {
    const phoneNumber = '1935442869';
    const url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Não foi possível abrir o teclado de discagem';
    }
  }

  void _launchTel3() async {
    const phoneNumber = '19985236449';
    const url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Não foi possível abrir o teclado de discagem';
    }
  }
}
