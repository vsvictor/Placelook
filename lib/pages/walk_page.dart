import 'package:Placelook/main.dart';
import 'package:Placelook/pages/signin_page.dart';
import 'package:Placelook/viewmodel/walk_view_model.dart';
import 'package:Placelook/widgets/contacts_widget.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../routes/main_routes.dart';
import '../utils/text_style.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var walk = context.watch<WalkViewModel>().getWalk();
    var fullName = walk!.who!.firstName! + " " + walk!.who!.lastName!;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.02,
                right: size.width * 0.04),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopPageWidget(walk.name, style: PLBigTextStyle()),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xff32dcac)),
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.only(
                                        top: 8,
                                        left: 64,
                                        right: 64,
                                        bottom: 8))),
                        child: Text("Sign up!",
                            style: PLTitleTextStyle(color: Colors.white)),
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
                          "Number of participants: ",
                          style: PLTitleTextStyle(color: Colors.blue),
                        ),
                        Text(
                          walk.count.toString(),
                          style: PLTitleTextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "About walk:",
                      style: PLBigTextStyle(color: Colors.blue),
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
                            style: PLNormalTextStyle(),
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
                                "City: ",
                                style: PLNormalTextStyle(color: Colors.blue),
                              ),
                              Text(
                                walk.city,
                                style: PLNormalTextStyle(),
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
                                "Language: ",
                                style: PLNormalTextStyle(color: Colors.blue),
                              ),
                              Text(
                                walk.language.title,
                                style: PLNormalTextStyle(),
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
                                "Time: ",
                                style: PLNormalTextStyle(color: Colors.blue),
                              ),
                              Text(
                                DateFormat('dd.MM.yyyy, kk:mm')
                                    .format(walk.time ?? DateTime.now()),
                                style: PLNormalBoldTextStyle(),
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
                                  "Duration: ",
                                  style: PLNormalTextStyle(color: Colors.blue),
                                ),
                                Text(
                                  (walk.duration ?? 120).toString() + " min",
                                  style: PLNormalBoldTextStyle(),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Places", style: PLNormalTextStyle(color: Colors.blue),),
                    SizedBox(height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: walk.places?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              color: Color(0x64FFFFFF),
                              child: InkWell(
                                onTap: (){
                                context.read<WalkViewModel>().start = index;
                                  _onViewPhoto();
                                },
                                child: Image.network(walk.places![index]),
                              )
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "About guid:",
                      style: PLBigTextStyle(color: Colors.blue),
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
                                "Name: ",
                                style: PLNormalTextStyle(color: Colors.blue),
                              ),
                              Text(
                                fullName,
                                style: PLNormalBoldTextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                "Rate: ",
                                style: PLNormalTextStyle(color: Colors.blue),
                              ),
                              Text(
                                walk.who!.rate.toString()+" of 10",
                                style: PLNormalBoldTextStyle(),
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
                          "Native language:",
                          style: PLNormalTextStyle(color: Colors.blue),
                        ),
                        Text(
                          walk.who!.language.title,
                          style: PLNormalBoldTextStyle(),
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
                          style: PLNormalTextStyle(color: Colors.blue),
                        ),
                        ContactsWidget(),
                        SizedBox(height: 50,)
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
  void _onViewPhoto() async{
    context.pushNamed(PLRoutes.PHOTOS.name);
  }
}
