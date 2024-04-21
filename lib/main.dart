import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:homeservice/core/function/fcm_config.dart';
import 'package:homeservice/firebase_options.dart';
import 'package:homeservice/generated/l10n.dart';
import 'package:homeservice/view/screen/login.dart';
import 'package:homeservice/view/screen/onnordingscreen.dart';
import 'package:homeservice/view/screen/reservation_provider.dart';
import 'package:homeservice/view/screen/settings_app.dart';
import 'package:homeservice/view/screen/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/screen/Spalsh_screen.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

//   print("تم استلام رسالة في الخلفية: ${message.notification!.title}");
//   print("تم استلام رسالة في الخلفية: ${message.notification!.body}");
// }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var options = const FirebaseOptions(
//       apiKey: "AIzaSyBQ9en3utqEsK7ZjPieR76dfUe-vTxoTIU",
//       appId: "1:393024816861:android:42496ac66cc27be29c7d34",
//       messagingSenderId: "393024816861",
//       projectId: "home-services-5b47e");
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FirebaseMessaging.instance.subscribeToTopic("user");
//   firebaseMessagingBackgroundHandler();
//   requestPermissionNotification();

//   // FirebaseMessaging.instance.getToken().then((value) => print(value));
//   // FirebaseMessaging.onMessage.listen((message) {
//   //   log("_messaging onMessageOpenedApp: ${message.data}");
//   // });
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) => runApp(const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<String> getLocal() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("lang")!;
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getLocal(),
//       builder: (contxt, snapshot) => GetMaterialApp(
//         locale: const Locale('en'),
//         localizationsDelegates: const [
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: const [Locale('ar'), Locale('en')],
//         localeResolutionCallback: (deviceLang, supportLang) {
//           for (Locale locale in supportLang) {
//             if (deviceLang != null &&
//                 deviceLang.languageCode == locale.languageCode) {
//               return deviceLang;
//             }
//           }
//           return supportLang.first;
//         },
//         debugShowCheckedModeBanner: false,
//         initialRoute: "/welcome",
//         getPages: [
//           GetPage(
//             name: "/",
//             page: () => const SpalshScreen(),
//           ),
//           GetPage(name: "/login", page: () => const login()),
//           GetPage(name: '/onBording', page: () => const onBording()),
//           GetPage(name: '/welcome', page: () => const Welcome()),
//           GetPage(name: '/account', page: () => const Account()),
//           GetPage(
//               name: "/reservation", page: () => const reservation_provider())
//         ],
//       ),
//     );
//   }
// }

// class InitModel with ChangeNotifier {
//   String _locale = 'en';
//   String get locale => _locale;
//   SharedPreferences _preferences;

//   InitModel() {
//     _locale = 'en';
//     _getLanguage();
//   }

//   _getLanguage() async {
//     _preferences = await SharedPreferences.getInstance();
//     _locale = _preferences.getString('language') ?? 'en';
//     notifyListeners();
//   }

//   Future<void> changeLanguage(BuildContext context, String countryCode) async {
//     _locale = countryCode;
//     _preferences.setString("language", _locale);
//     notifyListeners();
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var options = const FirebaseOptions(
      apiKey: "AIzaSyBQ9en3utqEsK7ZjPieR76dfUe-vTxoTIU",
      appId: "1:393024816861:android:42496ac66cc27be29c7d34",
      messagingSenderId: "393024816861",
      projectId: "home-services-5b47e");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.subscribeToTopic("user");
  fcmconfig();
  requestPermissionNotification();

  // FirebaseMessaging.instance.getToken().then((value) => print(value));
  // FirebaseMessaging.onMessage.listen((message) {
  //   log("_messaging onMessageOpenedApp: ${message.data}");
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(await MyApp.create());
}

class MyApp extends StatelessWidget {
  const MyApp({this.lang = 'en', super.key});

  final String lang;

  static Future<MyApp> create() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String lang = prefs.getString("lang") ?? 'ar';
    return MyApp(lang: lang);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(lang),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      localeResolutionCallback: (deviceLang, supportLang) {
        for (Locale locale in supportLang) {
          if (deviceLang != null &&
              deviceLang.languageCode == locale.languageCode) {
            return deviceLang;
          }
        }
        return supportLang.first;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/welcome",
      getPages: [
        GetPage(
          name: "/",
          page: () => const SpalshScreen(),
        ),
        GetPage(name: "/login", page: () => const login()),
        GetPage(name: '/onBording', page: () => const onBording()),
        GetPage(name: '/welcome', page: () => const Welcome()),
        // GetPage(name: '/appointement', page: () => const Appointement()),
      ],
    );
  }
}
