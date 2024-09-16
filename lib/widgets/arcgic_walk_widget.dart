import 'dart:async';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/utils/text_style.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/walk.dart';
import '../viewmodel/map_view_model.dart';
import '../viewmodel/walk_view_model.dart';

class ArcGISWalkWidget extends StatefulWidget {
  const ArcGISWalkWidget({super.key});
  @override
  _ArcGISAuthWidgetState createState() => _ArcGISAuthWidgetState();
}

class _ArcGISAuthWidgetState extends State<ArcGISWalkWidget>
    implements ArcGISAuthenticationChallengeHandler {
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
    _mapController.selectionProperties.color = Color.fromARGB(231, 4, 4, 254);
    ArcGISEnvironment
        .authenticationManager.arcGISAuthenticationChallengeHandler = this;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MapViewModel>().getAllWalks();
      context.read<MapViewModel>().list?.forEach((w)=>{
        if(w.id == null) w.generateID(),
        print("WWWWWWWWWW"+w.toString())
      });
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
            onTap: _onTapFeature,
          ),
        );
      },
    );
  }

  void onMapViewReady() async {
    _map = ArcGISMap.withItem(PortalItem.withPortalAndItemId(
        portal: Portal.arcGISOnline(connection: PortalConnection.authenticated),
        itemId: '5f68957c846942f19d2ac5cb191842c8'));
    _mapController.arcGISMap = _map;
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
          Field.text(name: "about", alias: "About this walk", length: 1024),
          Field.date(name: "time", alias: "Walk time"),
          Field.text(
            name: "guidID",
            alias: "Guid ID",
            length: 32,
          ),
          Field.shortInt(name: "duration", alias: "Duration in minutes"),
          Field.text(
              name: "peoples", alias: "Number of participants", length: 8),
          Field.text(name: "language", alias: "Language of walk", length: 24),
          Field.text(name: "type", alias: "Type walk", length: 8),
        ],
        geometryType: GeometryType.point,
        spatialReference: SpatialReference.wgs84);

    ArcGISImage.fromAsset("assets/marker96.png").then((image) {
      table.renderer = SimpleRenderer(
        symbol: PictureMarkerSymbol.withImage(image),
      );
    });
    return table;
  }

  void _addWalks(FeatureCollectionTable table, List<Walk> data) {
    for (var e in data) {
      var f = table.createFeature(
          attributes: {
            "id": e.id,
            "name": e.name,
            "city": e.city,
            "about": e.about,
            "time": e.time,
            "guidID": e.who?.id ?? "",
            "duratiom": e.duration,
            "peoples": e.count.toString(),
            "language": e.language.name,
            "type": e.typeWalk.name,
          },
          geometry:
              ArcGISPoint(x: e.location!.longitude, y: e.location!.latitude));
      table.addFeature(f);
      print("Added:" + f.toString());
    }
  }

  void _createData(MapViewModel model) {
    //for (var e in walls) {print("From widget:$e");}
    final tab = _createWalksTable();
    model.list?.forEach((e) => {print(e.toString())});
    _addWalks(tab, model.list ?? List<Walk>.empty());
    final featureCollection = FeatureCollection()..tables.addAll([tab]);
    final featureCollectionLayer =
        FeatureCollectionLayer.withFeatureCollection(featureCollection);
    featureCollectionLayer.name = "Walks";
    _map?.operationalLayers.clear();
    _map?.operationalLayers.add(featureCollectionLayer);
  }

  void _onTapFeature(Offset localPosition) async {
    var vmUser = context.read<UserViewModel>();
    FeatureCollectionLayer? layer;
    _map?.operationalLayers.forEach((l) {
      if (l.name == "Walks") {
        layer = l as FeatureCollectionLayer?;
      }
    });
    var fLayer = layer?.layers.first;
    if (fLayer != null) {
      fLayer.clearSelection();
      final identify = await _mapController.identifyLayer(fLayer,
          screenPoint: localPosition, tolerance: 10.0, maximumResults: 1);
      final features = identify.geoElements.whereType<Feature>().toList();
      if (features.isNotEmpty) {
        fLayer.selectFeatures(features: features);
        var selected = features.first;
        //if (mounted) _showBottomSheet(selected);
        if (mounted) {
/*          var walk = Walk(
              id: selected.attributes["id"],
              name: selected.attributes["name"],
              city: selected.attributes["city"],
              about: selected.attributes["about"],
              location: selected.attributes["location"],
              time: selected.attributes["time"],
              who: await vmUser.getUserByID(selected.attributes["guidID"]),
              duration: selected.attributes["duration"],
              language: Languages.values
                  .byName(selected.attributes["language"] ?? "UKRANIAN"),
              typeWalk:
                  TypeWalk.values.byName(selected.attributes["type"] ?? "FREE"),
              count: int.parse(selected.attributes["peoples"]));*/
          var walk = await context.read<WalkViewModel>().getWaltByID(selected.attributes["id"]);
          if(walk != null) {
            context.read<WalkViewModel>().setWalk(walk);
            context.pushNamed("walk");
          }
        }
      }
    }
  }
}
