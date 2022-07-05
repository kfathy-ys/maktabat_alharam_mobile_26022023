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
import 'package:maktabat_alharam/screens/widgets/small_texfiled.dart';

import '../../../../all_services/pages/request_visit/my_orders/page/custom_container.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import 'archive/view.dart';
import 'follow_reserved_retreated/view.dart';
import 'page/drop_down_order_name.dart';
import 'page/drop_down_state_name.dart';

// ignore: must_be_immutable
class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Object? arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final cubit = BlocProvider.of<AllMyOrdersCubit>(context);
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadTopics(
                title: "myOrders".tr,
              ),
              BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return DropDownListOrderName(onChanged: (value) {
                    cubit.onLibIDChanged(value);
                    BlocProvider.of<AllMyOrdersCubit>(context)
                        .getSearchResult(type: value);
                  });
                },
              ),
              BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return DropDownListStatesOrders(onChanged: (value) {
                    cubit.onStateIdChanged(value);
                    BlocProvider.of<AllMyOrdersCubit>(context)
                        .getSearchResult(status: value);
                  });
                },
              ),
              BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomSearch(
                    hint: "searchWithWord".tr,
                    onsave: (value) {
                      BlocProvider.of<AllMyOrdersCubit>(context)
                          .getSearchResult(searchText: value);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return CustomSmallTextField(
                          read: true,
                          hint: "from".tr,
                          dIcon: Icons.date_range,
                          controller: cubit.fromController,
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2030),
                            ).then((value) {
                              print("errrrrrrrrrrrrrrrrrrrrrr${value is DateTime}");
                              print("Arrrrrrrrrrrrrrrrrrrrrrrr${value }");
                              if (value == null) return;
                                cubit.getSearchResult(
                                          dateFrom: value.toString())   ;

                                cubit.fromController.text = DateConverter.dateConverterOnly(value.toString());
                            });
                          });
                    },
                  ),
                  BlocConsumer<AllMyOrdersCubit, AllMyOrdersState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return CustomSmallTextField(
                          read: true,
                          hint: "to".tr,
                          dIcon: Icons.date_range,
                          controller: cubit.toController,
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2030),
                            ).then((value) {
                              if (value == null) return;
                              cubit
                                  .getSearchResult(
                                  dateTo: value) ;
                              cubit.toController.text = DateConverter.dateConverterOnly(value.toString());

                            });
                          });
                    },
                  ),
                ],
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
                          return Future<void>.delayed(
                              const Duration(seconds: 3));
                        },
                        backgroundColor: kAccentColor,
                        color: Colors.white,
                        child: cubit.allMyOrders.isEmpty
                            ? Center(
                                child: customBoldText(
                                    title: "لا توجد طلبات الاّن"))
                            : ListView.builder(
                                itemCount: cubit.allMyOrders.length,
                                itemBuilder: (context, int index) {
                                  return CustomContainer(
                                    height: height * 0.45,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardData(
                                            title: "nameRequest".tr,
                                            subTitle: cubit.allMyOrders[index]
                                                    .requestNameAr ??
                                                "erroe",
                                            color1: kSmallIconColor,
                                            color2: kBlackText),
                                        CardData(
                                            title: "requestDate".tr,
                                            subTitle: DateConverter
                                                .dateConverterMonth(cubit
                                                    .allMyOrders[index].date
                                                    .toString()),
                                            color1: kSmallIconColor,
                                            color2: kSkyButton),
                                        CardData(
                                            title: "requestState".tr,
                                            subTitle: cubit.allMyOrders[index]
                                                    .statusAr ??
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
                                        ((cubit.allMyOrders[index]
                                                    .isEditable) ==
                                                true)
                                            ? const SizedBox.shrink()
                                            : CustomCardButton(
                                                color: kAccentColor,
                                                title: "updateRequest".tr,
                                                onPressed: () {
                                                  //   Get.to(() {
                                                  //   return const UpdateReserveArticleRetreated();
                                                  // });
                                                },
                                                image:
                                                    "assets/image/update.png",
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
            ],
          ),
        ),
      ),
    );
  }
}
