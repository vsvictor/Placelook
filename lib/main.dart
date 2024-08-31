import 'package:Placelook/api/remote_repository.dart';
import 'package:Placelook/api/walt_repository_mock_impl.dart';
import 'package:Placelook/domain/usecase/get_all_walks_usecase.dart';
import 'package:Placelook/domain/usecase/get_user_usecase.dart';
import 'package:Placelook/domain/usecase/load_user_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:Placelook/routes/main_routes.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:Placelook/api/auth_repository_mock_impl.dart';
import 'package:Placelook/api/local_repository_impl.dart';
import 'package:Placelook/api/repository.dart';
import 'package:Placelook/domain/usecase/save_user_usecase.dart';

void setup() {
  GetIt.instance.registerLazySingleton(() => Repository(
      RemoteRepository(AuthRepositoryMockImpl(), WalkRepositoryMockImpl()),
      LocalRepositoryImpl()));
  GetIt.instance.registerLazySingleton(() => LoginUseCase());
  GetIt.instance.registerLazySingleton(() => GetUserUseCase());
  GetIt.instance.registerLazySingleton(() => LoadUserUseCase());
  GetIt.instance.registerLazySingleton(() => SaveUserUsecase());
  GetIt.instance.registerLazySingleton(() => GetAllWalksUseCase());
}

void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
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
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
