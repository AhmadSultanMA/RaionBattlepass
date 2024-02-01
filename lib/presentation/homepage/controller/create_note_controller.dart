import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class CreateNoteController extends GetxController {
  var title = "";
  var description = "";
  late RetrofitClient client;

  var repo = Repository();

  var isLoading = false.obs;

  void createNote({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.postNote(title, description, onSuccess: (msg) {
      isLoading(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }

  resetCreate() {
    title = "";
    description = "";
  }
}
