import 'dart:convert';

import 'package:Placelook/model/walk.dart';
import 'package:Placelook/viewmodel/mywalks_view_model.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../viewmodel/walk_view_model.dart';

class MyWalksPage extends StatefulWidget {
  const MyWalksPage({super.key});
  @override
  State<MyWalksPage> createState() => _MyWalksPageState();
}

class _MyWalksPageState extends State<MyWalksPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var walkBox = context.read<MyWalksViewModel>().walkBox;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: walkBox.listenable(),
        builder: (context, value, child) {
          if (walkBox.length > 0) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  var walk = walkBox.getAt(index);
                  return ListTile(
                    minTileHeight: size.height * 0.09,
                    //leading: Image.asset("assets/avatar.png"),
                    title: Card(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.01,
                            right: size.width * 0.04,
                            bottom: size.height * 0.01),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    walk?.name ?? "None",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/avatar.png",
                                  width: 64,
                                  height: 64,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${AppLocalizations.of(context)!.guid}: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          walk!.who!.fullname ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )
                                      ]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)!.rate}: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        walk.who!.rate.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    ],
                                  ),
                                ]),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.time,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    "  " +
                                        DateFormat('dd.MM.yyyy, kk:mm').format(
                                            walk.time ?? DateTime.now()),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.count}: ",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    walk!.count.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              )
                            ])
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      context.read<WalkViewModel>().walk = walk;
                      context.pushNamed("walk");
                    },
                  );
                },
                //separatorBuilder: (context, index)=> Divider(),
                itemCount: walkBox.length);
          } else {
            return EmptyList();
          }
        },
      ),
    );
  }

  void onClick() {}
}

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Icon(Icons.inbox_outlined,
                  size: 80.0, color: Color(0xff0D3257))),
          Container(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              "Don't have any tasks",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
