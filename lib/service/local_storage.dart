import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class ObjectStorage {
  read(String key) async {
    return json.decode(GetStorage().read(key));
  }

  save(String key, value) async {
    GetStorage().write(key, json.encode(value));
  }

  remove(String key) async {
    GetStorage().remove(key);
  }
}
