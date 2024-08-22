import 'dart:io';

import 'package:mailer/smtp_server/gmail.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mailer/mailer.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<void> sendEmailWithAttachment(
      File pdfFile, String recipientEmail) async {
    // Configure the SMTP server (using Gmail as an example)
    String username = 'amarkounsal@gmail.com';
    String password = 'amarkounsal@2908';

    final smtpServer = gmail(username, password);

    // Create the email message
    final message = Message()
      ..from = Address(username, 'Your Name')
      ..recipients.add(recipientEmail)
      ..subject = 'Your Invoice :: ${DateTime.now()}'
      ..text = 'Please find the attached invoice.'
      ..attachments = [
        FileAttachment(pdfFile)
          ..location = Location.inline
          ..cid = 'invoice.pdf'
      ];

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Email sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Email not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  static Future<void> storeToFirebase(File file) async {
    // TODO: Implement code to store the file to Firebase
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
