import 'dart:io';

import 'package:central_mobile_payement/helpers/my_flutter_app_icons.dart';
import 'package:central_mobile_payement/helpers/style.dart';
import 'package:flutter/material.dart';

class DetailsTransaction extends StatefulWidget {
  static String routeName = "/DetailsTransaction";
  const DetailsTransaction({required Key key}) : super(key: key);

  @override
  State<DetailsTransaction> createState() => _DetailsTransactionState();
}

class _DetailsTransactionState extends State<DetailsTransaction> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35, bottom: 5),
              width: double.infinity,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Platform.isAndroid ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back, color: whiteColor, size: 25,)) : GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios_new, color: whiteColor, size: 25),
                        Text("Back", style: simpleTextWhite(),)
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Transfer", style: textTabsActif(20),),
                  Spacer(),
                  IconButton(onPressed: () {

                  }, icon: Icon(Platform.isIOS ? MyFlutterApp.share_1_ : MyFlutterApp.share, color: whiteColor, size: 22))
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text("+0.03031643 BTC", style: textBolderWithColor(30, sucessColor),),
            const SizedBox(height: 5),
            Text("≈ \$499.97", style: textBoldWithColor(16, greyColor),),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: whiteColor,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 0.5, color: greyColor.withOpacity(0.2))
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                            Text("Today, 2022 at 07:20", style: simpleTextWithCustomSizeAndColors(15)),
                          ],
                        ),
                      ),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 0.5, color: greyColor.withOpacity(0.2))
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Status", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                                  const Icon(Icons.info_rounded, color: greyColor,size: 17,)
                                ],
                              ),
                            ),
                            Text("Confirmé", style: simpleTextWithCustomSizeAndColors(15)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sender", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                            Text("bc1qj07dd0...80emeuxc52m", style: simpleTextWithCustomSizeAndColors(15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: whiteColor,
                child: Container(
                  height: 22,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: 125,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Network Fee", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                            const Icon(Icons.info_rounded, color: greyColor,size: 17)
                          ],
                        ),
                      ),
                      Text("0.00001074 BTC (\$0.17)", style: simpleTextWithCustomSizeAndColors(15)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text("View on block explorer", style: textBoldWithColor(15, primaryColor),),


          ],
        ),
      ),
    );
  }
}
