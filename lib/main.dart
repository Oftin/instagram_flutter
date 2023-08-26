import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
// import 'package:instagram_flutter/screens/signup_screen.dart';
// import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
// import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
// import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/utils/colors.dart';

void main() async {
  await dotenv.load(fileName: 'lib/.env');
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY'].toString(),
        // authDomain: dotenv.env['AUTH_DOMAIN'].toString(),
        projectId: dotenv.env['PROJECT_ID'].toString(),
        storageBucket: dotenv.env['STORAGE_BUCKET'].toString(),
        messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'].toString(),
        appId: dotenv.env['APP_ID'].toString(),
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayoutScreen(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const LoginScreen(),
    );
  }
}
