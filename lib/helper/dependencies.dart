import 'package:get/get.dart';
import 'package:restuarant/controllers/recommended_comtroller.dart';
import 'package:restuarant/data/repository/popular_product_repo.dart';
import '../controllers/popular_product_controller.dart';
import '../data/api/api.client.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/apps_constants.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppsConstants.baseUrl));

  // Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
    () => RecommendedProductController(recommendedProductRepo: Get.find()),
  );
}
