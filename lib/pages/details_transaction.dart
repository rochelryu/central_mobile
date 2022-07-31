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
              height: 80,
              width: double.infinity,
              color: primaryColor,
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Platform.isAndroid ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.arrow_back, color: whiteColor)) : GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_new, color: whiteColor),
                                Text("Back", style: simpleTextWhite(),)
                              ],
                            ),
                      )
                  ),
                  Expanded(
                      flex: 8,
                      child: Row(
                        mainAxisAlignment: Platform.isIOS? MainAxisAlignment.center: MainAxisAlignment.start,
                        children: [
                          Text("Transfer", style: textTabsActif(15),),
                          const SizedBox(width: 25,)
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(onPressed: () {

                      }, icon: Icon(Platform.isIOS ? MyFlutterApp.share_1_ : MyFlutterApp.share, color: whiteColor,))
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text("+0.132015 BTC", style: textBolderWithColor(30, sucessColor),),
            SizedBox(height: 5),
            Text("≈ \$3,157.13", style: textBoldWithColor(16, greyColor),),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 1,
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
                            Text("Jul 30, 2022 at 20:32", style: simpleTextWithCustomSizeAndColors(15)),
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
                            Text("Completed", style: simpleTextWithCustomSizeAndColors(15)),
                          ],
                        ),
                      ),
                      Container(
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sender", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                            Text("19dENFt4w...57WCS58", style: simpleTextWithCustomSizeAndColors(15)),
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
                color: whiteColor,
                child: Container(
                  height: 30,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: 115,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Network Fee", style: simpleTextWithCustomSizeAndColors(15, Colors.black)),
                            const Icon(Icons.info_rounded, color: greyColor,size: 17,)
                          ],
                        ),
                      ),
                      Text("0.00004156 BTC (\$0.67)", style: simpleTextWithCustomSizeAndColors(15)),
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
      bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.shield),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Platform.isAndroid ? MyFlutterApp.th_large: MyFlutterApp.compass),
                label: Platform.isAndroid ? 'DApps': 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Platform.isAndroid ? MyFlutterApp.exchange: MyFlutterApp.th_large),
                label: Platform.isAndroid ? 'DEX': 'Browser',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ])
    );
  }
}
