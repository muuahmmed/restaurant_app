import 'package:get/get.dart';
import 'package:restuarant/data/api/api.client.dart';
import '../../utils/apps_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppsConstants.recommendedProductUri);
  }
}
