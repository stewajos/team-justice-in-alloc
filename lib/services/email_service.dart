import 'package:allocation_app/model/result_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mailgun/mailgun.dart';

import 'dart:io';

class EmailService {
  var mailgun;

  EmailService();

  Future<void> sendTestEmail() async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    final defaults = <String, dynamic>{
      'beta_mailgun_apikey': 'not a real apikey',
      'beta_mailgun_domain': 'not a real domain'
    };
    await remoteConfig.setDefaults(defaults);

    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();

    var domain = remoteConfig.getString('beta_mailgun_domain');
    var apikey = remoteConfig.getString('beta_mailgun_apikey');

    mailgun = MailgunMailer(
        domain: domain,
        apiKey: apikey
    );

    var to = List<String>();
    to.add("projalek@gmail.com");

    //var file = new File('result.pdf');

    var response = await mailgun.send(
      from: "noreply@projalek.com",
      to: to,
      subject: "test email",
      text: "Hello World!",
      //attachments: [file]
    );

    print("We sent the email?");
    print(response.message);
  }

  Future<void> sendResultEmail(String email, File pdf) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    final defaults = <String, dynamic>{
      'mailgun_apikey': 'not a real apikey',
      'mailgun_domain': 'not a real domain'
    };
    await remoteConfig.setDefaults(defaults);

    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();

    var domain = remoteConfig.getString('mailgun_domain');
    var apikey = remoteConfig.getString('mailgun_apikey');

    mailgun = MailgunMailer(
        domain: 'mg.projalek.com', //TODO: Change this to mailgun_domain once the remote config updates
        apiKey: apikey
    );

    var emailList = List<String>();
    emailList.add(email);

    //var file = new File('result.pdf');

    var response = await mailgun.send(
      from: "noreply@projalek.com",
      to: emailList,
      subject: "Project Alek Result",
      text: "Attached is a pdf of your result. Thank you for using Project Alek. \n Sincerely, \n The Project Alek Team",
      attachments: [pdf]
    );

    print(response.message);
  }

  Future<void> sendTestResultEmail(String email, File pdf) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    final defaults = <String, dynamic>{
      'beta_mailgun_apikey': 'not a real apikey',
      'beta_mailgun_domain': 'not a real domain'
    };
    await remoteConfig.setDefaults(defaults);

    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();

    var domain = remoteConfig.getString('beta_mailgun_domain');
    var apikey = remoteConfig.getString('beta_mailgun_apikey');

    mailgun = MailgunMailer(
        domain: domain,
        apiKey: apikey
    );

    var to = List<String>();
    to.add('projalek@gmail.com');

    //var file = new File('result.pdf');

    var response = await mailgun.send(
        from: "noreply@projalek.com",
        to: to,
        subject: "Project Alek Result",
        text: "Attached is a pdf of your result. Thank you for using Project Alek. \n Sincerely, \n The Project Alek Team",
        attachments: [pdf]
    );

    print("This is set to send to projalek@gmail.com by default");
    print(response.message);
  }
}