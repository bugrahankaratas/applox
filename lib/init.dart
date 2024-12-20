import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'app/controllers/connection/connection_controller.dart';

final class Init {
  static Future<void> init({ProviderContainer? container}) async {
    WidgetsFlutterBinding.ensureInitialized();
    await initConnectionController(container);
  }

  static Future<void> initConnectionController(
      ProviderContainer? container) async {
    container?.read(connectionControllerProvider.notifier).init();
  }
}
