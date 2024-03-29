import 'package:dio/dio.dart';
import 'package:raionbattlepass/data/model/request/editUser/edit_user_request.dart';
import 'package:raionbattlepass/data/model/request/login/login_request.dart';
import 'package:raionbattlepass/data/model/request/notes/notes_request.dart';
import 'package:raionbattlepass/data/model/request/register/register_request.dart';
import 'package:raionbattlepass/data/model/response/base/base_response.dart';
import 'package:raionbattlepass/data/model/response/login/login_response.dart';
import 'package:raionbattlepass/data/model/response/notes/note_detail_response.dart';
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

  @PUT("/user")
  Future<BaseResponse> editUser(@Body() EditUserRequest request);

  @GET("/note")
  Future<NoteResponse> getAllNotes();

  @GET("/note/{noteId}")
  Future<NoteDetailResponse> getNoteDetail(@Path("noteId") String noteId);

  @DELETE("/note/{noteId}")
  Future<BaseResponse> deleteNote(@Path("noteId") String noteId);

  @PUT("/note/{noteId}")
  Future<BaseResponse> editNote(
      @Path("noteId") String noteId, @Body() NotesRequest request);
}
