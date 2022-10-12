// import 'package:get/get.dart';
//
// /* date: 19.07.21
// * name: vennila
// * task: sortFilter*/
// class SortFilterController extends GetxController{
//   final List<String> order = ["A-Z", "Highest Rated"];
//   final List<String> price = ["Low to High", "High to Low"];
//   final List<String> discount = ["High to Low", "Low to High"];
//   final List<String> location = ["Nearby me"];
//   String? orderSelect,priceSelect,discountSelect,locationSelect;
//   final selectedOwnerShipIndexes = [].obs;
//   final selectedCollegeTypeIndexes = [].obs;
//   final List<String> ownerShip = ["Government", "Private"];
//   final List<String> collegeType = ["Co-ed", "Mens","Womens"];
//   var examAccepted = false.obs;
//
//   void orderButtonClick(value) {
//     print(value);
//     orderSelect = value;
//     update();
//   }
//   void priceButtonClick(value) {
//     print(value);
//     priceSelect = value;
//     update();
//   }
//   void discountButtonClick(value) {
//     print(value);
//     discountSelect = value;
//     update();
//   }
//
//   void nearByMeButtonClick(value) {
//     print(value);
//     locationSelect = value;
//     update();
//   }
// }

import 'package:get/get.dart';
/* date: 19.07.21
* name: vennila
* task: sortFilter*/
class SortFilterController extends GetxController{
  final List<String> order = ["Price (low to high)","Price (high to low)","option 3","option 4"];
  final List<String> filterOrder = ["Less than 30 minutes","option 2","option 3","option 4"];

  String? orderSelect;
  String? filterOrderSelect;
  var examAccepted = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    }

  var isLoading = false.obs;
  bool active = false;


  //String orderParams = "";
  void orderButtonClick(value) {
    orderSelect = value;
    print(orderSelect);
    update();
  }

  void filterOrderButtonClick(value) {
    filterOrderSelect = value;
    print(filterOrderSelect);
    update();
  }
}