
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/page/views/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/cubit/visit_order_cubit.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../my_orders/page/custom_container.dart';
import 'cubit/my_archive_visit_cubit.dart';


class ArchiveRequestToVisitScreen extends StatelessWidget {

  const ArchiveRequestToVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final cubitVisitArchive = BlocProvider.of<MyArchiveVisitCubit>(context);

    final cubit = BlocProvider.of<VisitOrderCubit>(context);
    return Scaffold(
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
                HeadTitle(description:   "titleMessage".tr,),
                BlocConsumer<MyArchiveVisitCubit, MyArchiveVisitState>(
                   listener: (context, state) {},
                   builder: (context, state) {

                     if(state is MyArchiveVisitLoading ){
                       return const LoadingFadingCircle();
                     }
                     if(state is MyArchiveVisitSuccess){
                       return Expanded(
                         child: RefreshIndicator(
                             onRefresh: () async {
                               cubitVisitArchive.getOrderArchiveVisit();
                               return Future<void>.delayed(const Duration(seconds: 3));
                             },
                             backgroundColor: kAccentColor,
                             color: Colors.white,
                             child: state.archiveVisitModel.data!.isEmpty ?
                             Center(child: customBoldText(title: "لا توجد طلبات مؤرشفة الاّن")):
                           ListView.builder(
                             physics: const BouncingScrollPhysics(),
                             itemCount: state.archiveVisitModel.data!.length,
                             itemBuilder: (context, int index) {
                               return CustomContainer(
                                 height: height * 0.33,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CardData(
                                         title: "nameRequest".tr,
                                         subTitle: state.archiveVisitModel.data![index].visitReason.toString(),
                                         color1: kSmallIconColor,
                                         color2: kBlackText),
                                     CardData(
                                         title: "nameResponsible".tr,
                                         subTitle: state.archiveVisitModel.data![index].responsibleName.toString(),
                                         color1: kSmallIconColor,
                                         color2: kBlackText),
                                     CardData(
                                         title: "requestDate".tr,
                                         subTitle: DateConverter.dateConverterMonth("${state.archiveVisitModel.data![index].createdDate}"),

                                       //  subTitle:state.archiveVisitModel.data![index].createdDate.toString(),
                                         color1: kSmallIconColor,
                                         color2: kSkyButton),
                                     CardData(
                                         title: "requestState".tr,
                                         subTitle:
                                         ((state.archiveVisitModel.data![index].requestStatusId)==4)? "pending".tr:
                                         ((state.archiveVisitModel.data![index].requestStatusId)==5)? "unRespond".tr:
                                         ((state.archiveVisitModel.data![index].requestStatusId)==6)? "rejected".tr:"--",
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

                                         onPressed: ()=> cubit.removeFromArchiveVisit(state.archiveVisitModel.data![index]),



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
                     if(state is MyArchiveVisitError){
                       return customBoldText(title: state.msg);
                     }
                     if(state is MyArchiveVisitEmpty){
                       return customBoldText(title: "Empty");
                     }
                     return const SizedBox();
  },
),
              /*  Center(
                    child: SmallButtonSizer(
                  onPressed: () {
                    Get.to(() => MyOrderReserveArticleResearch());
                  },
                  title: "addOne".tr,
                  color: kPrimaryColor,
                  image: "assets/image/newrequest.png",
                ))*/
              ],
            ),
          ),
        ),
      );

  }
}
