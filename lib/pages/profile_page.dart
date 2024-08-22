import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/widgets/profile_widget.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/avatar_widget.dart';
import 'package:Placelook/pages/auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _teFirstName = TextEditingController();
  TextEditingController _teLastName = TextEditingController();
  TextEditingController _teEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? u = ProfileWidget.of(context)?.profile.value;
    if (_teFirstName.text.trim().isEmpty)
      _teFirstName.text = (u != null) ? u.firstName : "";
    if (_teLastName.text.trim().isEmpty)
      _teLastName.text = (u != null) ? u.lastName : "";
    if (_teEmail.text.trim().isEmpty)
      _teEmail.text = (u != null) ? u.email.email : "";
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                TopPageWidget("Profile"),
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: AvatarWidger(
                      backgroundImage: Image.asset("assets/edit.png"),
                      radius: 128.0,
                      colorBask: Colors.grey,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.blue),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text("Logout",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                        )),
                    onPressed: () => {_logout()},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teFirstName,
                    decoration: InputDecoration(
                      labelText: "First name",
                      hintText: "First name",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teLastName,
                    decoration: InputDecoration(
                      labelText: "Last name",
                      hintText: "Last name",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teEmail,
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      hintText: "E-Mail",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: "Role",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white,
                    hint: const Text("Select role"),
                    onChanged: (String? newSelect) {
                      if (newSelect != null) {
                        u?.role = Role.values.byName(newSelect);
                      }
                    },
                    items: Role.values
                        .map((e) => e.name)
                        .toList()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                    value: u?.role.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: "Languale",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white,
                    hint: const Text("Select language"),
                    onChanged: (String? newSelect) {
                      if (newSelect != null) {
                        u?.language = Languages.values.byName(newSelect);
                      }
                    },
                    items: Languages.values
                        .map((e) => e.name)
                        .toList()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                    value: u?.language.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 128),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xff1D1617)),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.only(
                              top: 8, left: 64, right: 64, bottom: 8),
                        ),
                      ),
                      child: Text("Save",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.height * 0.03,
                          )),
                      onPressed: () => {_saveProfile(u!)},
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void _saveProfile(User u) {
    u.firstName = _teFirstName.text;
    u.lastName = _teLastName.text;
    u.email = EmailContact(_teEmail.text);
    ProfileWidget.of(context)?.profile.value = u;
    //UserViewModel(u).save();
    ProfileWidget.of(context)?.profile.save();
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthPage()),
        (Route<dynamic> route) => false);
  }
}
