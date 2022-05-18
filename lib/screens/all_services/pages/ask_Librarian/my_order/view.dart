import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/cubit/my_order_ask_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/description_title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/update/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

class MyOrderAskLibrarian extends StatelessWidget {
  MyOrderAskLibrarian({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MyOrderAskCubit>(context);
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
                    title: "askStaff".tr,
                  ),
                  DescriptionTitle(
                    description: "head".tr,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButtonSizer(
                        onPressed: () {
                          Get.to(() => AskLibrarian());
                        },
                        title: "addOne".tr,
                        color: kSafeAreasColor,
                        image: "assets/image/newrequest.png",
                      ),
                      SmallButtonSizer(
                        onPressed: () {
                          Get.to(() => const ArchiveAskLibrarianScreen());
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
                  BlocConsumer<MyOrderAskCubit, MyOrderAskState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is MyOrderAskLoading) {
                        return const LoadingFadingCircle();
                      }
                      if (state is MyOrderAskSuccess) {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              cubit.getOrderAsk();
                              return Future<void>.delayed(
                                  const Duration(seconds: 3));
                            },
                            backgroundColor: kAccentColor,
                            color: Colors.white,
                            child: state.askOrderModel.data!.isEmpty ?
                            Center(child: customBoldText(title: "لا توجد طلبات الاّن")): ListView.builder(
                             physics: const BouncingScrollPhysics(),
                          //   shrinkWrap: true,
                              itemCount: state.askOrderModel.data!.length,
                              itemBuilder: (context, int index) {
                                return Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      bottom: 16.0),
                                  padding: const EdgeInsetsDirectional.only(
                                      bottom: 8.0),
                                  height: height * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: kCardBorder)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CardData(
                                          title: "requestContent".tr,

                                          subTitle: state.askOrderModel
                                              .data![index].visitorMessage.toString(),
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                          title: "requestDate".tr,
                                          subTitle: state.askOrderModel
                                              .data![index].createdDate.toString(),
                                          color1: kSmallIconColor,
                                          color2: kSkyButton),
                                      CardData(
                                          title: "الرد علي الطلب".tr,
                                          subTitle: state.askOrderModel
                                              .data![index].response.toString(),
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
                                        onPressed: () => Get.to(
                                            () => FollowAnsweringLibrarian(askMyOrder:state.askOrderModel.data![index] ,)),
                                        image: "assets/image/fulleyes.png",
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "updateRequest".tr,
                                        onPressed: () =>
                                            Get.to(() => UpdatesAskLibrarian(askMyOrder: state
                                              .askOrderModel.data![index],)),
                                        image: "assets/image/update.png",
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "addToArchive".tr,
                                        onPressed: () {
                                          cubit.addToArchiveAsk(state.askOrderModel.data![index]);


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
                      if (state is MyOrderAskError) {
                        return Center(child: Text(state.msg));
                      }
                      if (state is MyOrderAskEmpty) {
                        return Center(
                            child: customBoldText(title: "لا توجد طلبات الاّن"));
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
