import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/walk.dart';
import '../viewmodel/map_view_model.dart';

class ArcGISWalkWidget extends StatefulWidget {
  const ArcGISWalkWidget({super.key});
  @override
  _ArcGISAuthWidgetState createState() => _ArcGISAuthWidgetState();
}

class _ArcGISAuthWidgetState extends State<ArcGISWalkWidget>
    implements ArcGISAuthenticationChallengeHandler {
  //final List<Walk> walls = [];
  final _mapController = ArcGISMapView.createController();
  final _settingsVisible = false;
  final _locationDataSource = SystemLocationDataSource();
  StreamSubscription? _statusSubscription;
  final _status = LocationDataSourceStatus.stopped;
  StreamSubscription? _autoPanModeSubscription;
  final _autoPanMode = LocationDisplayAutoPanMode.recenter;
  var _ready = false;
  ArcGISMap? _map;

  @override
  void initState() {
    super.initState();
    ArcGISEnvironment
        .authenticationManager.arcGISAuthenticationChallengeHandler = this;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Provider.of<MapViewModel>(context, listen: false).getAllWalks()
      context.read<MapViewModel>().getAllWalks();
    });
  }

  @override
  void dispose() {
    ArcGISEnvironment
        .authenticationManager.arcGISAuthenticationChallengeHandler = null;
    ArcGISEnvironment.authenticationManager.arcGISCredentialStore.removeAll();
    _locationDataSource.stop();
    _statusSubscription?.cancel();
    _autoPanModeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapViewModel>(
      builder: (context, model, child) {
        if (model.list != null) {
          _createData(model);
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: ArcGISMapView(
            controllerProvider: () => _mapController,
            onMapViewReady: onMapViewReady,
          ),
        );
      },
    );
  }

  void onMapViewReady() async {
    _map = ArcGISMap.withItem(PortalItem.withPortalAndItemId(
        portal: Portal.arcGISOnline(connection: PortalConnection.authenticated),
        itemId: '5f68957c846942f19d2ac5cb191842c8'));
/*
    // Set the initial system location data source and auto-pan mode.
    _mapController.locationDisplay.dataSource = _locationDataSource;
    _mapController.locationDisplay.autoPanMode =
        LocationDisplayAutoPanMode.recenter;*/

    _mapController.arcGISMap = _map;
/*
    // Subscribe to status changes and changes to the auto-pan mode.
    _statusSubscription = _locationDataSource.onStatusChanged.listen((status) {
      setState(() => _status = status);
    });
    setState(() => _status = _locationDataSource.status);
    _autoPanModeSubscription =
        _mapController.locationDisplay.onAutoPanModeChanged.listen((mode) {
      setState(() => _autoPanMode = mode);
    });
    setState(() => _autoPanMode = _mapController.locationDisplay.autoPanMode);

*/
    // Attempt to start the location data source (this will prompt the user for permission).
/*
    try {
      await _locationDataSource.start();
    } on ArcGISException catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(content: Text(e.message)),
        );
      }
    }
*/

    // Set the ready state variable to true to enable the UI.
    setState(() => _ready = true);
  }

  @override
  void handleArcGISAuthenticationChallenge(
      ArcGISAuthenticationChallenge challenge) {
    _loginArcGIS(challenge);
  }

  void _loginArcGIS(ArcGISAuthenticationChallenge challenge) async {
    final cred = await TokenCredential.createWithChallenge(challenge,
        username: "viktor.dzhurliak", password: "Stran74ger");
    challenge.continueWithCredential(cred);
  }
  void _createData(MapViewModel model){
    var tab = FeatureCollectionTable(fields: [
      Field.text(name: "id", alias: "ID", length: 64),
      Field.text(name: "name_walk", alias: "Walk", length: 256),
      Field.text(name: "city_walk", alias: "City", length: 128),
      Field.date(name: "date_walk", alias: "Date"),
      Field.text(name: "guidid_walk", alias: "Guid", length: 64),
      Field.shortInt(name: "duration_walk", alias: "Duration"),
      Field.text(name: "language_walk", alias: "Language", length: 64),
      Field.text(name: "typw_walk", alias: "Type", length: 8)
    ], geometryType: GeometryType.point, spatialReference: SpatialReference.wgs84);
    model.list?.forEach((Walk w){
      if(w.id == null) w.generateID();
      var fea = tab.createFeature(attributes: {
        "id": w.id,
        "name_walk": w.name,
        "city_walk": w.city,
        "date_walk":w.time,
        "guidid_walk": w.who?.id,
        "duration_walk":w.duration,
        "language_walk":w.language.title,
        "typw_walk":w.typeWalk.title
      }, geometry:
      ArcGISPoint(x: w.location!.longitude, y: w.location!.latitude, spatialReference: SpatialReference.wgs84));
    });
    tab.renderer = PictureFillSymbol.withImage(ArcGISImage.fromAsset("assets/marker96.png") as ArcGISImage) as Renderer?;
    _map?.operationalLayers.forEach((Layer layer){
      if(layer.name == "Walks") _map?.operationalLayers.remove(layer);
    });
    model.walkLayer = FeatureCollectionLayer.withFeatureCollection(FeatureCollection.withTables([tab]));
    model.walkLayer?.name = "Walks";
    _map?.operationalLayers.add(model.walkLayer!);

  }
}
