import 'package:get/get.dart';
import 'package:restuarant/data/api/api.client.dart';
import '../../utils/apps_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppsConstants.popularProductUri);
  }
}
