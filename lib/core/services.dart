import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_managing_and_its_ui/persentation/controllers/theme/theme_controller_cubit.dart';

import '../data/data_source/local_data_soucre.dart';
import '../data/repository/app_theme_repository_impl.dart';
import '../domain/repository/app_theme_base_repo.dart';

final sld = GetIt.instance;

class Injector {
  static Future init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sld.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    sld.registerLazySingleton<BaseLocalDataSource>(
        () => LocalDataSource(sld()));
    sld.registerLazySingleton<BaseAppThemeRepository>(
        () => AppThemeRepository(sld<BaseLocalDataSource>()));
    sld.registerLazySingleton<ThemeControllerCubit>(
        () => ThemeControllerCubit(sld<BaseAppThemeRepository>()));
  }
}
