import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart'as g;

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/cubit/archive_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/cubit/order_suggest_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/new_order/cubit/new_order_cubit.dart';

import 'package:maktabat_alharam/screens/splash/view.dart';
import 'package:queen/queen.dart';

import 'config/bloc_observer.dart';
import 'config/routes/path.dart';
import 'config/themes/theme_cubit/switch_cubit.dart';
import 'config/themes/theme_cubit/switch_state.dart';

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

          builder: (context) => const MaktabatAlharam(),);

      }));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
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

        BlocProvider<NewOrderCubit>(
          create: (context) => NewOrderCubit(),
        ),
        BlocProvider<ArchiveCubit>(
          create: (context) => ArchiveCubit(),
        ),   BlocProvider<OrderSuggestCubit>(
          create: (context) => OrderSuggestCubit(BlocProvider.of<ArchiveCubit>(context)),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return GetMaterialApp(
            getPages: AppPages.routes,
            translations: LocaleString(),
           locale:   const Locale('ar', 'EG'),

           // locale: const Locale('en', 'US'),
            popGesture: true,

            defaultTransition: g.Transition.zoom,
            debugShowCheckedModeBanner: false,
            theme: state.theme,

            title: 'Flutter Theme Cubit',
            home:  const SplashScreen(),
          );
        },
      ),
    );
  }
}
