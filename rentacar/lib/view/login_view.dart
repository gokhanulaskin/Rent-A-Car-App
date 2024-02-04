import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentacar/view/home_view.dart';
import 'package:rentacar/view/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool switchValue = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _secureStorage = FlutterSecureStorage();

  Future<bool> _verifyLogin(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = await _secureStorage.read(key: 'password');

    return username == savedUsername && password == savedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "images/applogo.png",
                  height: 350,
                  width: 4000,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  "Hesabınıza Giriş Yapın",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _usernameController, // Bu satırı ekleyin
                    decoration: const InputDecoration(
                      hintText: 'Kullanıcı Adı',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _passwordController, // Bu satırı ekleyin
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    obscureText: true, // Şifreyi gizlemek için
                    decoration: const InputDecoration(
                      hintText: 'Şifre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                      activeTrackColor: Colors.black,
                      activeColor: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Text("Beni Hatırla"),
                    ),
                    const Text("Şifremi Unuttum"),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool isValid = await _verifyLogin(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    if (isValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    } else {
                      // Doğrulama başarısız olursa kullanıcıya uyarı göster
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Hata'),
                            content: Text('Kullanıcı adı veya şifre hatalı!'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Tamam'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16),
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
                        text: 'Hesap oluşturmak için  ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Kaydol',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()),
                        );
                      },
                      child: const Icon(
                        Icons.navigate_next,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
