import 'package:Placelook/viewmodel/walk_view_model.dart';
import 'package:Placelook/widgets/contacts_widget.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes/main_routes.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var walk = context.watch<WalkViewModel>().walk;
    var fullName = walk!.who!.firstName! + " " + walk!.who!.lastName!;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.02,
                right: size.width * 0.04),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopPageWidget(walk.name),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.only(
                                        top: 8,
                                        left: 64,
                                        right: 64,
                                        bottom: 8))),
                        child: Text(AppLocalizations.of(context)!.sign_up,
                            style: Theme.of(context).textTheme.displayMedium),
                        onPressed: () => {_onSignUp()},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.count,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          " " + walk.count.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.about_walk,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            walk.about,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.city,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "  " + walk.city,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.language,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "  " + walk.language.title,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.time,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "  " +
                                    DateFormat('dd.MM.yyyy, kk:mm')
                                        .format(walk.time ?? DateTime.now()),
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 3,
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.duration,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  "  " +
                                      (walk.duration ?? 120).toString() +
                                      " " +
                                      AppLocalizations.of(context)!.minuts,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.places,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: walk.places?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              color: Color(0x64FFFFFF),
                              child: InkWell(
                                onTap: () {
                                  context.read<WalkViewModel>().start = index;
                                  _onViewPhoto();
                                },
                                child: Image.network(walk.places![index]),
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppLocalizations.of(context)!.about_guid,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.name,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "  " + fullName,
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.rate,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "  " +
                                    walk.who!.rate.toString() +
                                    " " +
                                    AppLocalizations.of(context)!.of_ +
                                    " 10",
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.native_language,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "  " + walk.who!.language.title,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Contacts:",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        ContactsWidget(),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSignUp() async {}
  void _onViewPhoto() async {
    context.pushNamed(PLRoutes.PHOTOS.name);
  }
}
