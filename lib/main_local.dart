import 'package:kitchen_sync/init_main.dart';

Future<void> main() async {
  await initializeApp(envFileName: '.env.local');
}
