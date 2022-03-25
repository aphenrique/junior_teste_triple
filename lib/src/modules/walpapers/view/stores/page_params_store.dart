import 'package:flutter/cupertino.dart';

class PageParamsStore {
  final perpage = ValueNotifier<int>(10);
  final _apiPage = ValueNotifier<int>(1);
  final _query = ValueNotifier<String?>(null);

  void setPerPage(int value) => perpage.value = value;

  void incrementApiPage() => _apiPage.value++;
  void resetApiPage() => _apiPage.value = 1;

  void resetQuery() => _query.value = null;
  void setQuery(query) => _query.value = query;

  int get apiPage => _apiPage.value;
  int get perPage => perpage.value;
  String? get query => _query.value;
}
