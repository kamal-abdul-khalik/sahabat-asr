import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/image/header-register.png",
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
              "Daftar Akun",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomField(
              label: "Nama Lengkap",
              validator: Validator.required,
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),
            CustomField(
              label: "Email",
              validator: Validator.email,
              suffixIcon: Icons.email,
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),
            CustomField(
              label: "Password",
              obscure: true,
              validator: Validator.required,
              suffixIcon: Icons.password,
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),
            CustomField(
              label: "Kode Ref",
              obscure: true,
              suffixIcon: Icons.account_tree,
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Dengan mengetuk DAFTAR, ",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "saya menyetujuai ",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => showInfoDialog('ini Syaratnya bro'),
                                text: "Syarat ",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "dan ",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => showInfoDialog(
                                              'ini ketentuannya bro'),
                                        text: "Ketentuan",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(360, 60),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => Get.offAll(const LoginView()),
              child: const Text(
                "DAFTAR",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: "Sudah punya akun? ",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.offAll(const LoginView()),
                    text: "Login",
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
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
