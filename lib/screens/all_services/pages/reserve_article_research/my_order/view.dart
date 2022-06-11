import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/my_order/cubit/my_order_research_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/description.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/update/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/follow_reserved_retreated/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../widgets/loading.dart';
import '../../request_visit/my_orders/page/custom_container.dart';

class MyOrderReserveArticleResearch extends StatelessWidget {
  const MyOrderReserveArticleResearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                title: "ReserveArticleOrResearchRetreat".tr,
              ),
              const Description(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallButtonSizer(
                    onPressed: () {
                      Get.to(() => const ReserveResearchRetreatScreen());
                    },
                    title: "addOne".tr,
                    color: kSafeAreasColor,
                    image: "assets/image/newrequest.png",
                  ),
                  SmallButtonSizer(
                    onPressed: () {
                      Get.to(() => const ArchiveReserveArticleScreen());
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
              BlocConsumer<MyOrderResearchCubit, MyOrderResearchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = BlocProvider.of<MyOrderResearchCubit>(context);
                  if (state is MyOrderResearchLoading) {
                    return const LoadingFadingCircle();
                  }
                  if (state is MyOrderResearchSuccess) {
                    return Expanded(
                      child: RefreshIndicator(

                          onRefresh: () async {
                            cubit.getOrderResearch();
                            return Future<void>.delayed(const Duration(seconds: 3));
                          },
                          backgroundColor: kAccentColor,
                          color: Colors.white,

                          child:state.orderResearchModel.data!.isEmpty ?
                          Center(child: customBoldText(title: "لا توجد طلبات الاّن")):
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.orderResearchModel.data!.length,
                        itemBuilder: (context, int index) {
                          return CustomContainer(
                            height: height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardData(
                                    title: "nameRequest".tr,
                                    subTitle: ((state.orderResearchModel
                                                .data![index].libraryId) ==
                                            1)
                                        ? "ReserveArticleOrResearchRetreat".tr
                                        : ((state.orderResearchModel
                                                    .data![index].libraryId) ==
                                                2)
                                            ? "scientificMaterial".tr
                                            : ((state
                                                        .orderResearchModel
                                                        .data![index]
                                                        .libraryId) ==
                                                    3)
                                                ? "mix".tr
                                                : "--",
                                    color1: kSmallIconColor,
                                    color2: kBlackText),
                                CardData(
                                    title: "nameResponsible".tr,
                                    subTitle: state.orderResearchModel
                                        .data![index].responsibleName,
                                    color1: kSmallIconColor,
                                    color2: kBlackText),
                                CardData(
                                    title: "requestDate".tr,
                                    subTitle: DateConverter.dateConverterMonth(
                                        state.orderResearchModel.data![index]
                                            .createdDate
                                            .toString()),
                                    color1: kSmallIconColor,
                                    color2: kSkyButton),
                                CardData(
                                    title: "requestState".tr,
                                    subTitle: ((state
                                                .orderResearchModel
                                                .data![index]
                                                .requestStatusId) ==
                                            4)
                                        ? "pending".tr
                                        : ((state
                                                    .orderResearchModel
                                                    .data![index]
                                                    .requestStatusId) ==
                                                5)
                                            ? "unRespond".tr
                                            : ((state
                                                        .orderResearchModel
                                                        .data![index]
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
                                    Get.to(() => FollowReservedRetreatScreen());
                                  },
                                  image: "assets/image/fulleyes.png",
                                ),
                                ((state
                                    .orderResearchModel
                                    .data![index]
                                    .requestStatusId) ==
                                    5) ?  const SizedBox():
                                CustomCardButton(
                                  color: kAccentColor,
                                  title: "updateRequest".tr,
                                  onPressed: () => Get.to(() =>
                                      const UpdateReserveArticleRetreated()),
                                  image: "assets/image/update.png",
                                ),
                                CustomCardButton(
                                  color: kAccentColor,
                                  title: "addToArchive".tr,
                                  onPressed: () => Get.to(() =>
                                      const ArchiveReserveArticleScreen()),

                                  image: "assets/image/archieve.png",
                                  //  icon:Icons.cancel_outlined
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),);
                  }
                  if (state is MyOrderResearchError) {
                    return Text(state.msg);
                  }
                  if (state is MyOrderResearchEmpty) {
                    return customBoldText(title: "Empty");
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
