import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/image/header-login.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Image.asset(
                    "assets/image/asr87.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Selamat Datang Kembali",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomField(
                label: "Username",
                validator: (value) => Validator.required(value!),
                suffixIcon: Icons.email,
                onChanged: (value) {
                  controller.username = value;
                },
              ),
              const SizedBox(height: 30),
              CustomField(
                label: "Password",
                obscure: true,
                validator: (value) => Validator.required(value!),
                suffixIcon: Icons.remove_red_eye,
                onChanged: (value) {
                  controller.password = value;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(360, 60),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => controller.doLogin(),
                child: const Text(
                  "MASUK",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: "Belum punya akun? ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.offAll(const RegisterView()),
                      text: "Daftar",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
