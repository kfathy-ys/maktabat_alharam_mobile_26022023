import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/notifications/page/card_notifications.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';

import '../all_services/pages/ask_Librarian/page/views/head_topices.dart';
import '../drawer/view.dart';
import '../widgets/appBar.dart';
import '../widgets/constants.dart';
import 'package:get/get.dart';

import '../widgets/loading.dart';
import 'cubit/notifications_cubit.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

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
          body: SingleChildScrollView(
            child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadTopics(
                      title: "notification".tr,
                    ),
                    buildSizedBox(height),
                    BlocProvider(
                      create: (context) => NotificationsCubit(),
                      child:
                          BlocConsumer<NotificationsCubit, NotificationsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          final cubit =
                              BlocProvider.of<NotificationsCubit>(context);

                          if (state is NotificationsLoading) {
                            return const Center(
                              child: LoadingFadingCircle(),
                            );
                          }
                          if (state is NotificationsSuccess) {
                            return Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  cubit.getNotifications();
                                  return Future<void>.delayed(
                                      const Duration(seconds: 3));
                                },
                                backgroundColor: kAccentColor,
                                color: Colors.white,
                                child: state.allNotifications.data!.isEmpty
                                    ? Center(
                                        child: customBoldText(
                                            title: "لا توجد إشعارات الاّن"))
                                    : ListView.builder(
                                        itemCount:
                                            state.allNotifications.dataLength,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, int index) {
                                          return CardNotifications(
                                            title: state.allNotifications
                                                .data![index].message!
                                                .toString(),
                                            date: DateConverter
                                                .dateConverterHours24Mode(state
                                                    .allNotifications
                                                    .data![index]
                                                    .created!
                                                    .toString()),
                                          );
                                        },
                                      ),
                              ),
                            );
                          }
                          if (state is NotificationsError) {
                            return Text(state.msg);
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height * 0.05,
    );
  }
}
