import 'package:raionbattlepass/data/model/response/notes/note_detail_response.dart';
import 'package:raionbattlepass/data/model/response/notes/note_response.dart';
import 'package:raionbattlepass/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';

class NoteController extends GetxController {
  late RetrofitClient client;

  var repo = Repository();
  RxList<NoteData> allNote = <NoteData>[].obs;

  var noteId = "".obs;
  var title = "".obs;
  var description = "".obs;

  getAllNotes({
    required Function(List<NoteData>) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getAllNotes(onSuccess: (value) {
      onSuccess(value);
    }, onFailed: (msg) {
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

  deleteNote(
    String noteId, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.deleteNote(noteId, onSuccess: (value) {
      onSuccess(value);
    }, onFailed: (msg) {
      onFailed(msg);
    });
  }
}
