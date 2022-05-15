import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/cubit/order_suggest_cubit.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import '../../ask_Librarian/my_order/page/views/cardContent.dart';
import 'cubit/archive_cubit.dart';
import 'page/descriptions.dart';
import 'page/title.dart';
import '../my_orders/view.dart';
import '../../../../drawer/view.dart';
import '../../../../widgets/CustomCardButton.dart';
import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';

class ArchiveSuggestBuyBookScreen extends StatelessWidget {
  const ArchiveSuggestBuyBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OrderSuggestCubit>(context);

    final cubitArchive = BlocProvider.of<ArchiveCubit>(context);

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
            child: Column(
              // physics: const BouncingScrollPhysics(),
              // shrinkWrap: true,
              children: [
                const HeadTitle(),
                DescriptionSuggest(description: "headBuyBook".tr),
                BlocConsumer<ArchiveCubit, ArchiveState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    if (state is ArchiveLoading) {
                      return const LoadingFadingCircle();
                    }
                    if (state is ArchiveSuccess) {

                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            cubitArchive.getOrderArchiveSuggest();
                            return Future<void>.delayed(const Duration(seconds: 3));
                          },
                          backgroundColor: kAccentColor,
                          color: Colors.white,
                          child: ListView.builder(
                          //  physics: const BouncingScrollPhysics(),
                          //  shrinkWrap: true,
                            itemCount: state.archiveSuggestModel.data!.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                margin:
                                    const EdgeInsetsDirectional.only(bottom: 16.0),
                                padding:
                                    const EdgeInsetsDirectional.only(bottom: 8.0),
                                height: height * 0.33,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: kCardBorder)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CardData(
                                        title: "nameResponsible".tr,
                                        subTitle: state.archiveSuggestModel
                                            .data![index].authorName
                                            .toString(),
                                        color1: kSmallIconColor,
                                        color2: kBlackText),
                                    CardData(
                                        title: "titleOfBook".tr,
                                        subTitle: state.archiveSuggestModel
                                            .data![index].suggestedBookTitle
                                            .toString(),
                                        color1: kSmallIconColor,
                                        color2: kSkyButton),
                                    CardData(
                                        title: "requestDate".tr,
                                        subTitle: state.archiveSuggestModel
                                            .data![index].createdDate
                                            .toString(),
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
                                      onPressed: ()=> cubit.removeFromArchive(state.archiveSuggestModel.data![index]),
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
                    if (state is ArchiveError) {
                      return Center(child: Text(state.msg));
                    }
                    if (state is ArchiveEmpty) {
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
    );
  }
}
