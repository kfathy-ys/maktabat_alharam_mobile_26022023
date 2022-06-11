import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/cubit/my_order_ask_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/new_order/cubit/new_order_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/cubit/my_archive_visit_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/new_order/cubit_available_dates/available_dates_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/my_order/cubit/my_order_research_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/cubit/archive_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/cubit/order_suggest_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/new_order/cubit/new_order_cubit.dart';

import 'package:maktabat_alharam/screens/splash/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:queen/queen.dart';

import 'config/bloc_observer.dart';
import 'config/routes/path.dart';
import 'config/themes/theme_cubit/switch_cubit.dart';
import 'config/themes/theme_cubit/switch_state.dart';

import 'screens/all_services/pages/ask_Librarian/archive/cubit/ask_archive_cubit.dart';
import 'screens/all_services/pages/request_visit/my_orders/cubit/visit_order_cubit.dart';
import 'translations/locale key-value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Bloc.observer = MyBlocObserver();
  await App.boot();
  // Locators.put(NotificationServices());
  // Locators.put(BannerServices());
  runApp(QueenBuilder(
      enableDevtools: false,
      builder: (context) {
        return DevicePreview(
          enabled: true,
          builder: (context) => const MaktabatAlharam(),
        );
      }));
  SystemChrome.setPreferredOrientations(

      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
       // systemNavigationBarColor: kButtonRedDark, // navigation bar color
        statusBarColor: kAppBarColor, // status bar color
      ));
}

class MaktabatAlharam extends StatelessWidget {
  const MaktabatAlharam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwitchCubit>(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider<AvailableDatesCubit>(
          create: (context) => AvailableDatesCubit(),
        ),

        BlocProvider<NewOrderCubit>(
          create: (context) => NewOrderCubit(),
        ),
        BlocProvider<NewOrderAskCubit>(
          create: (context) => NewOrderAskCubit(),
        ),
        BlocProvider<ArchiveCubit>(
          create: (context) => ArchiveCubit(),
        ),
        BlocProvider<AskArchiveCubit>(
          create: (context) => AskArchiveCubit(),
        ),
        BlocProvider<MyOrderAskCubit>(
          create: (context) =>
              MyOrderAskCubit(BlocProvider.of<AskArchiveCubit>(context)),
        ),

        BlocProvider<OrderSuggestCubit>(
          create: (context) =>
              OrderSuggestCubit(BlocProvider.of<ArchiveCubit>(context)),
        ),


         /// TODO ::
        BlocProvider<MyArchiveVisitCubit>(
          create: (context) => MyArchiveVisitCubit(),
        ),
        BlocProvider<VisitOrderCubit>(
          create: (context) =>
              VisitOrderCubit(BlocProvider.of<MyArchiveVisitCubit>(context)),

        ),




        BlocProvider<MyOrderResearchCubit>(
          create: (context) => MyOrderResearchCubit(),
        ),

      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return GetMaterialApp(
            getPages: AppPages.routes,
            translations: LocaleString(),
            locale: const Locale('ar', 'EG'),

            // locale: const Locale('en', 'US'),
            popGesture: true,

            defaultTransition: g.Transition.zoom,
            debugShowCheckedModeBanner: false,
            theme: state.theme,

            title: 'Flutter Theme Cubit',
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
