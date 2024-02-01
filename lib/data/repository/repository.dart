import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:raionbattlepass/data/model/request/login/login_request.dart';
import 'package:raionbattlepass/data/model/request/notes/notes_request.dart';
import 'package:raionbattlepass/data/model/request/register/register_request.dart';
import 'package:raionbattlepass/data/model/response/notes/note_detail_response.dart';
import 'package:raionbattlepass/data/model/response/notes/note_response.dart';
import 'package:raionbattlepass/data/model/response/user/user_response.dart';
import 'package:raionbattlepass/data/repository/retrofit_client.dart';
import '../../main.dart';

class Repository {
  late Dio dio;
  late RetrofitClient client;

  Repository() {
    dio = Dio();
    if (prefs != null) {
      dio.options.headers['Authorization'] =
          'Bearer ${prefs?.getString("TOKEN") ?? ""}';
    }
    client = RetrofitClient(dio);
  }

  void register(
    String nim,
    String name,
    String password,
    String description, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .register(RegisterRequest(
            nim: nim, name: name, password: password, description: description))
        .then((value) {
      if (!value.error) {
        onSuccess(value.message);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void login(
    String nim,
    String password, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.login(LoginRequest(nim: nim, password: password)).then((value) {
      if (!value.error) {
        saveToken(value.data.token, () {});
        onSuccess(value.data.token);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void postNote(
    String title,
    String description, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .postNote(NotesRequest(title: title, description: description))
        .then((value) {
      if (!value.error) {
        onSuccess(value.message);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void getUser({
    required Function(UserData) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getUserDetail().then((value) {
      if (!value.error) {
        onSuccess(value.data);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void getAllNotes({
    required Function(List<NoteData>) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getAllNotes().then((value) {
      if (!value.error) {
        onSuccess(value.data);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void getNote(
    String noteId, {
    required Function(NoteDetailData) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getNoteDetail(noteId).then((value) {
      if (!value.error) {
        onSuccess(value.data);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  void deleteNote(
    String noteId, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.deleteNote(noteId).then((value) {
      if (!value.error) {
        onSuccess(value.message);
      } else {
        onFailed(value.message);
      }
    }).catchError((err) {
      onFailed(err);
    });
  }

  saveToken(String token, Function onSuccess) {
    if (prefs != null) {
      prefs?.setString("TOKEN", token).then((value) {
        onSuccess();
      }).catchError((e) {
        debugPrint(e.toString());
      });
    }
  }

  getToken(Function(String) onSuccess) {
    if (prefs != null) {
      onSuccess(prefs?.getString("TOKEN") ?? "");
    }
  }

  removeToken() {
    prefs?.remove("TOKEN").catchError((e) {
      debugPrint(e.toString());
      return false;
    });
  }
}
