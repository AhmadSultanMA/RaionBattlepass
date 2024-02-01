import 'package:raionbattlepass/data/model/response/notes/note_detail_response.dart';
import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class EditNoteController extends GetxController {
  var noteId = "";
  var title = "";
  var description = "";
  late RetrofitClient client;

  var repo = Repository();

  var isLoading = false.obs;

  void editNote({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.editNote(noteId, title, description, onSuccess: (msg) {
      isLoading(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }

  getNoteDetail(
    String noteId, {
    required Function(NoteDetailData) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getNote(noteId, onSuccess: (value) {
      onSuccess(value);
    }, onFailed: (msg) {
      onFailed(msg);
    });
  }

  resetEdit() {
    noteId = "";
    title = "";
    description = "";
  }
}
