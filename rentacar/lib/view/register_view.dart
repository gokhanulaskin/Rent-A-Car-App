import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentacar/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Kullanıcı bilgilerini saklamak için secure storage nesnesi
final _secureStorage = FlutterSecureStorage();

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  // Kullanıcı adı ve e-postayı SharedPreferences ile kaydetme
  Future<void> _saveUserInfo(String username, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
  }

  // Şifreyi flutter_secure_storage ile kaydetme
  Future<void> _savePassword(String password) async {
    await _secureStorage.write(key: 'password', value: password);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textNameController = TextEditingController();
    TextEditingController textEmailController = TextEditingController();
    TextEditingController textPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/applogo.png",
              height: 200,
              width: 300,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Üye Ol",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text.rich(
                  TextSpan(
                    text: 'Zaten bir hesaba sahibim\t\t\t',
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Giriş Yap',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: const Icon(
                    Icons.login,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: textNameController,
                onChanged: (String deger) {},
                onSubmitted: (String deger) {},
                decoration: const InputDecoration(
                    hintText: 'Kullanıcı Adı', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: textPasswordController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                maxLines: 2,
                minLines: 1,
                maxLength: 8,
                decoration: const InputDecoration(
                    hintText: 'Şifre', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                // Kullanıcı bilgilerini kaydet
                await _saveUserInfo(
                    textNameController.text, textEmailController.text);
                await _savePassword(textPasswordController.text);

                // TextField'ları temizle
                textNameController.clear();
                textEmailController.clear();
                textPasswordController.clear();

                // Kullanıcıyı Giriş ekranına yönlendir
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
