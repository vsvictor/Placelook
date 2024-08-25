import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Placelook/widgets/avatar_widget.dart';
import 'package:Placelook/pages/auth_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserViewModel? vm;
  TextEditingController _teFirstName = TextEditingController();
  TextEditingController _teLastName = TextEditingController();
  TextEditingController _teEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>{
      if(vm?.user == null){
        vm?.fromStorage()
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<UserViewModel>(context);
    Size size = MediaQuery.of(context).size;
    if (_teFirstName.text.trim().isEmpty)
      _teFirstName.text = (vm?.user != null) ? vm?.user?.firstName??"" : "";
    if (_teLastName.text.trim().isEmpty)
      _teLastName.text = (vm?.user != null) ? vm?.user?.lastName??"" : "";
    if (_teEmail.text.trim().isEmpty)
      _teEmail.text = (vm?.user != null) ? vm?.user?.email??"" ?? "" : "";
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
                        vm?.user?.role = Role.values.byName(newSelect);
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
                    value: vm?.user?.role.name,
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
                        vm?.user?.language = Languages.values.byName(newSelect);
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
                    value: vm?.user?.language.name,
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
                      onPressed: () => {_saveProfile()},
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

  void _saveProfile() {
    if (vm?.user?.id == null) vm?.user?.generateID();
    vm?.user?.firstName = _teFirstName.text;
    vm?.user?..lastName = _teLastName.text;
    vm?.user?.contacts = ([Contact.email(_teEmail.text)]).toList();
    vm?.save();
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthPage()),
        (Route<dynamic> route) => false);
  }
}
