import 'package:dio/dio.dart';
import 'package:raionbattlepass/data/model/request/login/login_request.dart';
import 'package:raionbattlepass/data/model/request/notes/notes_request.dart';
import 'package:raionbattlepass/data/model/request/register/register_request.dart';
import 'package:raionbattlepass/data/model/response/base/base_response.dart';
import 'package:raionbattlepass/data/model/response/login/login_response.dart';
import 'package:raionbattlepass/data/model/response/notes/note_response.dart';
import 'package:raionbattlepass/data/model/response/user/user_response.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://raion-battlepass-2024.up.railway.app")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @POST("/login")
  Future<LoginResponse> login(
    @Body() LoginRequest request,
  );

  @POST("/register")
  Future<BaseResponse> register(
    @Body() RegisterRequest request,
  );

  @POST("/note")
  Future<BaseResponse> postNote(@Body() NotesRequest request);

  @GET("/user")
  Future<UserResponse> getUserDetail();

  @GET("/note")
  Future<NoteResponse> getAllNotes();

  @GET("/note/{noteId}")
  Future<NoteResponse> getNoteDetail(@Path("noteId") String noteId);
}
