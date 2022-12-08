import 'package:central_mobile_payement/ServicesWorker/ConsumeAPI.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/common_widget.dart';
import '../helpers/style.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  const Login({required Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String contact = "";
  String password = "";
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController contactCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool _contact = false;
  bool _password = false;
  bool viewPassword = false;
  bool requestLoading = false;
  ConsumeAPI consumeAPI = ConsumeAPI();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.34,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Card(
                elevation: 10.0,
                color: Colors.teal.withOpacity(0.35),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.transparent,
                              elevation: _contact ? 4.0 : 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  /*gradient: LinearGradient(
                              colors: [Colors.grey[200], Colors.black12],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          ),*/
                                    color: whiteColor,
                                    border: Border.all(
                                        width: 1.0,
                                        color: _contact
                                            ? greyColor
                                            : whiteColor),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: TextField(
                                  controller: contactCtrl,
                                  style: TextStyle(
                                      color: primaryColor, fontWeight: FontWeight.w300),
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (text) {
                                    setState(() {
                                      _contact = true;
                                      _password = false;
                                      contact = text;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.phone_android,
                                          color: _contact
                                              ? primaryColor
                                              : greyColor),
                                      hintText: "Contact",
                                      hintStyle: const TextStyle(
                                        color: greyColor,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.transparent,
                              elevation: _password ? 4.0 : 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(
                                        width: 1.0,
                                        color: _password
                                            ? greyColor
                                            : whiteColor),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: TextField(
                                  controller: passwordCtrl,
                                  style: TextStyle(
                                      color: primaryColor, fontWeight: FontWeight.w300),
                                  cursorColor: primaryColor,
                                  obscureText: !viewPassword,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {
                                    setState(() {
                                      _contact = false;
                                      _password = true;
                                      password = text;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: () {
                                      setState(() {
                                        viewPassword = !viewPassword;
                                      });
                                    }, icon: Icon(viewPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_sharp)),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.password,
                                          color: _password
                                              ? primaryColor
                                              : greyColor),
                                      hintText: "Mot de passe",
                                      hintStyle: const TextStyle(
                                        color: greyColor,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if(!requestLoading && contactCtrl.text.trim().length == 10 && passwordCtrl.text.trim().length >= 6) {
                                setState(() {
                                  requestLoading = true;
                                });
                                final data = await consumeAPI.signin(contactCtrl.text, passwordCtrl.text);
                                setState(() {
                                  requestLoading = false;
                                });
                                if(data["etat"] == "found" && data["result"]["role"] == "ADMIN_MOBILE_MONEY_BOOT") {
                                  final prefs = await SharedPreferences.getInstance();
                                  await prefs.setInt('idAdmin', 2);
                                  await prefs.setString('ident', data["result"]["ident"]);
                                  await prefs.setString('recovery', data["result"]["recovery"]);
                                  await prefs.setString('name', data["result"]["name"]);
                                  Navigator.pushNamed(context, Home.routeName);
                                } else {
                                  if(data["result"] && data["result"]["role"] != "ADMIN_MOBILE_MONEY_BOOT") {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return dialogCustomError("Non Authorisé", "Vous n'avez pas le droit", context);
                                      },
                                    );
                                  } else {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return dialogCustomError("Indentifiant incoorect",data["error"], context);
                                      },
                                    );
                                  }
                                }
                              } else {
                                if(contactCtrl.text.trim().length != 10 || passwordCtrl.text.trim().length < 6) {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return dialogCustomError("Saisie incomplète","Veuillez remplir coorectement les champs", context);
                                    },
                                  );
                                }
                              }

                            },
                            child: const Text("Connexion"),
                          )
                        ],
                  )),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
