import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ObjectIdString implements JsonConverter<ObjectId, String> {
  const ObjectIdString();
  @override
  ObjectId fromJson(String json) {
    return ObjectId.fromHexString(json);
  }

  @override
  String toJson(ObjectId object) {
    return object.toHexString();
  }
}
