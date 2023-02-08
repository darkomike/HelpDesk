import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendEmail {
  String createBody({name, email, studentNumber,role}) {
    String emailBody =
        'Dear $name, \nWe are excited to welcome you to \'The HelpDesk Platform for Computer Science\'! \nYour account has been created \nYour User Role is - \nYour login credentials are:\n- Email: $email- Password:$studentNumber\nPlease use these credentials to log in to our platform and reset your password.\nDownload the "HelpDesk Computer Science Knust" Application on Google PlayStore (Android) or the App Store(iOS)\nIf you have any questions or need assistance,don\'t hesitate to reach out to us. Our support team is always here to help.';
    return emailBody;
  }

  Future<String> sendEmail({
    required String body,
    required String subject,
    required List<String> receipients,
    List<String> cc = const [],
    List<String> bcc = const [],
    List<String>? attachements,
  }) async {
    String response;

    final Email email = Email(
      body: body,
      subject: subject,
      recipients: receipients,
      cc: cc,
      bcc: bcc,
      attachmentPaths: attachements,
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
      response = 'success';
    } catch (error) {
      response = error.toString();
    }

    return response;
  }
}
