import 'package:flutter/material.dart';
import 'package:islamy/screens/hadesScreen.dart';
import 'package:islamy/screens/moshafScreen.dart';
import 'package:islamy/screens/radioScreen.dart';
import 'package:islamy/screens/sebhaScreen.dart';
import 'package:flutter_gen/gen_L10n/app_localizations.dart';

class Home extends StatefulWidget {
      static String HomeRoute='HomeRoute';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIDX=0;

  var screens=[
     RadioScreen(),
    SebhaScreen(),
    AhadeesScreen(),
    MoshafScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var local=AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(local.app_title,style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentIDX,
        onTap: (idx){
          setState(() {
            currentIDX=idx;
          });
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor:Color.fromRGBO(182, 146, 95, 1.0),
        unselectedItemColor: Colors.white,
        selectedItemColor:Colors.black,
        items: [
          BottomNavigationBarItem(label: local.radio,icon: Image.asset('assets/images/radio_blue.png', height: 30,),),
          BottomNavigationBarItem(label: local.tasbeh,icon: Image.asset('assets/images/sebha_blue.png',height: 30,)),
          BottomNavigationBarItem(label: local.hadeth,icon: Image.asset('assets/images/radio_blue.png',height: 30,)),
          BottomNavigationBarItem(label: local.quran,icon: Image.asset('assets/images/moshaf_blue.png',height: 30,)),
        ],
      ),
      body:Stack(
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Image.asset('assets/images/bg3.png',fit: BoxFit.fill,),
          ),
          screens[currentIDX],
        ],
      ),
    );
  }
}
