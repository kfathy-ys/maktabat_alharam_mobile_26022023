import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../drawer/view.dart';
import '../widgets/appBar.dart';

class HomeTabScreen extends StatefulWidget {
  final int index;
  final String? userId;

  const HomeTabScreen({Key? key, this.index = 0, this.userId})
      : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    MyHomeScreen(),
     MyOrdersScreen(),
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

  // final ItemsBar _itemsBar = ItemsBar();
  final token = Prefs.getString('token');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: kHomeColor,
        drawer: token.isNotEmpty ? drawer(context: context) : null,
        appBar: token.isNotEmpty
            ? customAppbar(
                icons: Icons.arrow_forward_outlined,
                isIcons: true,
                context: context)
            : null,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: token.isNotEmpty
            ? BottomNavigationBar(
                backgroundColor: kSmallIconColor,
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _onItemTapped(index);
                  });
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/image/homeicon.png"),
                    ),
                    label: "home".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/image/myOrders.png"),
                    ),
                    label: "myOrders".tr,
                  ),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                        AssetImage("assets/image/user.png"),
                      ),
                      label: "myProfile".tr),
                ],
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: const IconThemeData(color: kHomeColor),
                unselectedIconTheme: const IconThemeData(color: kOffColor),
                selectedItemColor: kHomeColor,
                unselectedItemColor: kOffColor,
                selectedLabelStyle: const TextStyle(
                    fontFamily: 'DinMedium', fontSize: 16, color: kHomeColor),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Contrail',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kLightText),
                iconSize: 25,
              )
            : null,
      ),
    );
  }
}
