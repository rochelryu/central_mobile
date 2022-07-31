import 'package:flutter/material.dart';

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
                                  keyboardType: TextInputType.phone,
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
                              //if(!requestLoading) {}
                              Navigator.pushNamed(context, Home.routeName);
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
