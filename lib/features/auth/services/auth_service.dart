import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //Sign Up User
  void signUpUser({
    required String email,
    required BuildContext context,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        name: name,
        password: password,
        token: '',
        type: '',
        address: '',
      );

      Uri uriTemp = Uri.parse('$uri/api/signup');
      http.Response res = await http.post(
        uriTemp,
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Account created! Login with the same credentials",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
