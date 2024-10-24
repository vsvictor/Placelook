import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../viewmodel/map_view_model.dart';
import '../widgets/arcgic_walk_widget.dart';

//https://basemaps.arcgis.com/arcgis/rest/services/World_Basemap_v2/VectorTileServer
//CLIENT_ID = "QF29MwuUhP2rWnK4"
//SECRET_ID = "1200189268ec437d869f94f121704cbb"
//TOKEN = "AAPT3NKHt6i2urmWtqOuugvr9da94IDnw2h9vSa9RY7akvpXnrKaTpxDo3CGWccpYOIPEYVLuHMddyrQyRjs5YwpaZxH9zsieGNdmqrhOjtD8hqo7s3_5fjn38gv7lYk1c-kIwSHTHh60e77ulmMvkqF4a0xgGHOwiMp3jVp57daqZF__o-Aw1DRP4p_PWoUoUzLK0BOfqbPPWTeQOMuKOUHw-gGoK0C1FrPtKjjLEL_QxA."
//Термін дії закінчується через 2 год (пʼятницю, 16 серпня 2024 р. о 11:35:16).
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => MapViewModel())],
        child: const ArcGISWalkWidget());
  }
}
