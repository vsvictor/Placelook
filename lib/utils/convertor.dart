Map<String, dynamic> convertMap(Map<dynamic, dynamic> map) {
  for (var key in map.keys) {
    if (map[key] is Map) {
      map[key] = convertMap(map[key]);
    }
  }
  return Map<String, dynamic>.from(map);
}
