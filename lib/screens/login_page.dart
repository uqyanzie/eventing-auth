import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('http://192.168.1.8:3000/signin');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Login berhasil!');
        // Login berhasil, lanjutkan ke halaman berikutnya
        Navigator.pushNamed(context, 'home');
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Gagal'),
            content: Text(
                'Email/password salah atau terjadi kesalahan, Status : ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Tampilkan pesan kesalahan jika login gagal
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Email/password salah atau terjadi kesalahan'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      throw Exception('Error : $e, Gagal melakukan registrasi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: Text('Login'),
              ),
              const SizedBox(height: 8.0),
              InkWell(
                  child: const Text('Register',
                      style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    Navigator.pushNamed(context, 'register');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
