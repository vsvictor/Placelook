import 'package:Placelook/pages/auth_page.dart';
import 'package:Placelook/pages/error_page.dart';
import 'package:Placelook/pages/forgot_password_page.dart';
import 'package:Placelook/pages/home_page.dart';
import 'package:Placelook/pages/map_page.dart';
import 'package:Placelook/pages/profile_page.dart';
import 'package:Placelook/pages/signin_page.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    name: "root",
    builder: (context, staye) => HomePage(),
    redirect: (context, state){
      if(context.read<UserViewModel>().user == null) return "/auth";
    },
    routes: <RouteBase>[
      GoRoute(
          path: "auth",
          name: "auth",
        builder: (context, staye) => AuthPage(),
        routes: <RouteBase>[
          GoRoute(
            path: "signin",
            name: "signin",
            builder: (context, staye) => SigninPage(),
          ),
          GoRoute(
            path: "forgot",
            name: "forgot",
            builder: (context, staye) => ForgotPasswordPage(),
          ),
        ],
      ),
      GoRoute(
        path: "map",
        name: "map",
        builder: (context, staye) => MapPage(),
      ),
      GoRoute(
          path: "profile",
          name: "profile",
        builder: (context, staye) => ProfilePage(),
      ),
    ],
  ),
],
  debugLogDiagnostics: true,
  errorBuilder: (context, state){
    var str = state.extra as String?;
    return ErrorPage(message: str);
  }
);
