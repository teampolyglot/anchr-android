import 'dart:convert';

import 'package:anchr_android/services/api_service.dart';

class RemoteService extends ApiService {
  static final RemoteService _instance = new RemoteService._internal();

  factory RemoteService() {
    return _instance;
  }

  RemoteService._internal();

  Future<String> fetchPageTitle(String url) async {
    const String defaultVal = '';
    try {
      final res = await super.get('/remote/page?url=$url');
      if (res.statusCode == 200) {
        Map<String, dynamic> data = json.decode(res.body);
        if (data.containsKey('title')) return data['title'];
        throw Exception();
      }
      throw Exception();
    } catch (e) {
      return defaultVal;
    }
  }
}