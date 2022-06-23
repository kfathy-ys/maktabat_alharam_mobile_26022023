import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/archive/cubit/archived_thesis_cubit.dart';

import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/archive/page/views/title.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../../request_visit/my_orders/page/custom_container.dart';
import '../my_order/cubit/order_thesis_cubit.dart';

// ignore: must_be_immutable
class ArchiveScientificMessageScreen extends StatelessWidget {
  const ArchiveScientificMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadTitle(),
                BlocConsumer<ArchivedThesisCubit, ArchivedThesisState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = BlocProvider.of<ArchivedThesisCubit>(context);
                    final cubitOrder =
                        BlocProvider.of<OrderThesisCubit>(context);

                    if (state is ArchivedThesisLoading) {
                      return const LoadingFadingCircle();
                    }
                    if (state is ArchivedThesisSuccess) {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            cubit.getOrderArchivedThesis();
                            return Future<void>.delayed(
                                const Duration(seconds: 3));
                          },
                          backgroundColor: kAccentColor,
                          color: Colors.white,
                          child: state.archivedThesisModel.data!.isEmpty
                              ? Center(
                                  child: customBoldText(
                                      title: "لا توجد طلبات مؤرشفة الاّن"))
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      state.archivedThesisModel.data!.length,
                                  itemBuilder: (context, int index) {
                                    return CustomContainer(
                                      height: height * 0.33,
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
                                              subTitle: state
                                                  .archivedThesisModel
                                                  .data![index]
                                                  .applicantName,
                                              color1: kSmallIconColor,
                                              color2: kBlackText),
                                          CardData(
                                              title: "requestDate".tr,
                                              subTitle: DateConverter
                                                  .dateConverterMonth(state
                                                      .archivedThesisModel
                                                      .data![index]
                                                      .createdDate
                                                      .toString()),
                                              color1: kSmallIconColor,
                                              color2: kSkyButton),
                                          CardData(
                                              title: "requestState".tr,
                                              subTitle: ((state
                                                          .archivedThesisModel
                                                          .data![index]
                                                          .requestStatusId) ==
                                                      4)
                                                  ? "pending".tr
                                                  : ((state
                                                              .archivedThesisModel
                                                              .data![index]
                                                              .requestStatusId) ==
                                                          5)
                                                      ? "unRespond".tr
                                                      : ((state
                                                                  .archivedThesisModel
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
                                            title: "removeFromArchive".tr,
                                            onPressed: () {
                                              cubitOrder
                                                  .removeFromArchiveThesis(state
                                                      .archivedThesisModel
                                                      .data![index]);
                                            },
                                            //  icon:  Icons.visibility_outlined
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
                    if (state is ArchivedThesisError) {
                      return Text(state.msg);
                    }
                    if (state is ArchivedThesisEmpty) {
                      return customBoldText(title: "Empty");
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        );


  }
}
