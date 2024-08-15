import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placelook/pages/auth_page.dart';
import 'package:placelook/widgets/avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //https://basemaps.arcgis.com/arcgis/rest/services/World_Basemap_v2/VectorTileServer
  late Future _loadBasemapFuture;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? selectedRole = "Tripper";
    String? selectedLanguage = "English";
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
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Text(
                    "Placelook",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff1D1617),
                      fontSize: size.height * 0.03,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Gif(
                    autostart: Autostart.loop,
                    placeholder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    image: const AssetImage('assets/rick.gif'),
                    height: size.height * 0.15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff1D1617),
                      fontSize: size.height * 0.05,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Avatar(
                      backgroundImage: Image.asset("assets/edit.png"),
                      radius: 128.0,
                      colorBask: Colors.grey,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.blue),
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
                      print(newSelect);
                      setState(() {
                          selectedRole = newSelect;
                      });
                    },
                    items: ['Guid', 'Tripper']
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
                      print(newSelect);
                      setState(() {
                          selectedLanguage = newSelect;
                      });
                    },
                    items: ['English', 'Franch','German','Ukranian']
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
                                    top: 8, left: 64, right: 64, bottom: 8))),
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
  void _saveProfile(){

  }
  void _logout(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const AuthPage()), (Route<dynamic> route) => false);
  }
}
