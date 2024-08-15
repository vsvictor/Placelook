import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';

//https://basemaps.arcgis.com/arcgis/rest/services/World_Basemap_v2/VectorTileServer

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ArcGISMapView(
              controllerProvider: () {
                return ArcGISMapView.createController()
                  ..arcGISMap = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic);
              },
            ),
          ),
        ],
      ),
    );
  }
}