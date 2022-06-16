import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/cubit/order_thesis_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/cubit/order_thesis_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/page/description.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/update/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../widgets/loading.dart';
import '../../request_visit/my_orders/page/custom_container.dart';
import '../follow_my_order/view.dart';

class MyOrdersScientificMessage extends StatelessWidget {
  const MyOrdersScientificMessage({Key? key}) : super(key: key);

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
                    title: "DepositScientificThesis".tr,
                  ),
                  DescriptionMessage(description: "titleMessage".tr),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButtonSizer(
                        onPressed: () {
                          Get.to(() => const PutScientificMessage());
                        },
                        title: "addOne".tr,
                        color: kSafeAreasColor,
                        image: "assets/image/newrequest.png",
                      ),
                      SmallButtonSizer(
                        onPressed: () {
                          Get.to(() => const ArchiveScientificMessageScreen());
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
                  BlocConsumer<OrderThesisCubit, OrderThesisState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final cubit = BlocProvider.of<OrderThesisCubit>(context);
                      if (state is OrderThesisLoading) {
                        return const LoadingFadingCircle();
                      }
                      if (state is OrderThesisSuccess) {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              cubit.getOrderThesis();
                              return Future<void>.delayed(
                                  const Duration(seconds: 3));
                            },
                            backgroundColor: kAccentColor,
                            color: Colors.white,
                            child: state.orderThesisModel.data!.isEmpty
                                ? Center(
                                    child: customBoldText(
                                        title: "لا توجد طلبات الاّن"))
                                : ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        state.orderThesisModel.data!.length,
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
                                                subTitle:
                                                    "RequestDepositScientificThesis"
                                                        .tr,
                                                color1: kSmallIconColor,
                                                color2: kBlackText),
                                            CardData(
                                                title: "nameResponsible".tr,
                                                subTitle: state.orderThesisModel
                                                    .data![index].applicantName,
                                                color1: kSmallIconColor,
                                                color2: kBlackText),
                                            CardData(
                                                title: "requestDate".tr,
                                                subTitle: DateConverter
                                                    .dateConverterMonth(state
                                                        .orderThesisModel
                                                        .data![index]
                                                        .createdDate
                                                        .toString()),
                                                color1: kSmallIconColor,
                                                color2: kSkyButton),
                                            CardData(
                                                title: "requestState".tr,
                                                subTitle: ((state
                                                            .orderThesisModel
                                                            .data![index]
                                                            .requestStatusId) ==
                                                        4)
                                                    ? "pending".tr
                                                    : ((state
                                                                .orderThesisModel
                                                                .data![index]
                                                                .requestStatusId) ==
                                                            5)
                                                        ? "unRespond".tr
                                                        : ((state
                                                                    .orderThesisModel
                                                                    .data![
                                                                        index]
                                                                    .requestStatusId) ==
                                                                6)
                                                            ? "rejected".tr
                                                            : "--",
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
                                              onPressed: () {
                                                Prefs.getString("mark");
                                                Get.to(() =>
                                                     FollowScientificMessage(myOrderThesis:  state.orderThesisModel.data![index],));
                                              },
                                              //  icon:  Icons.visibility_outlined
                                              image:
                                                  "assets/image/fulleyes.png",
                                            ),
                                            ((state
                                                        .orderThesisModel
                                                        .data![index]
                                                        .requestStatusId) ==
                                                    5)
                                                ? const SizedBox()
                                                : CustomCardButton(
                                                    color: kAccentColor,
                                                    title: "updateRequest".tr,
                                                    onPressed: () => Get.to(() =>
                                                        const PutScientificMessage()),
                                                    //  icon:  Icons.visibility_outlined
                                                    image:
                                                        "assets/image/update.png",
                                                  ),
                                            CustomCardButton(
                                              color: kAccentColor,
                                              title: "addToArchive".tr,
                                              onPressed: () {
                                                cubit.addToArchiveThesis(state
                                                    .orderThesisModel
                                                    .data![index]);
                                              },
                                              image:
                                                  "assets/image/archieve.png",
                                              //  icon:Icons.cancel_outlined
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        );
                      }
                      if (state is OrderThesisError) {
                        return Text(state.msg);
                      }
                      if (state is OrderThesisEmpty) {
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
