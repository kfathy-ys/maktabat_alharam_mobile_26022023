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

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../widgets/loading.dart';
import '../view.dart';
import 'cubit/visit_order_cubit.dart';

class MyOrderRequestVisitScreen extends StatelessWidget {
  MyOrderRequestVisitScreen({Key? key}) : super(key: key);
  final DateConverter dateConverter = DateConverter();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<VisitOrderCubit>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      appBar: customAppbar(
          icons: Icons.arrow_forward_outlined, isIcons: true, context: context),
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
                      Get.to(() => const RequestVisitScreen());
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
                  if (state is VisitOrderLoading) {
                    return const LoadingFadingCircle();
                  }
                  if (state is VisitOrderSuccess) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          cubit.getOrderVisit();
                          return Future<void>.delayed(
                              const Duration(seconds: 3));
                        },
                        backgroundColor: kAccentColor,
                        color: Colors.white,
                        child: state.allOrderVisitModel.data!.isEmpty
                            ? Center(
                                child: customBoldText(
                                    title: "لا توجد طلبات الاّن"))
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                // shrinkWrap: true,
                                itemCount:
                                    state.allOrderVisitModel.data!.length,
                                itemBuilder: (context, int index) {
                                  return CustomContainer(
                                    height: height * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardData(
                                            title: "nameRequest".tr,
                                            subTitle: state.allOrderVisitModel
                                                .data![index].visitReason
                                                .toString(),
                                            color1: kSmallIconColor,
                                            color2: kBlackText),
                                        CardData(
                                            title: "nameResponsible".tr,
                                            subTitle: state.allOrderVisitModel
                                                .data![index].responsibleName
                                                .toString(),
                                            color1: kSmallIconColor,
                                            color2: kBlackText),
                                        CardData(
                                            title: "requestDate".tr,
                                            subTitle: DateConverter
                                                .dateConverterMonth(
                                                    "${state.allOrderVisitModel.data![index].createdDate}"),
                                            color1: kSmallIconColor,
                                            color2: kSkyButton),
                                        CardData(
                                            title: "requestState".tr,
                                            subTitle: ((state
                                                        .allOrderVisitModel
                                                        .data![index]
                                                        .requestStatusId) ==
                                                    4)
                                                ? "pending".tr
                                                : ((state
                                                            .allOrderVisitModel
                                                            .data![index]
                                                            .requestStatusId) ==
                                                        5)
                                                    ? "unRespond".tr
                                                    : ((state
                                                                .allOrderVisitModel
                                                                .data![index]
                                                                .requestStatusId) ==
                                                            6)
                                                        ? "rejected".tr
                                                        : "--",
                                            color1: kSmallIconColor,
                                            color2: kBlackText),
                                        ((state
                                            .allOrderVisitModel
                                            .data![index]
                                            .requestStatusId) ==
                                            6)?  CardData(
                                            title: "refuseReason".tr,
                                            subTitle: (state
                                                .allOrderVisitModel
                                                .data![index]
                                                .reasonOfRejection) == null ? "":state
                                                .allOrderVisitModel
                                                .data![index]
                                                .reasonOfRejection ,

                                            color1: kSmallIconColor,
                                            color2: kBlackText):const SizedBox.shrink(),
                                        CardData(
                                          title: "orderProcedure".tr,
                                          subTitle: "",
                                          color1: kBlackText,
                                          //  color2: kBlackText
                                        ),
                                        CustomCardButton(
                                          color: kAccentColor,
                                          title: "followRequest".tr,
                                          onPressed: () => Get.to(
                                              () => FollowRequestVisitScreen(
                                                    myFollowOrder: state
                                                        .allOrderVisitModel
                                                        .data![index],
                                                  )),
                                          image: "assets/image/fulleyes.png",
                                        ),
                                        ((state.allOrderVisitModel.data![index]
                                                        .requestStatusId) ==
                                                    5 ||
                                                (state
                                                        .allOrderVisitModel
                                                        .data![index]
                                                        .requestStatusId) ==
                                                    6)
                                            ? const SizedBox.shrink()
                                            : CustomCardButton(
                                                color: kAccentColor,
                                                title: "updateRequest".tr,
                                                onPressed: () {
                                                  Get.to(() =>
                                                      UpdateOrderOfVisitRequest(
                                                        order: state
                                                            .allOrderVisitModel
                                                            .data![index],
                                                      ));
                                                },
                                                image:
                                                    "assets/image/update.png",
                                              ),
                                        CustomCardButton(
                                          color: kAccentColor,
                                          title: "addToArchive".tr,
                                          onPressed: () {
                                            cubit.addToArchiveVisit(state
                                                .allOrderVisitModel
                                                .data![index]);
                                          },
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
                  if (state is VisitOrderError) {
                    return Text(state.msg);
                  }
                  if (state is VisitOrderEmpty) {
                    return customBoldText(title: "Empty");
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
