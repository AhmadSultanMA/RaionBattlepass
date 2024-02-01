import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:raionbattlepass/route/routes.dart';
import 'package:raionbattlepass/presentation/auth/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.nim = s;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'nim',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.password = s;
                  },
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          controller.login(onSuccess: (token) {
                            GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
                            showMySnackbar(context, 'berhasil');
                          }, onFailed: (msg) {
                            showMySnackbar(context, msg);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(height * 0.02),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
              }),
              Container(
                margin: EdgeInsets.only(top: height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: width * 0.01),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).go(Routes.REGISTER_SCREEN);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade700,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void showMySnackbar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Tutup',
      onPressed: () {
        // Aksi yang akan diambil ketika tombol "Tutup" ditekan.
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
