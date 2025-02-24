import 'dart:async';

import 'package:demo_firebase/const/constants.dart';
import 'package:demo_firebase/services/notifications/firebase_options.dart';
import 'package:demo_firebase/services/notifications/notification_service.dart';
import 'package:demo_firebase/ui/bloc/splash/ui/splash.dart';
import 'package:demo_firebase/ui/bloc_exam/home/bloc/home_bloc.dart';
import 'package:demo_firebase/ui/bloc_exam/home/ui/home_view.dart';
import 'package:demo_firebase/ui/bloc_exam/home/ui/qr_code.dart';
import 'package:demo_firebase/ui/home/home.dart';
import 'package:demo_firebase/ui/google_translate/test.dart';
import 'package:demo_firebase/ui/location_picker/location_picker.dart';
import 'package:demo_firebase/ui/map_location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:translator/translator.dart';

void main() async {
  /// ==========================================================================
  /// +++++++++++++++++++++++++++ FOR FIREBASE +++++++++++++++++++++++++++++++++
  /// ==========================================================================

  /// WidgetsFlutterBinding.ensureInitialized();
  /// initialiseServices();
  /// runApp(const DemoFirebase());

  /// ++++++++++++++++++++++++++++++++ END +++++++++++++++++++++++++++++++++++++

  /// ==========================================================================
  /// +++++++++++++++++++++++ FOR GOOGLE TRANSLATE +++++++++++++++++++++++++++++
  /// ==========================================================================

  /// translateText();
  /// runApp(const MaterialApp(home: TestOne()));

  /// ++++++++++++++++++++++++++++++++ END +++++++++++++++++++++++++++++++++++++

  /// ==========================================================================
  /// +++++++++++++++++++++++++++++ FOR BLOC +++++++++++++++++++++++++++++++++++
  /// ==========================================================================

  /// MAP
  // runApp(
  //   const GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: MyMapView(),
  //   ),
  // );

  /// BLOC With Bloc Provider

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeView(),
      ),
    ),
  );

  // runApp(
  //   const GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Home(),
  //   ),
  // );

  /// ++++++++++++++++++++++++++++++++ END +++++++++++++++++++++++++++++++++++++
}

class APPMY extends StatefulWidget {
  const APPMY({super.key});

  @override
  State<APPMY> createState() => _APPMYState();
}

class _APPMYState extends State<APPMY> with WidgetsBindingObserver {
  StreamSubscription<Object?>? _subscription;
  final MobileScannerController controller = MobileScannerController(
      // required options for the scanner
      );

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    _subscription = controller.barcodes.listen((v) {
      print(v.toString());
    });

    // Finally, start the scanner itself.
    unawaited(controller.start());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: MobileScanner(
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {}
          },
        ),
      ),
    );
  }
}

/// +++++++++++++++++++++++++++ FOR FIREBASE +++++++++++++++++++++++++++++++++++

initialiseServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initService();
}

/// ++++++++++++++++++++++++++++++++ END +++++++++++++++++++++++++++++++++++++++

/// +++++++++++++++++++++++ FOR GOOGLE TRANSLATE +++++++++++++++++++++++++++++++

translateText() async {
  final translator = GoogleTranslator();
  const input = "Здравствуйте. Ты в порядке?";

  translator.translate(input, to: 'en').then((result) {
    if (kDebugMode) {
      print("Source: $input\nTranslated: $result");
    }
  });

  /// Passing the translation to a variable
  var translation = await translator
      .translate("I would buy a car, if I had money.", from: 'en', to: 'it');

  /// You can also call the extension method directly on the input
  if (kDebugMode) {
    print('Translated: ${await input.translate(to: 'en')}');
  }

  if (kDebugMode) {
    print("translation: $translation");
  }
}

// /// +++++++++++++++++++++++++++++++ END ++++++++++++++++++++++++++++++++++++++++

// import 'package:demo_firebase/ui/webview/web.dart';
// import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home:  const CarDashBoardWebView(webUrl: 'https://www.dhodaalo.in/laundry_app/dashboard.php',),
//       // home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String _code = "";
//   String signature = "{{ app signature }}";
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     SmsAutoFill().unregisterListener();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const PhoneFieldHint(),
//               const Spacer(),
//               PinFieldAutoFill(
//                 decoration: UnderlineDecoration(
//                   textStyle: const TextStyle(fontSize: 20, color: Colors.black),
//                   colorBuilder:
//                       FixedColorBuilder(Colors.black.withOpacity(0.3)),
//                 ),
//                 currentCode: _code,
//                 onCodeSubmitted: (code) {},
//                 onCodeChanged: (code) {
//                   if (code!.length == 6) {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   }
//                 },
//               ),
//               const Spacer(),
//               TextFieldPinAutoFill(
//                 currentCode: _code,
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 child: const Text('Listen for sms code'),
//                 onPressed: () async {
//                   await SmsAutoFill().listenForCode();
//                 },
//               ),
//               ElevatedButton(
//                 child: const Text('Set code to 123456'),
//                 onPressed: () async {
//                   setState(() {
//                     _code = '123456';
//                   });
//                 },
//               ),
//               const SizedBox(height: 8.0),
//               const Divider(height: 1.0),
//               const SizedBox(height: 4.0),
//               Text("App Signature : $signature"),
//               const SizedBox(height: 4.0),
//               ElevatedButton(
//                 child: const Text('Get app signature'),
//                 onPressed: () async {
//                   signature = await SmsAutoFill().getAppSignature;
//
//                   /// signature = "AIOe4TVDpqm-ZOMATO";
//                   setState(() {});
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => const CodeAutoFillTestPage(),
//                     ),
//                   );
//                 },
//                 child: const Text("Test CodeAutoFill mixin"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CodeAutoFillTestPage extends StatefulWidget {
//   const CodeAutoFillTestPage({Key? key}) : super(key: key);
//
//   @override
//   State<CodeAutoFillTestPage> createState() => _CodeAutoFillTestPageState();
// }
//
// class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
//     with CodeAutoFill {
//   String? appSignature;
//   String? otpCode;
//
//   @override
//   void codeUpdated() {
//     setState(() {
//       otpCode = code!;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     listenForCode();
//
//     SmsAutoFill().getAppSignature.then((signature) {
//       setState(() {
//         appSignature = signature;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const textStyle = TextStyle(fontSize: 18);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Listening for code"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
//             child: Text(
//               "This is the current app signature: $appSignature",
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Builder(
//               builder: (_) {
//                 if (otpCode == null) {
//                   return const Text("Listening for code...", style: textStyle);
//                 }
//                 return Text("Code Received: $otpCode", style: textStyle);
//               },
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
