
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/follow_my_order/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/follow_my_order/page/card_file.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizerUploadFile.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../../request_visit/follow_request_visit/page/sending.dart';
import '../../request_visit/follow_request_visit/page/views/request_events.dart';
import '../../request_visit/my_orders/page/custom_container.dart';
import '../my_order/models/model.dart';
import 'cubit_replies/thesis_replies_cubit.dart';


// ignore: must_be_immutable
class FollowScientificMessage extends StatefulWidget {


  MyOrderThesis?  myOrderThesis;

  FollowScientificMessage({Key? key,this.myOrderThesis}) : super(key: key);

  @override
  State<FollowScientificMessage> createState() => _FollowScientificMessageState();
}

class _FollowScientificMessageState extends State<FollowScientificMessage> {
  @override
  void initState() {
    id = Prefs.getString("userId");

    super.initState();
  }

  String id = "";

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
                HeadTopics(
                  title: "orderFollowUp".tr,
                ),
                buildSizedBox(height),
               CustomContainer(
                  height: height * 0.08,
                  child: CardData(
                      title: "serviceName".tr,
                      subTitle: "خلوة بحثية",
                      color1: kSmallIconColor,
                      color2: kBlackText),
                ),
                HeadTopics(
                  title: "requestData".tr,
                ),
                buildSizedBox(height),
                SizedBox(height: height*0.02,),
                CardFile( width: width*0.3,height: height*0.1,title: "fullMessage".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "messagesAddress".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "topicIndex".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "arabicExtract".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "englishExtract".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "introduction".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "fullMessage".tr, onPressed1: (){}, ),
                CardFile( width: width*0.3,height: height*0.1,title: "contentPlus".tr, onPressed1: (){}, ),
                HeadTopics(
                  title: "orderEvents".tr,
                ),
                buildSizedBox(height),
                CustomContainer(
                  height: height * 0.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RequestEvents(
                          title: "requestState".tr,
                          subTitle: "Mar 22,2022",
                          subTitle2: "تم تاكيد الطلب ",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      RequestEvents(
                          title: "requestState".tr,
                          subTitle: "Mar 23,2022",
                          subTitle2: "الطلب قيد المراجعة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      RequestEvents(
                          title: "requestState".tr,
                          subTitle: "Mar 26,2022",
                          subTitle2: "تم الموافقة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                HeadTopics(
                  title: "commentsRequest".tr,
                ),
                buildSizedBox(height),
                BlocProvider(
                  create: (context) => ThesisRepliesCubit()
                    ..init(widget.myOrderThesis!.id!),
                  child:
                  BlocConsumer<ThesisRepliesCubit, ThesisRepliesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final cubit = ThesisRepliesCubit.of(context);

                      if (state is ThesisRepliesLoading) {
                        return const Center(
                          child: LoadingFadingCircle(),
                        );
                      }
                      if (state is ThesisRepliesSuccess) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              state.allRepliesThesisModel.data!.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.builder(
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state
                                      .allRepliesThesisModel.data!.length,
                                  itemBuilder: (context, index) {
                                    return Message(
                                        isMe: state.allRepliesThesisModel
                                            .data![index].createdBy
                                            .toString() ==
                                            id,
                                        name: state.allRepliesThesisModel
                                            .data![index].userName
                                            .toString(),
                                        comment: state.allRepliesThesisModel
                                            .data![index].userMessage
                                            .toString()
                                            .trim(),
                                        data: DateConverter.dateConverterMonth(
                                            "${state.allRepliesThesisModel.data![index].createdDate}"));
                                    // data: state.repliesMessagesModel.data![index].createdDate.toString().substring(0,10));
                                  }),
                              CustomTextField(
                                controller: cubit.addCommentController,
                                hint: "أضف تعليقك هنا ..!",
                              ),
                              buildSizedBox(height),
                              state is! ThesisRepliesLoading
                                  ? Center(
                                  child: SmallButtonSizer(
                                    onPressed: () {
                                      cubit.addToCommentThesis(MyRepliesThesis(
                                          userName: widget.myOrderThesis!
                                              .applicantName,
                                          createdDate: widget
                                              .myOrderThesis!
                                              .createdDate,
                                          updatedBy: widget
                                              .myOrderThesis!.updatedBy,
                                          userMessage: cubit
                                              .addCommentController.text
                                              .trim(),
                                          thesisDepositionRequestId:
                                          widget.myOrderThesis!.id));
                                    },
                                    title: "addComment".tr,
                                    color: kSafeAreasColor,
                                    image: "assets/image/newrequest.png",
                                  ))
                                  : const LoadingFadingCircle(),
                            ],
                          ),
                        );
                      }

                      if (state is ThesisRepliesError) {
                        return Text(state.msg);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
              //PutScientificMessage()
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
