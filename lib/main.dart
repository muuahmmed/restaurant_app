import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restuarant/pages/home/main_food_page.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_comtroller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
    );
  }
}
