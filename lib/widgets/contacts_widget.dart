import 'package:Placelook/main.dart';
import 'package:Placelook/model/contact.dart';
import 'package:Placelook/utils/text_style.dart';
import 'package:Placelook/viewmodel/walk_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsWidget extends StatefulWidget {
  State<ContactsWidget> createState() => _ContactsWidgetState();
}

class _ContactsWidgetState extends State<ContactsWidget> {
  @override
  Widget build(BuildContext context) {
    final contacts = context.read<WalkViewModel>().walk?.who?.contacts;
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: 40,
      width: size.width,
      child: ListView.builder(
        itemCount: contacts?.length,
        itemBuilder: (context, index) {
          var contact = contacts?[index];
          var image = "";
          String title = "";
          var em;
          var ph;
          var res = contact?.map(
              email: (data) => {em = data.email},
              phone: (data) => {ph = data.phone});
          print(em);
          print(ph);
          if (ph == null && em != null) {
            image = "assets/email.png";
            title = em;
          } else if (ph != null && em == null) {
            image = "assets/phone.png";
            title = ph;
          }
          print("Title:" + title);
          return ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(image),
            ),
            title: Text(
              title,
              style: PLNormalTextStyle(),
            ),
          );
        },
      ),
    );
  }
}
