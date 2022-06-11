import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/archive/page/views/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/archive/cubit/archived_order_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/archive/cubit/archived_order_cubit.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import '../../../../home/pages/views/my_orders/page/head_topices.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../../request_visit/my_orders/page/custom_container.dart';
import '../page/description.dart';

// ignore: must_be_immutable
class ArchiveReserveArticleScreen extends StatelessWidget {
  const ArchiveReserveArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final cubitResearchArchive = BlocProvider.of<ArchivedOrderCubit>(context);
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
                    title: "ReserveArticleOrResearchRetreat".tr,
                  ),
                  const Description(),
                  BlocConsumer<ArchivedOrderCubit, ArchivedOrderState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ArchivedOrderLoading) {
                        return const LoadingFadingCircle();
                      }
                      if (state is ArchivedOrderSuccess) {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              cubitResearchArchive.getOrderArchiveResearch();
                              return Future<void>.delayed(const Duration(seconds: 3));
                            },
                            backgroundColor: kAccentColor,
                            color: Colors.white,
                            child:    state.archivedResearchModel.data!.isEmpty ?
                          Center(child: customBoldText(title: "لا توجد طلبات مؤرشفة الاّن")):
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.archivedResearchModel.dataLength,
                              itemBuilder: (context, int index) {
                                return CustomContainer(
                                  height: height * 0.33,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CardData(
                                          title: "nameRequest".tr,
                                          subTitle: (state.archivedResearchModel.data![index].libraryId == 1 ) ? "researchRetreat".tr:
                                          (state.archivedResearchModel.data![index].libraryId == 2 ) ?"scientificMaterial".tr:
                                           (state.archivedResearchModel.data![index].libraryId == 3 ) ?"mix".tr:"--".tr,
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                          title: "nameResponsible".tr,
                                          subTitle: state.archivedResearchModel.data![index].responsibleName.toString(),
                                          color1: kSmallIconColor,
                                          color2: kBlackText),
                                      CardData(
                                          title: "requestDate".tr,
                                          subTitle: DateConverter.dateConverterMonth("${state.archivedResearchModel.data![index].createdDate}"),

                                          //  subTitle:state.archivedResearchModel.data![index].createdDate.toString(),
                                          color1: kSmallIconColor,
                                          color2: kSkyButton),
                                      CardData(
                                          title: "requestState".tr,
                                          subTitle:
                                          ((state.archivedResearchModel.data![index].requestStatusId)==4)? "pending".tr:
                                          ((state.archivedResearchModel.data![index].requestStatusId)==5)? "unRespond".tr:
                                          ((state.archivedResearchModel.data![index].requestStatusId)==6)? "rejected".tr:"--",
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
                                          //cubit.removeFromArchiveVisit(state.archivedResearchModel.data![index]);
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
                      if (state is ArchivedOrderError) {
                        return customBoldText(title: state.msg);
                      }
                      if (state is ArchivedOrderEmpty) {
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
