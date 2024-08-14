import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: Colors.white),
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
                    padding: EdgeInsets.only(top: 32),
                    child: Avatar(
                      backgroundImage: Image.asset("assets/edit.png"),
                      radius: 128.0,
                      colorBask: Colors.grey,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    decoration: InputDecoration(
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
                      hintText: "E-Mail",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
}
