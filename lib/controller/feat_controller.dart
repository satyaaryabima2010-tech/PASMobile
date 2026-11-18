import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_flutter/models/bola_model.dart';

class FeatController extends GetxController {
  var isLoading = false.obs;

  var daftarBola = <Map<String, String?>>[].obs;

  Future<void> getDataBola() async {
    try {
      isLoading.value = true;

      final url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English_Premier_League',
      );
      final response = await http.get(url);

      if (response.statusCode != 200) {
        Get.snackbar('Error', 'Gagal mengambil data API');
        return;
      }

      final data = modelsBolaFromJson(response.body);
      daftarBola.assignAll(data.teams);
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDataBola();
  }
}