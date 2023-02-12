import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future initialize() async {
  const storage = FlutterSecureStorage();
  WidgetsFlutterBinding.ensureInitialized();
}
