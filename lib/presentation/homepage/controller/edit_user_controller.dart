import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class EditUserController extends GetxController {
  var name = "";
  var password = "";
  var description = "";
  late RetrofitClient client;

  var repo = Repository();

  var isLoading = false.obs;

  void editUser({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.editUser(name, password, description, onSuccess: (msg) {
      isLoading(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }

  resetEdit() {
    name = "";
    password = "";
    description = "";
  }
}
