import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/cubit/all_my_orders_cubit.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';
import 'package:maktabat_alharam/screens/widgets/CustomSearch.dart';

import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../../../../all_services/pages/request_visit/my_orders/page/custom_container.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import 'archive/view.dart';
import 'follow_reserved_retreated/view.dart';
import 'page/drop_down_order_name.dart';
import 'page/drop_down_state_name.dart';

// ignore: must_be_immutable
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // physics: const BouncingScrollPhysics(),
          // shrinkWrap: true,
          children: [
            HeadTopics(
              title: "myOrders".tr,
            ),
            const DropDownListOrderName(),
            const DropDownListStatesOrders(),
            CustomSearch(
              hint: "searchWithWord".tr,
            ),

            BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<AllMyOrdersCubit>(context);
                if (state is AllMyOrdersLoading) {
                  return const LoadingFadingCircle();
                }
                if (state is AllMyOrdersSuccess) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        cubit.getAllMyOrders();
                        return Future<void>.delayed(const Duration(seconds: 3));
                      },
                      backgroundColor: kAccentColor,
                      color: Colors.white,
                      child: state.ordersModel.data!.isEmpty
                          ? Center(
                              child:
                                  customBoldText(title: "لا توجد طلبات الاّن"))
                          : ListView.builder(
                              itemCount: state.ordersModel.data!.length,
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
                                          subTitle: state.ordersModel
                                                  .data![index].requestNameAr ??
                                              "erroe",
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      // CardData(
                                      //     title: "nameResponsible".tr,
                                      //     subTitle: state.ordersModel
                                      //         .data![index].responsibleName,
                                      //     color1: kSmallIconColor,
                                      //     color2: kBlackText),
                                      CardData(
                                          title: "requestDate".tr,
                                          subTitle:

                                          DateConverter
                                              .dateConverterMonth(state
                                              .ordersModel
                                              .data![index]
                                              .date
                                              .toString()),
                                          color1: kSmallIconColor,
                                          color2: kSkyButton),
                                      CardData(
                                          title: "requestState".tr,
                                          subTitle: state.ordersModel
                                                  .data![index].statusAr ??
                                              "erroe",
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
                                          // Get.to(() {
                                          //   return FollowResearchScreen(
                                          //     myOrdersToResearch: state
                                          //         .ordersModel
                                          //         .data![index],
                                          //   );
                                          // });
                                        },
                                        image: "assets/image/fulleyes.png",
                                      ),
                                      // ((state.ordersModel.data![index]
                                      //     .requestStatusId) ==
                                      //     5)
                                      //     ? const SizedBox()
                                      //     :
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "updateRequest".tr,
                                        onPressed: () {
                                          //   Get.to(() {
                                          //   return const UpdateReserveArticleRetreated();
                                          // });
                                        },
                                        image: "assets/image/update.png",
                                      ),
                                      CustomCardButton(
                                        color: kAccentColor,
                                        title: "addToArchive".tr,
                                        onPressed: () {
                                          // cubit.addToArchiveResearch(state
                                          //     .ordersModel
                                          //     .data![index]);
                                        },

                                        image: "assets/image/archieve.png",
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
                if (state is AllMyOrdersError) {
                  return Text(state.msg);
                }

                return const SizedBox();
              },
            )
            // Center(
            //     child: SmallButtonSizer(
            //   onPressed: () {},
            //   title: "addOne".tr,
            //   color: kPrimaryColor,
            //   image: "assets/image/newrequest.png",
            // ))
          ],
        ),
      ),
    );
  }
}
