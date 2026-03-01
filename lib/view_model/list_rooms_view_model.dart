import 'package:smart_home/services/api_crud_services.dart';

class RoomCategoriesViewModel extends APICrudServices{
  List<String> roomCategories = ['Bed Room', 'Kitchen', 'Living Room'];
  late String selectedCategory = roomCategories.first;
}