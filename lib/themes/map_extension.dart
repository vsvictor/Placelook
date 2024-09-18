import 'package:flutter/material.dart';

class MapExtension extends ThemeExtension<MapExtension>{
  final String name;
  final String mapID;
  MapExtension(this.name, this.mapID);
  @override
  ThemeExtension<MapExtension> copyWith() {
    return MapExtension(name, mapID);
  }

  @override
  ThemeExtension<MapExtension> lerp(covariant ThemeExtension<MapExtension>? other, double t) {
    return this;
  }
  
}