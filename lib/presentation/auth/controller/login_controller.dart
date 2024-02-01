import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class LoginController extends GetxController {
  var nim = "";
  var password = "";
  late RetrofitClient client;

  var repo = Repository();
  var isLoading = false.obs;

  void login({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.login(nim, password, onSuccess: (token) {
      isLoading(false);
      onSuccess(token);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }
}
