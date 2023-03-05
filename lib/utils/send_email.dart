import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendEmail {
  Future sendEmail({
    required String receipientEmail,
    required String receipientName,
    required String emailSubject,
    required String title,
    required String password,
    required String userID,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': 'service_lnvqm3n',
          'template_id': 'template_c7ou2yy',
          'user_id': 'NLAy19Mjxx7TR3V9A',
          'template_params': {
            'receipient_email': receipientEmail,
            'receipient_name': receipientName,
            'email_subject': emailSubject,
            'email_title': title,
            'us_psk': password,
            'user_id': userID,
          }
        }),
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
