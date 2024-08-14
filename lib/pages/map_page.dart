import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //https://basemaps.arcgis.com/arcgis/rest/services/World_Basemap_v2/VectorTileServer
  late Future _loadBasemapFuture;
  @override
  void initState() {
    //AGMLAuthManager().setApiKey(dotenv.env['API_KEY'] ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
