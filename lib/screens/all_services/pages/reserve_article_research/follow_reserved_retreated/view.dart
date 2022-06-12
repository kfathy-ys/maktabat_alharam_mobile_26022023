import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/page/custom_container.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/follow_reserved_retreated/cubit/follow_research_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../widgets/loading.dart';
import '../../request_visit/follow_request_visit/page/views/request_events.dart';
import '../my_order/models/model.dart';

// ignore: must_be_immutable
class FollowResearchScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final _addCommentController = TextEditingController();
  MyOrdersToResearch? myOrdersToResearch;

  FollowResearchScreen({Key? key, this.myOrdersToResearch})
      : super(key: key);

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
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            height: height,
            width: width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                BlocProvider(
                  create: (context) => FollowResearchCubit(
                      myOrdersToResearch: myOrdersToResearch!),
                  child: BlocConsumer<FollowResearchCubit, FollowResearchState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FollowResearchLoading) {
                        return const Center(
                          child: LoadingFadingCircle(),
                        );
                      }
                      if (state is FollowResearchSuccess) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadTopics(
                              title: "orderFollowUp".tr,
                            ),
                            buildSizedBox(height),
                            CustomContainer(

                              height: height * 0.08,
                              child: CardData(
                                  title: "serviceName".tr,
                                  subTitle: ((state.followResearchModel.data!
                                              .libraryId) ==
                                          1)
                                      ? "ReserveArticleOrResearchRetreat".tr
                                      : ((state.followResearchModel.data!
                                                  .libraryId) ==
                                              2)
                                          ? "scientificMaterial".tr
                                          : ((state.followResearchModel.data!
                                                      .libraryId) ==
                                                  3)
                                              ? "mix".tr
                                              : "--",
                                  color1: kSmallIconColor,
                                  color2: kBlackText),
                            ),
                            HeadTopics(
                              title: "requestData".tr,
                            ),
                            buildSizedBox(height),
                            CustomContainer(
                              height: height * 0.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardData(
                                      title: "serviceName".tr,
                                      subTitle: ((state.followResearchModel
                                                  .data!.libraryId) ==
                                              1)
                                          ? "ReserveArticleOrResearchRetreat".tr
                                          : ((state.followResearchModel.data!
                                                      .libraryId) ==
                                                  2)
                                              ? "scientificMaterial".tr
                                              : ((state.followResearchModel
                                                          .data!.libraryId) ==
                                                      3)
                                                  ? "mix".tr
                                                  : "--",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "libraryName".tr,
                                      subTitle: ((state.followResearchModel
                                                  .data!.libraryId) ==
                                              1)
                                          ? "ReserveArticleOrResearchRetreat".tr
                                          : ((state.followResearchModel.data!
                                                      .libraryId) ==
                                                  2)
                                              ? "scientificMaterial".tr
                                              : ((state.followResearchModel
                                                          .data!.libraryId) ==
                                                      3)
                                                  ? "mix".tr
                                                  : "--",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "phoneNumber".tr,
                                      subTitle: state.followResearchModel.data!
                                          .responsibleMobile
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "qualification".tr,
                                      subTitle: state
                                          .followResearchModel.data!.callNum
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "bookingDate".tr,
                                      subTitle:
                                          DateConverter.dateConverterMonth(state
                                              .followResearchModel
                                              .data!
                                              .createdDate
                                              .toString()),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "dateFrom".tr,
                                      subTitle:
                                          DateConverter.dateConverterMonth(state
                                              .followResearchModel
                                              .data!
                                              .dateFrom
                                              .toString()),
                                      color1: kSmallIconColor,
                                      color2: kSkyButton),
                                  CardData(
                                      title: "dateTo".tr,
                                      subTitle:
                                          DateConverter.dateConverterMonth(state
                                              .followResearchModel.data!.dateTo
                                              .toString()),
                                      color1: kSmallIconColor,
                                      color2: kSkyButton),
                                ],
                              ),
                            ),
                            HeadTopics(
                              title: "orderEvents".tr,
                            ),
                            buildSizedBox(height),
                            CustomContainer(
                              height: height * 0.2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RequestEvents(
                                      title: "requestState".tr,
                                      subTitle: state.followResearchModel
                                          .data!.createdDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followResearchModel
                                          .data!.requestStatusId) ==
                                          4)
                                          ? "تم تاكيد الطلب"
                                          : ((state.followResearchModel.data!
                                          .requestStatusId) ==
                                          5)
                                          ? "الطلب قيد المراجعه"
                                          : ((state
                                          .followResearchModel
                                          .data!
                                          .requestStatusId) ==
                                          6)
                                          ? " تم رفض الطلب"
                                          : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  RequestEvents(
                                      title: "requestState".tr,
                                      subTitle: state.followResearchModel
                                          .data!.createdDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followResearchModel
                                          .data!.requestStatusId) ==
                                          4)
                                          ? "الطلب قيد المراجعه"
                                          : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  RequestEvents(
                                      title: "requestState".tr,
                                      subTitle: state.followResearchModel
                                          .data!.updatedDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followResearchModel
                                          .data!.requestStatusId) ==
                                          5)
                                          ? "تم الموافقه"
                                          : "notResponse".tr,
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      if (state is FollowResearchError) {
                        return Text(state.msg);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                HeadTopics(
                  title: "commentsRequest".tr,
                ),
                CustomContainer(
                  height: height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CardData(
                          title: "Ahmed",
                          subTitle: "Mar 22,2022  7:54 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      CardData(
                          title: "هل يمكن إستخراج البطاقة المدرسية؟",
                          subTitle: "",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                CustomContainer(
                  height: height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CardData(
                          title: "EMP",
                          subTitle: "Mar 22,2022  8:04 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      CardData(
                          title: "لا , لا يمكن !",
                          subTitle: "",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: _addCommentController,
                  hint: "أضف تعليق",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                    child: SmallButtonSizer(
                  onPressed: () =>
                      Get.to(() => const ReserveResearchRetreatScreen()),
                  title: "add".tr,
                  color: kPrimaryColor,
                  image: "assets/image/newrequest.png",
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
                            height: height * 0.02,
                          );
  }



}
