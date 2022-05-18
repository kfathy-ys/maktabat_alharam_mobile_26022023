
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/cubit/ask_archive_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/cubit/my_order_ask_cubit.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import 'page/views/title.dart';
import '../my_order/page/views/cardContent.dart';
import '../my_order/view.dart';
import '../../../../drawer/view.dart';
import '../../../../widgets/CustomCardButton.dart';
import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';


class ArchiveAskLibrarianScreen extends StatelessWidget {

  const ArchiveAskLibrarianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitAskArchive = BlocProvider.of<AskArchiveCubit>(context);
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
                  const HeadTitle(),

                  SizedBox(
                    height: height * 0.03,
                  ),
                  BlocConsumer<AskArchiveCubit ,AskArchiveState>(
                      listener: (context ,state){},
                      builder: (context ,state){
                        if(state is AskArchiveLoading){
                          return const LoadingFadingCircle();
                        }
                        if(state is AskArchiveSuccess ){
                          return Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                cubitAskArchive.getAskArchive();
                                return Future<void>.delayed(const Duration(seconds: 3));
                              },
                              backgroundColor: kAccentColor,
                              color: Colors.white,
                              child:state.askArchivedModel.data!.isEmpty ?
                              Center(child: customBoldText(title: "لا توجد طلبات مؤرشفة الاّن")): ListView.builder(
                                itemCount: state.askArchivedModel.data!.length,
                                itemBuilder: (context, int index) {
                                  return Container(
                                    margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                                    padding: const EdgeInsetsDirectional.only(bottom: 8.0),
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
                                            subTitle: state.askArchivedModel.data![index].visitorName.toString(),
                                            color1: kSmallIconColor,
                                            color2: kBlackText),
                                        CardData(
                                            title: "titleOfBook".tr,
                                            subTitle: state.askArchivedModel.data![index].visitorMessage,
                                            color1: kSmallIconColor,
                                            color2: kSkyButton),
                                        CardData(
                                            title: "requestDate".tr,
                                            subTitle: state.askArchivedModel.data![index].createdDate,
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


                                        onPressed: ()=> cubit.removeFromArchiveAsk(state.askArchivedModel.data![index]),

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
                        if(state is AskArchiveError){
                          return Center(child: Text(state.msg));

                        }
                        if(state is AskArchiveEmpty){
                          return Center(
                              child: customBoldText(title: "لا توجد طلبات الاّن"));

                        }
                        return const  SizedBox();
                      }, ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
