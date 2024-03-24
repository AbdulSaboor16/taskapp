import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  final int id;
  final String name;
  RxBool isFavorite = false.obs;

  Item(this.id, this.name);
}

class HomeController extends GetxController {
  var items = <Item>[].obs;

  List<String> favoriteIds = [];
  String favoriteKey = "favoriteIds";
  late SharedPreferences prefs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    // Fetch data from API (mocked here)
    prefs = await SharedPreferences.getInstance();
    favoriteIds = prefs.getStringList(favoriteKey) ?? [];
    List<Item> temp = [];
    final response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "/todos"));
    isLoading.value = false;
    print(response.body);
    var data = jsonDecode(response.body);
    for (var item in data) {
      temp.add(Item(item["id"], item["title"]));
      if (favoriteIds.contains(item["id"].toString())) {
        temp.last.isFavorite.value = true;
      }
    }
    items.value = temp;
  }

  void toggleFavorite(int id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      items[index].isFavorite.value = !items[index].isFavorite.value;
      if (items[index].isFavorite.value) {
        favoriteIds.add(items[index].id.toString());
      } else {
        favoriteIds.remove(items[index].toString());
      }
      prefs.setStringList(favoriteKey, favoriteIds);
    }
  }
}
