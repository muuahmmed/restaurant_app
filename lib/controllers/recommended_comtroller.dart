import 'package:get/get.dart';
import 'package:restuarant/data/repository/recommended_product_repo.dart';
import 'package:restuarant/models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("got products recommended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products!);
      _isLoaded = true;
      update();
    } else {
      // Handle error
      print("Failed to load recommended products: ${response.statusText}");
      print("response body: ${response.body}");
    }
  }
}
