import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class AuthController {
  // Mengembalikan UserModel jika cocok, null jika salah
  Future<UserModel?> login(String username, String password) async {
    final String teks =
        await rootBundle.loadString('assets/data/users.json');
    final List data = jsonDecode(teks);
    final List<UserModel> semuaUser =
        data.map((e) => UserModel.fromJson(e)).toList();

    for (final user in semuaUser) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }
}