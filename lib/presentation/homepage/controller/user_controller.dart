import 'package:raionbattlepass/data/model/response/user/user_response.dart';
import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class UserController extends GetxController {
  late RetrofitClient client;

  var repo = Repository();

  var nim = "".obs;
  var name = "".obs;

  getUser({
    required Function(UserData) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getUser(onSuccess: (value) {
      onSuccess(value);
    }, onFailed: (msg) {
      onFailed(msg);
    });
  }
}
