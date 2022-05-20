
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/page/custom_container.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/page/headTile.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/update_order/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../widgets/loading.dart';
import '../view.dart';
import 'cubit/visit_order_cubit.dart';


class MyOrderRequestVisitScreen extends StatelessWidget {

  const MyOrderRequestVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<VisitOrderCubit>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  HeadTopics(
                    title: "RequestVisit".tr,
                  ),
                  DescriptionVisit(
                    description: "titleHead".tr,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButtonSizer(
                        onPressed: () {
                          Get.to(() => SmallButtonSizer(

                            onPressed: () {
                              Get.to(() => const RequestVisitScreen());
                            },
                            title: "addOne".tr,
                            color: kSafeAreasColor,
                            image: "assets/image/newrequest.png",
                          ));
                        },
                        title: "addOne".tr,
                        color: kSafeAreasColor,
                        image: "assets/image/newrequest.png",
                      ),
                      SmallButtonSizer(
                        onPressed: () {
                       Get.to(() => const ArchiveRequestToVisitScreen());
                        },
                        title: "archive".tr,
                        color: kAccentColor,
                        image: "assets/image/archieve.png",
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),
                  BlocConsumer<VisitOrderCubit, VisitOrderState>(
                    listener: (context, state) {},
                      builder: (context, state) {
                      if(state is VisitOrderLoading ){
                        return const LoadingFadingCircle();
                      }
                      if(state is VisitOrderSuccess){
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              cubit.getOrderVisit();
                              return Future<void>.delayed(const Duration(seconds: 3));
                            },
                            backgroundColor: kAccentColor,
                            color: Colors.white,
                            child: state.allOrderVisitModel.data!.isEmpty ?
                            Center(child: customBoldText(title: "لا توجد طلبات الاّن")):
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: state.allOrderVisitModel.data!.length,
                              itemBuilder: (context, int index) {
                                return CustomContainer(
                                  height: height * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CardData(
                                          title: "nameRequest".tr,
                                          subTitle: state.allOrderVisitModel.data![index].visitReason.toString(),
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                          title: "nameResponsible".tr,
                                          subTitle: state.allOrderVisitModel.data![index].responsibleName.toString(),
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                          title: "requestDate".tr,
                                          subTitle: state.allOrderVisitModel.data![index].createdDate.toString(),
                                          color1: kSmallIconColor,
                                          color2: kSkyButton),
                                      CardData(
                                          title: "response".tr,
                                          subTitle:
                                          ((state.allOrderVisitModel.data![index].requestStatusId)==4)? "pending".tr:
                                          ((state.allOrderVisitModel.data![index].requestStatusId)==5)? "unRespond".tr:
                                          ((state.allOrderVisitModel.data![index].requestStatusId)==6)? "rejected".tr:"--",
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                        title: "orderProcedure".tr,
                                        subTitle: "",
                                        color1: kBlackText,
                                        //  color2: kBlackText
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "followRequest".tr,
                                        onPressed: () =>
                                            Get.to(() => FollowRequestVisitScreen()),
                                        image: "assets/image/fulleyes.png",
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "updateRequest".tr,
                                        onPressed: () =>
                                            Get.to(() => const UpdateOrderOfVisitRequest()),
                                        image: "assets/image/update.png",
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "addToArchive".tr,
                                        onPressed: () =>
                                            Get.to(() => const ArchiveRequestToVisitScreen()),
                                        image: "assets/image/archieve.png",
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      if(state is VisitOrderError){
                        return Text(state.msg);
                      }
                      if(state is VisitOrderEmpty){
                        return customBoldText(title: "Empty");
                      }
                      return const SizedBox();

  },
),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
