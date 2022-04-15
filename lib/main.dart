import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart'as g;

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/home/view.dart';
import 'package:maktabat_alharam/screens/splash/view.dart';
import 'package:queen/queen.dart';

import 'config/bloc_observer.dart';
import 'config/routes/path.dart';
import 'config/themes/theme_cubit/switch_cubit.dart';
import 'config/themes/theme_cubit/switch_state.dart';
import 'screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'screens/all_services/pages/ask_Librarian/view.dart';
import 'screens/all_services/pages/reserve_article_research/view.dart';
import 'screens/our_services/view.dart';
import 'translations/locale key-value.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await App.boot();
  // Locators.put(NotificationServices());
  // Locators.put(BannerServices());
  runApp(QueenBuilder(
      enableDevtools: false,
      builder: (context) {
        return DevicePreview(
          builder: (context) => const MaktabatAlharam(),);

      }));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
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
            home:  HomeTabScreen(),
          );
        },
      ),
    );
  }
}
