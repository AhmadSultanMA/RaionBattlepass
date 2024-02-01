import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class UserController extends GetxController {
  late RetrofitClient client;

  var repo = Repository();

  void getUser({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {}
}
