import 'package:Placelook/pages/auth_page.dart';
import 'package:Placelook/pages/error_page.dart';
import 'package:Placelook/pages/forgot_password_page.dart';
import 'package:Placelook/pages/home_page.dart';
import 'package:Placelook/pages/map_page.dart';
import 'package:Placelook/pages/profile_page.dart';
import 'package:Placelook/pages/signin_page.dart';
import 'package:Placelook/pages/walk_page.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/dialog_opacity.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum PLRoutes {
  ROOT('root', '/'),
  AUTH("auth", "auth"),
  SIGNIN("signin", "signin"),
  FORGOT("forgot", "forgot"),
  MAP('map', 'map'),
  PROFILE('profile', 'profile'),
  WALK("walk", "walk"),
  PHOTOS("photos", "photos");

  final String name;
  final String path;

  const PLRoutes(this.name, this.path);
}

final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: PLRoutes.ROOT.path,
        name: PLRoutes.ROOT.name,
        builder: (context, staye) => HomePage(),
        redirect: (context, state) {
          if (context.read<UserViewModel>().profile == null) return "/auth";
        },
        routes: <RouteBase>[
          GoRoute(
            path: PLRoutes.AUTH.path,
            name: PLRoutes.AUTH.name,
            builder: (context, staye) => AuthPage(),
            routes: <RouteBase>[
              GoRoute(
                path: "signin",
                name: "signin",
                builder: (context, staye) => SigninPage(),
              ),
              GoRoute(
                path: PLRoutes.FORGOT.path,
                name: PLRoutes.FORGOT.name,
                builder: (context, state) => ForgotPasswordPage(),
              ),
            ],
          ),
          GoRoute(
              path: PLRoutes.MAP.path,
              name: PLRoutes.MAP.name,
              builder: (context, staye) => MapPage(),
              routes: <RouteBase>[
                GoRoute(
                    path: PLRoutes.WALK.path,
                    name: PLRoutes.WALK.name,
                    builder: (contex, state) => WalkPage(),
                    routes: <RouteBase>[
                      GoRoute(
                          path: PLRoutes.PHOTOS.path,
                          name: PLRoutes.PHOTOS.name,
                          builder: (context, state) => DialogOpacity())
                    ]),
              ]),
          GoRoute(
            path: PLRoutes.PROFILE.path,
            name: PLRoutes.PROFILE.name,
            builder: (context, staye) => ProfilePage(),
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
    errorBuilder: (context, state) {
      var str = state.extra as String?;
      return ErrorPage(message: str);
    });
