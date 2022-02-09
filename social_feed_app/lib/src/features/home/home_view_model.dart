import 'package:flutter_social_app/src/core/provider/base_view_model.dart';
import 'package:social_feed_api/api/api_manager.dart';
import 'package:social_feed_api/models/category.dart';

class HomeViewModel extends BaseViewModel {
  @override
  void initState() {
    _loadCategories();
  }

  List<Category> categories = [];
  Future<void> _loadCategories() async {
    final response = await ApiManager.instance.loadCategories();
    categories = response.data;
    notifyListeners();
  }
}
