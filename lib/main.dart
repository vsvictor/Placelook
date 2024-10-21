import 'dart:io';

import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/api/user_repository_mongo.dart';
import 'package:Placelook/api/walt_repository_mock_impl.dart';
import 'package:Placelook/domain/usecase/add_user_usecase.dart';
import 'package:Placelook/domain/usecase/get_all_walks_usecase.dart';
import 'package:Placelook/domain/usecase/get_profile_usecase.dart';
import 'package:Placelook/domain/usecase/get_profiles_usecase.dart';
import 'package:Placelook/domain/usecase/load_profile_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/contact_email.dart';
import 'package:Placelook/model/contact_phone.dart';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';
import 'package:Placelook/model/profile.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/model/walk.dart';
import 'package:Placelook/routes/main_routes.dart';
import 'package:Placelook/themes/dark_theme.dart';
import 'package:Placelook/themes/light_theme.dart';
import 'package:Placelook/viewmodel/mywalks_view_model.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/viewmodel/walk_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:Placelook/api/auth_repository_mock_impl.dart';
import 'package:Placelook/api/local_repository_impl.dart';
import 'package:Placelook/api/repository.dart';
import 'package:Placelook/domain/usecase/save_profile_usecase.dart';

void setup() {
  GetIt.instance.registerLazySingleton(() => Repository(
      RemoteRepository(AuthRepositoryMockImpl(), WalkRepositoryMockImpl(),
          UserRepositoryMongo()),
      LocalRepositoryImpl()));
  GetIt.instance.registerLazySingleton(() => LoginUseCase());
  GetIt.instance.registerLazySingleton(() => GetProfilesUseCase());
  GetIt.instance.registerLazySingleton(() => LoadProfileUseCase());
  GetIt.instance.registerLazySingleton(() => SaveProfileUsecase());
  GetIt.instance.registerLazySingleton(() => GetAllWalksUseCase());
  GetIt.instance.registerLazySingleton(() => AddUserUsecase());
  GetIt.instance.registerLazySingleton(() => GetProfileUsecase());
}

Future<void> initHive() async {
  Directory appCacheDir = await getApplicationCacheDirectory();
  var path = appCacheDir.path + "/placelook";
  print("Database path:${path}");
  Hive.registerAdapter(WalkAdapter());
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(EmailContactImplAdapter());
  Hive.registerAdapter(PhoneContactImplAdapter());
  Hive.registerAdapter(RolePresentAdapter());
  Hive.registerAdapter(RoleAdapter());
  Hive.registerAdapter(LanguagesPresentAdapter());
  Hive.registerAdapter(LanguagesAdapter());
  Hive.registerAdapter(TypeWalkPresentAdapter());
  Hive.registerAdapter(TypeWalkAdapter());
  Hive.init(path);
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  await initHive();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => WalkViewModel()),
        ChangeNotifierProvider(create: (_) => MyWalksViewModel())
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: plLightTheme,
        darkTheme: plDarkTheme,
        routerConfig: router,
      ),
    );
  }
}
