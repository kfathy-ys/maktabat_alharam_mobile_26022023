import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/data.dart';
import 'package:maktabat_alharam/screens/our_services/page/views/subhead_title.dart';
import 'package:maktabat_alharam/screens/our_services/page/views/title.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

class OurServicesScreen extends StatelessWidget {
  OurServicesScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OurServicesContent services = OurServicesContent();
  OurServicesGridCard ourServicesGridCard = OurServicesGridCard();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeadTitle(),
              const SubHeadTitle(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1.0,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: ourServicesGridCard.ourServicesGrid.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return CardGridContent(
                            fontTitle: 18,
                            fontSubTitle: 14,
                            model: ourServicesGridCard.ourServicesGrid[index]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
