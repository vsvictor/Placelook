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
  final List<Walk> walls = [];
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
          walls.clear();
          walls.addAll(model.list!);
          _createData();
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

  FeatureCollectionTable _createWalksTable() {
    final table = FeatureCollectionTable(
        fields: [
          Field.text(name: "id", alias: "Walk ID", length: 32),
          Field.text(name: "name", alias: "Walk name", length: 128),
          Field.text(name: "city", alias: "City name", length: 64),
          Field.date(name: "time", alias: "Walk time"),
          Field.text(
            name: "guidID",
            alias: "Guid ID",
            length: 32,
          ),
          Field.shortInt(name: "duration", alias: "Duration in minutes"),
          Field.text(name: "language", alias: "Language of walk", length: 24),
          Field.text(name: "type", alias: "Type walk", length: 8)
        ],
        geometryType: GeometryType.point,
        spatialReference: SpatialReference.wgs84);

    ArcGISImage.fromAsset("assets/marker.png").then((image){
      table.renderer = SimpleRenderer(
        symbol: PictureMarkerSymbol.withImage(image),
      );
    });
    return table;
  }

  void _addWalks(FeatureCollectionTable table, List<Walk> data) {
    for (var e in data) {
      table.addFeature(table.createFeature(
          attributes: {
            "id": e.id,
            "name": e.name,
            "city": e.city,
            "time": e.time,
            "guidID": e.who?.id??"",
            "duratiom": e.duration,
            "language": e.language,
            "type": e.typeWalk
          },
          geometry:
              ArcGISPoint(x: e.location!.longitude, y: e.location!.latitude)));
    }
  }

  void _createData() {
    //for (var e in walls) {print("From widget:$e");}
    final tab = _createWalksTable();
    _addWalks(tab, walls);
    final featureCollection = FeatureCollection()..tables.addAll([tab]);
    var walksLayer = _map?.operationalLayers.firstOrNull;
    if (walksLayer != null) {
      _map?.operationalLayers.remove(walksLayer);
    }
    final featureCollectionLayer =
        FeatureCollectionLayer.withFeatureCollection(featureCollection);
    featureCollectionLayer.name = "Walks";
    _map?.operationalLayers.add(featureCollectionLayer);
  }
}
