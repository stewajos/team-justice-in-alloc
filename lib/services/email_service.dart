import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mailgun/mailgun.dart';

class EmailService {
  var mailgun;

  EmailService();
  /*
  This will generate 3 responses.
  SendResponseStatus.OK
  SendResponseStatus.QUEUED
  SendResponseStatus.FAIL

  if this fails, it will be in response.message
   */
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
}