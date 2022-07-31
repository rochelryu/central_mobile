import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({required Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>  {
  final telephony = Telephony.instance;
  List<Map<String, String>> transactions = [];

  void _incrementCounter() {
    UssdAdvanced.sendUssd(code: "*155*2*1*0101733465*5000#", subscriptionId: -1);
    /*setState(() {
      _response = _res ?? 'aucun';
    });*/
  }

  @override
  initState() {
    super.initState();
    initPlatformState();
    getAllMessage();
  }

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onGetNewMessage,
          onBackgroundMessage: onMessage
      );
    }

    if (!mounted) return;
  }

  onMessage(SmsMessage message) async {
    switch(message.address) {
      case "+454":
        final body = message.body ?? '';
        if(body.contains('transfert de')) {
          final bool isSent = body.contains('Le transfert de');
          final amount = body.split("FCFA")[0].substring(body.split("FCFA")[0].indexOf('transfert de') + 12).split('.')[0].trim();
          final numberClient = body.split(isSent ? "FCFA vers le ": "FCFA du ")[1].substring(0, 10).trim();
          final newSolde = body.split(isSent ? "Solde:": "solde ")[1].split("FCFA")[0].split('.')[0].trim();
          final ref = body.split(isSent ? "Reference:" : "Reference")[1].split(isSent ? ". Orange" : ". Nouveau")[0];
          setState(() {
            transactions.add({
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Orange",
              'central_reception': '0759091566',
            });
          });

        }
        break;
      case "WAVE":
        final body = message.body ?? '';
        if(body.contains('Vous avez')) {
          final bool isSent = body.contains('Vous avez envoyé ');
          final amount = body.split("\n")[0].split(isSent ? "envoyé ": "recu ")[1].split("F")[0].replaceAll('.', '').trim();
          final numberClient = body.split("\n")[1].trim();

          final newSolde = body.split("\n")[isSent ?4:2].split("solde: ")[1].split("F")[0].replaceAll('.', '').trim();
          final ref = body.split("\n")[body.split("\n").length - 1];
          setState(() {
            transactions.add({
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Wave",
              'central_reception': '0150869974',
            });
          });
        }
        break;
      case "MOOVMONEY":
        final body = message.body ?? '';
        if(body.contains('Votre nouveau solde Moov money') && body.contains('225')) {
          final bool isSent = body.contains('Vous avez envoye ');
          final amount = body.split("\n")[0].split(isSent ? "envoye ": "recu ")[1].split("FCFA")[0].trim();
          final numberClient = body.split("\n")[0].split(isSent ? "au numero 225": "de 225")[1].substring(0, 10).trim();
          final newSolde = body.split("\n")[0].split("Votre nouveau solde Moov money est de")[1].split("FCFA")[0].trim();
          final ref = body.split("\n")[isSent ? 1:0].split(":")[1].replaceAll('.', '').trim();
          setState(() {
            transactions.add({
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Moov",
              'central_reception': '0150869974',
            });
          });
        }
        break;
      default:
        break;
    }

  }

  onGetNewMessage(SmsMessage message) async {
    switch(message.address) {
      case "+454":
        final body = message.body ?? '';
        if(body.contains('transfert de')) {
          final bool isSent = body.contains('Le transfert de');
          final amount = body.split("FCFA")[0].substring(body.split("FCFA")[0].indexOf('transfert de') + 12).split('.')[0].trim();
          final numberClient = body.split(isSent ? "FCFA vers le ": "FCFA du ")[1].substring(0, 10).trim();
          final newSolde = body.split(isSent ? "Solde:": "solde ")[1].split("FCFA")[0].split('.')[0].trim();
          final ref = body.split(isSent ? "Reference:" : "Reference")[1].split(isSent ? ". Orange" : ". Nouveau")[0];
          setState(() {
            transactions.insert(0, {
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Orange",
              'central_reception': '0759091566',
            });
          });

        }
        break;
      case "WAVE":
        final body = message.body ?? '';
        if(body.contains('Vous avez')) {
          final bool isSent = body.contains('Vous avez envoyé ');
          final amount = body.split("\n")[0].split(isSent ? "envoyé ": "recu ")[1].split("F")[0].replaceAll('.', '').trim();
          final numberClient = body.split("\n")[1].trim();
          final newSolde = body.split("\n")[isSent ?4:2].split("solde: ")[1].split("F")[0].replaceAll('.', '').trim();
          final ref = body.split("\n")[body.split("\n").length - 1];
          setState(() {
            transactions.insert(0, {
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Wave",
              'central_reception': '0150869974',
            });
          });
        }
        break;
      case "MOOVMONEY":
        final body = message.body ?? '';
        if(body.contains('Votre nouveau solde Moov money') && body.contains('225')) {
          final bool isSent = body.contains('Vous avez envoye ');
          final amount = body.split("\n")[0].split(isSent ? "envoye ": "recu ")[1].split("FCFA")[0].trim();
          final numberClient = body.split("\n")[0].split(isSent ? "au numero 225": "de 225")[1].substring(0, 10).trim();
          final newSolde = body.split("\n")[0].split("Votre nouveau solde Moov money est de")[1].split("FCFA")[0].trim();
          final ref = body.split("\n")[isSent ? 1:0].split(":")[1].replaceAll('.', '').trim();
          setState(() {
            transactions.insert(0, {
              'id': message.id.toString(),
              'isSent': isSent ? "Envoyé": "Reçu",
              'amount': amount,
              'numberClient': numberClient,
              'newSolde': newSolde,
              'ref': ref,
              'network': "Moov",
              'central_reception': '0150869974',
            });
          });
        }
        break;
      default:
        break;
    }

  }

  Future<void> getAllMessage() async {
    List<SmsMessage> messages = await telephony.getInboxSms();

    for (var message in messages) {
      await onMessage(message);
    }

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(height: 10,),
        title: const Text("Accueil"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
                width: 70,
                height: double.infinity,
                child: Center(child: transactions[index]['isSent'] == "Envoyé" ? const Icon(Icons.upload_outlined, size: 25, color: Colors.amber): const Icon(Icons.download_outlined, size: 25, color: Colors.tealAccent),)),
            title: Text("${transactions[index]['network']} - Centrale ${transactions[index]['central_reception']}"),
            subtitle: Text("Montant ${transactions[index]['amount']}; Information du client ${transactions[index]['numberClient']};  Solde après transaction ${transactions[index]['newSolde']}, Reference transaction ${transactions[index]['ref']}"),
            trailing: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey)
              ),
              child: Column(
                children: [
                  const Text("ID SMS"),
                  Text("${transactions[index]['id']}"),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}