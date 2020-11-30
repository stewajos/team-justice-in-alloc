import 'dart:io';

import 'package:allocation_app/model/result_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class PdfService {

  PdfService();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/result.pdf');
  }

  Future<File> writeTestFile() async {
    final file = await _localFile;
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Project Alek'),
        ),
      ),
    );

    file.writeAsBytesSync(doc.save());
    return file;
  }

  Future<File> getTestFile() async {
    try {
      final file = await _localFile;
      return file;
    } catch (e) {
      return null;
    }
  }

  File resultToPdf(ResultModel data){
    
    return null;
  }
}