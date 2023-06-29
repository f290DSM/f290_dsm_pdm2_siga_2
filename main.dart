import 'package:f290_dsm_pdm2_siga_2/comprovantematricula.dart';
import 'package:f290_dsm_pdm2_siga_2/comprovantetrancamento.dart';
import 'package:f290_dsm_pdm2_siga_2/notasefaltas.dart';
import 'package:f290_dsm_pdm2_siga_2/telefones.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secretaria',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Secretaria'),
        ),
        endDrawer: const Drawer(),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: linhaTexto("Requerimento"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfCreationPage(),
                      ));
                },
                child: Text('Rematricula')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GradesPage(),
                      ));
                },
                child: Text("Notas e Faltas")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfCreationPage2(),
                      ));
                },
                child: Text("Trancamento")),
            linhaTexto("Contato"),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Telefones()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepPurple,
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.lightBlue,
                    ),
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Telefones"),
                SizedBox(width: 50),
                Text("Sugestões"),
              ],
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  Padding criarBotao(
      {required String texto, Color? cor, required VoidCallback callback}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: cor),
              onPressed: callback,
              child: Text(texto))),
    );
  }

  _abrirTelaX(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PdfCreationPage()),
    );
  }

  linhaTexto(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            thickness: 5,
            indent: 16,
            endIndent: 16,
            height: 16,
          )),
          Text(texto),
          const Expanded(
              child: Divider(
            thickness: 5,
            indent: 16,
            endIndent: 16,
            height: 16,
          )),
        ],
      ),
    );
  }
}
