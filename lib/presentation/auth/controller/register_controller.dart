import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var nim = "";
  var name = "";
  var password = "";
  var description = "";

  var repo = Repository();

  var isLoading = false.obs;

  void register({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.register(nim, name, password, description, onSuccess: (msg) {
      isLoading(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }
}
