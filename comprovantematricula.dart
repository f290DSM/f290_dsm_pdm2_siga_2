import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfCreationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController raController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  Future<void> generatePDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'Fatec Araras',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'Antonio Brambilla',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Dados do Aluno:',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Nome: ${nameController.text}'),
              pw.Text('RA: ${raController.text}'),
              pw.Text('Semestre: ${semesterController.text}'),
              pw.SizedBox(height: 20),
              pw.Text(
                  'Rematricula confirmada para o Curso: Desenvolvimento de Software Multiplataforma'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/student_info.pdf');
    await file.writeAsBytes(await pdf.save());

    await Printing.sharePdf(
        bytes: await pdf.save(), filename: 'student_info.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário para Rematricula'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: raController,
              decoration: InputDecoration(labelText: 'RA'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: semesterController,
              decoration: InputDecoration(labelText: 'Semestre'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => generatePDF(context),
              child: Text('Rematricula'),
            ),
          ],
        ),
      ),
    );
  }
}
