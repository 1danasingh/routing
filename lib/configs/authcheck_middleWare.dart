import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing/configs/storage.dart';
import 'package:routing/pages/login_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AuthCheckMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final token = Storage.accessToken;
    log('token $token');
    if (token != null) {
      log('not null $route');
      return await super.redirectDelegate(route);
    } else {
      log('null');
      return GetNavConfig.fromRoute("/login");
    }

  }
}
class NoAuthCheckMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final token = Storage.accessToken;
    log('token $token');
    if (token != null) {
      log('not null $route');
      return GetNavConfig.fromRoute("/dashboard");
    } else {
      log('null');
      return await super.redirectDelegate(route);
    }

  }
}


