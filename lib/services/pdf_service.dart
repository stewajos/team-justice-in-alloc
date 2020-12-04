import 'dart:io';
import 'package:allocation_app/model/recipient_model.dart';
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

  Future<File> writeTestFile(String userEmail, String hashKey, List<String> recipients, int supply, int numApplicants, String timestamp) async {
    final file = await _localFile;
    final doc = pw.Document();
    List<List<String>> choiceList = new List();
    choiceList.add(<String>['Applicant Number','Applicant ID']);
    print(recipients.length);
    for(int i = 0; i < recipients.length; i++){
      List<String> choices = <String>[
        (i+1).toString(),
        recipients[i],
      ];
      choiceList.add(choices);
    }

    doc.addPage(pw.MultiPage(
     pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context){
       if(context.pageNumber == 1){
         return null;
       }
       return pw.Container(
         alignment: pw.Alignment.centerRight,
         margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
         padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
         decoration: const pw.BoxDecoration(
           border: pw.BoxBorder(
             bottom: true, width: 0.5, color: PdfColors.grey50)),
         child: pw.Text('Project Alek', style: pw.Theme.of(context).defaultTextStyle.copyWith(color: PdfColors.grey50)));
      },
      footer: (pw.Context context){
       return pw.Container(
         alignment: pw.Alignment.centerRight,
         margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
         child: pw.Text(
           "Page ${context.pageNumber} of ${context.pagesCount}",
           style: pw.Theme.of(context).defaultTextStyle.copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
        pw.Header(
          level: 0,
          text: 'Project Alek - Allocation Report',
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: <pw.Widget>[
              pw.Text('Project Alek - Allocation Report', textScaleFactor: 2),
              //Logo could go here for the PDF page
            ]
          )
        ),
        pw.Paragraph(
          text: 'Here are the details of the allocation run: ',
        ),
        pw.Paragraph(
          text: 'User Email: $userEmail \n'
              'HashKey: $hashKey \n'
              'Date Ran: $timestamp\n'
              'Supply Quantity: $supply \n'
              'Number of Applicants: $numApplicants\n',
          style: pw.TextStyle(fontSize: 10)
        ),
        pw.Paragraph(
          text: 'Applicants Selected',
          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold,
              decoration: pw.TextDecoration.underline),
        ),
        pw.Table.fromTextArray(context: context, data: choiceList,
            cellAlignment: pw.Alignment.center),
      ],
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