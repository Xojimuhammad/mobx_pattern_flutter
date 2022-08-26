import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import 'package:mobx/mobx.dart';
import '../../services/http_service.dart';
part 'home_store.g.dart';

// TODO: flutter packages pub run build_runner build --delete-conflicting-outputs => storeni update qiladi terminal orqali
// TODO: ls => papkaga kirish terminal orqali
// TODO: flutter clean => flutterni tozalaydi terminal orqali
// TODO: flutter pub get => flutterni qayta ishga tushiradi terminal orqali

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable List<Post> items = [];
  @observable bool isLoading = false;

  Future apiPostList(BuildContext context) async {
    isLoading = true;

    String? response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;

  }

  Future<bool?> apiPostDelete(BuildContext context, Post post) async {
    isLoading = true;

    String? response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;
    return response != null;

  }
}
