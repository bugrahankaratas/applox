import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app.dart';

final container = ProviderContainer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(UncontrolledProviderScope(
    container: container,
    child: const App(),
  ));
}
