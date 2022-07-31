import 'dart:io';

import 'package:flutter/material.dart';
import '../helpers/style.dart';
import '../helpers/my_flutter_app_icons.dart';
import 'details_transaction.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({required Key key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =  TabController(length: 2, vsync: this);
  }

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
              width: MediaQuery.of(context).size.width,
              height: Platform.isAndroid ? 310: 290,
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/bell.png", height: Platform.isAndroid ? 30:20),
                        const SizedBox(width: 10),
                        if(Platform.isAndroid) Expanded(child: Container(
                              height: 33,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(
                                          child: Text("Tokens", style: textTabsActif(),),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Text("Finance", style: textTabsUnActif(),),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Text("Collectibles", style: textTabsUnActif(),),
                                        ),
                                      )),
                                ],
                              ),
                            )),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/optionm.png", height: Platform.isAndroid ? 30:20),
                      ],
                    ),
                  ),
                  Text("\$3,157.13", style: textTabsActif(35)),
                  Text("Multi-Coin wallet", style: textTabsUnActif(17)),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10
                                ),
                                child: Center(
                                  child: Image.asset("assets/images/upload.png", height: 20),
                                ),
                              ),
                              Text("Send", style: textTabsActif(13),),
                            ],
                          ),
                        ),
                        SizedBox(width: Platform.isAndroid ? 40:30),
                        SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white10
                                ),
                                child: Center(
                                  child: Image.asset("assets/images/downloadm.png", height: 20),
                                ),
                              ),
                              Text("Receive", style: textTabsActif(13),),
                            ],
                          ),
                        ),
                        SizedBox(width: Platform.isAndroid ? 40:30),
                        SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white10
                                ),
                                child: Center(
                                  child: Image.asset("assets/images/tag.png", height: 20),
                                ),
                              ),
                              Text("Buy", style: textTabsActif(13),),
                            ],
                          ),
                        ),
                        if(Platform.isIOS) SizedBox(width: Platform.isAndroid ? 40:30),
                        if(Platform.isIOS) SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white10
                                ),
                                child: Center(
                                  child: Image.asset("assets/images/switch.png", height: 20),
                                ),
                              ),
                              Text("Swap", style: textTabsActif(13),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            if(Platform.isIOS) Container(
              color: primaryColor,
              height: 45,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 43,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          color: Colors.white
                        ),
                        child: TabBar(
                          controller: _controller,
                          unselectedLabelColor: greyColor,
                          labelColor: primaryColor,
                          indicatorColor: primaryColor,
                          tabs: const <Widget>[
                            Tab(
                              text: "Tokens",
                            ),
                            Tab(
                              text: "NFTs",
                            ),

                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailsTransaction.routeName);
              },
              child: Container(
                height: 65,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: Platform.isAndroid ? BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)):BorderSide.none
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: greyColor),
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/btc.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(bottom: Platform.isAndroid ? BorderSide.none : BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Bitcoin", style: textBoldWithColor(15),),
                                    Container(
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Text("\$23,961.87", style: simpleTextWithCustomSizeAndColors(12),),
                                          const SizedBox(width: 5),
                                          Text("+0.32%", style: simpleTextWithCustomSizeAndColors(12, sucessColor),),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("0.132015 BTC", style: textBoldWithColor(15),),
                                    Text("\$3,157.13", style: simpleTextWithCustomSizeAndColors(12),),
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: Platform.isAndroid ? BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)):BorderSide.none
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,

                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: greyColor),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/eth.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(bottom: Platform.isAndroid ? BorderSide.none : BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Ethereum", style: textBoldWithColor(15),),
                                  Container(
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Text("\$1,691.75", style: simpleTextWithCustomSizeAndColors(12),),
                                        const SizedBox(width: 5),
                                        Text("-0.46%", style: simpleTextWithCustomSizeAndColors(12, errorColor!),),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("0 ETH", style: textBoldWithColor(15),),
                                ],
                              )
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: Platform.isAndroid ? BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)):BorderSide.none
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: greyColor),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(Platform.isAndroid ? "assets/images/bnb.png": "assets/images/bnbIos.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(bottom: Platform.isAndroid ? BorderSide.none : BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("BNB", style: textBoldWithColor(15),),
                                  Container(
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Text("\$290.65", style: simpleTextWithCustomSizeAndColors(12),),
                                        const SizedBox(width: 5),
                                        Text("-0.46%", style: simpleTextWithCustomSizeAndColors(12, errorColor!),),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("0 BNB", style: textBoldWithColor(15),),
                                ],
                              )
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: Platform.isAndroid ? BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)):BorderSide.none
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: greyColor),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(Platform.isAndroid ? "assets/images/smartchain.png": "assets/images/smartchainIos.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(bottom: Platform.isAndroid ? BorderSide.none : BorderSide(width: 0.5, color: greyColor.withOpacity(0.2)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Smart Chain", style: textBoldWithColor(15),),
                                  Container(
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Text("\$290.65", style: simpleTextWithCustomSizeAndColors(12),),
                                        const SizedBox(width: 5),
                                        Text("-0.46%", style: simpleTextWithCustomSizeAndColors(12, errorColor!),),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("0 BNB", style: textBoldWithColor(15),),
                                ],
                              )
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

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
