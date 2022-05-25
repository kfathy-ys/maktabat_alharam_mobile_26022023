import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/cubit/follow_visit_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/page/sending.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../widgets/loading.dart';
import '../my_orders/models/model.dart';
import '../my_orders/page/custom_container.dart';
import 'cubit_replies/replies_cubit.dart';
import 'models/model.dart';
import 'models/replies_model.dart';
import 'page/views/request_events.dart';

// ignore: must_be_immutable
class FollowRequestVisitScreen extends StatelessWidget {
  MyOrderToVisit? myFollowOrder;

  final formKey = GlobalKey<FormState>();
  final _addCommentController = TextEditingController();

  FollowRequestVisitScreen({Key? key, this.myFollowOrder }) : super(key: key);

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
             // physics: const BouncingScrollPhysics(),
             // shrinkWrap: true,
              children: [
                HeadTopics(
                  title: "orderFollowUp".tr,
                ),
                buildSizedBox(height),
                CustomContainer(
                  height: height * 0.12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardData(
                          title: "serviceName".tr,
                          subTitle: "RequestVisit".tr,
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
                          title: "requiredInstructions".tr,
                          subTitle: " كارنيه الإستشارة",
                          color1: kSmallIconColor,
                          color2: kAccentColor),
                    ],
                  ),
                ),
                BlocProvider(
                  create: (context) =>
                      FollowVisitCubit(myFollowOrder: myFollowOrder!),
                  child: BlocConsumer<FollowVisitCubit, FollowVisitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FollowVisitLoading) {
                        return const Center(
                          child: LoadingFadingCircle(),
                        );
                      }
                      if (state is FollowVisitSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadTopics(
                              title: "requestData".tr,
                            ),
                            buildSizedBox(height),
                            CustomContainer(
                              height: height * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardData(
                                      title: "entityName".tr,
                                      subTitle: ((state.followOrderVisitModel
                                                  .data!.authority) ==
                                              1)
                                          ? "مدرسة"
                                          : ((state.followOrderVisitModel.data!
                                                      .authority) ==
                                                  2)
                                              ? "مؤسسة"
                                              : ((state.followOrderVisitModel
                                                          .data!.authority) ==
                                                      3)
                                                  ? "جهة"
                                                  : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "nameResponsible".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.responsibleName
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "email".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.responsibleEmail
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "phoneNumber".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.responsibleMobile
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "visitsNumbers".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.numberOfVisitors
                                          .toString(),
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  CardData(
                                      title: "visitReason".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.visitReason
                                          .toString(),
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
                                      subTitle: state.followOrderVisitModel
                                          .data!.createdDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followOrderVisitModel
                                                  .data!.requestStatusId) ==
                                              4)
                                          ? "تم تاكيد الطلب"
                                          : ((state.followOrderVisitModel.data!
                                                      .requestStatusId) ==
                                                  5)
                                              ? "الطلب قيد المراجعه"
                                              : ((state
                                                          .followOrderVisitModel
                                                          .data!
                                                          .requestStatusId) ==
                                                      6)
                                                  ? " تم رفض الطلب"
                                                  : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  RequestEvents(
                                      title: "requestState".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.createdDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followOrderVisitModel
                                                  .data!.requestStatusId) ==
                                              4)
                                          ? "الطلب قيد المراجعه"
                                          : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                  RequestEvents(
                                      title: "requestState".tr,
                                      subTitle: state.followOrderVisitModel
                                          .data!.updatedDate!
                                          .substring(0, 10),
                                      subTitle2: ((state.followOrderVisitModel
                                                  .data!.requestStatusId) ==
                                              5)
                                          ? "تم الموافقه"
                                          : "---",
                                      color1: kSmallIconColor,
                                      color2: kBlackText),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      if (state is FollowVisitError) {
                        return Text(state.msg);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                HeadTopics(
                  title: "commentsRequest".tr,
                ),
                BlocProvider(
                  create: (context) => RepliesCubit(id: myFollowOrder!.id),
                  child: BlocConsumer<RepliesCubit, RepliesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is RepliesLoading) {
                        return const Center(
                          child: LoadingFadingCircle(),
                        );
                      }
                      if (state is RepliesSuccess) {
                        return RefreshIndicator(
                          onRefresh: ()async{
                          await  RepliesCubit(id:myFollowOrder!.id! ).getFollowRepliesVisit(visitRequestId: myFollowOrder!.id!);

                          },
                          color: Colors.redAccent,

                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.repliesMessagesModel.data!.length,
                              itemBuilder: (context, index) {
                                return  Message(
                                    name:  state.repliesMessagesModel.data![index].userName.toString() ,
                                    comment:  state.repliesMessagesModel.data![index].userMessage.toString().substring(0,10),
                                    data: state.repliesMessagesModel.data![index].createdDate.toString().substring(0,10));
                              }),
                        );
                      }
                      if (state is RepliesError) {
                        return Text(state.msg);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                CustomTextField(
                  controller: _addCommentController,
                  hint: "أضف تعليق",
                ),
                buildSizedBox(height),
                Center(
                    child: SmallButtonSizer(
                  onPressed: () {
                    //Get.to(() => const RequestVisitScreen());
                  },
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
      height: height * 0.03,
    );
  }
}
