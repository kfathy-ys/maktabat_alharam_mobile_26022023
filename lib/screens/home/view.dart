import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/home/pages/views/buttons_naviagtion_bar.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/services/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

import 'pages/views/my_requests/view.dart';


class HomeTabScreen extends StatefulWidget {
  final int index;

  const HomeTabScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  static  List<Widget> _widgetOptions = <Widget>[
    MyHomeScreen(),
    MyRequestsScreen(),
    ServicesScreen(),

  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  final ItemsBar _itemsBar = ItemsBar();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onWillPop(context);
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kSmallIconColor,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _onItemTapped(index);
            });
          },
          items: _itemsBar.itemsBar,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: kHomeColor),
          unselectedIconTheme:  const IconThemeData(color: kOffColor),
selectedItemColor: kHomeColor ,
          unselectedItemColor:kOffColor ,
          // selectedLabelStyle:  TextStyle(
          //     fontFamily: 'Contrail',
          //     fontSize: 10,
          //     fontWeight: FontWeight.bold,
          //     color: kHomeColor),
          // unselectedLabelStyle:  TextStyle(
          //     fontFamily: 'Contrail',
          //     fontSize: 10,
          //     fontWeight: FontWeight.bold,
          //     color: kLightText),
          iconSize: 25,
        ),
      ),
    );
  }
}
