import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/buttons_naviagtion_bar.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';


class HomeTabScreen extends StatefulWidget {
  final int index;

  const HomeTabScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  static  final List<Widget> _widgetOptions = <Widget>[

     MyOrdersScreen(),
    MyHomeScreen(),
    const ProfileScreen(),

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
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const ImageIcon( AssetImage("assets/image/myOrders.png"),),
              label: "myOrders".tr,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon( AssetImage("assets/image/homeicon.png"),),
              label:"home".tr,
            ),
            BottomNavigationBarItem(
                icon: const ImageIcon( AssetImage("assets/image/user.png"),),
                label:  "myProfile".tr),
          ],
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: kHomeColor),
          unselectedIconTheme:  const IconThemeData(color: kOffColor),
selectedItemColor: kHomeColor ,
          unselectedItemColor:kOffColor ,


          selectedLabelStyle:  const TextStyle(
              fontFamily: 'DinMedium',
              fontSize: 16,

              color: kHomeColor),
          unselectedLabelStyle:  const TextStyle(
              fontFamily: 'Contrail',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kLightText),
          iconSize: 25,
        ),
      ),
    );
  }
}
