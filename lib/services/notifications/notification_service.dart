// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:demo_firebase/const/constants.dart';
import 'package:demo_firebase/ui/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'default_notification_channel_id',
  'Default',
  description: 'High Importance Description', // title5
  importance: Importance.max,
  playSound: true,
);

class NotificationService {
  NotificationService._();
  // static final FirebaseMessaging _instance = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initService() async {
    await Firebase.initializeApp();
    await requestPermission();
  }

  onTokenRefresh() async {
    FirebaseMessaging instance = FirebaseMessaging.instance;
    instance.onTokenRefresh.listen((event) {
      // Konstant.tokenFCM = event;
    });
  }

  static Future<void> requestPermission() async {
    FirebaseMessaging instance = FirebaseMessaging.instance;
    await instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    NotificationSettings settings = await instance.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      await instance.requestPermission(
        provisional: true,
      );
    }
    bool isSupported = await instance.isSupported();
    log("isSupported : $isSupported");
    if (isSupported) {
      instance.getToken().then(
        (String? token) {
          assert(token != null);
          log("FCM Token: $token");
          debugPrint("$token");

          ///StringConstants.fcmToken = token ?? "";
        },
      );
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettingsIOS = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: _onSelectNotification,
          onDidReceiveBackgroundNotificationResponse: _onSelectNotification);

      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);

      FirebaseMessaging.onMessage.listen(_onMessageHandle);
      FirebaseMessaging.onBackgroundMessage(_onForegroundNotification);
      FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedAppHandle);
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        debugPrint("$fcmToken -- Refresh Token");
      });

      FirebaseMessaging.instance.getInitialMessage().then((message) async {
        print("getInitialMessage :$message");
        if (message != null) {
          print(message.data);

          final typeMap = {
            ///  Routes.PROFILE: () => Get.toNamed(Routes.PROFILE),
            // Routes.CONVERSATION: () => Get.toNamed(Routes.CONVERSATION, arguments: int.parse(message.data['id'])),
            // Routes.CURRENT_BOOKING: () => Get.toNamed(Routes.CURRENT_BOOKING, arguments: int.parse(message.data['id'])),
          };

          final type = message.data['type'];

          if (type != null && typeMap.containsKey(type)) {
            typeMap[type]!();
          }
        }
      });
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  static void _onMessageHandle(RemoteMessage message) async {
    // if (message.data['id'] == Konstant.currentConversationId && message.data['type'] == Routes.CONVERSATION) {
    //   return;
    // }

    RemoteNotification? notification = message.notification;

    if (notification != null) {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        _channel.id,
        _channel.name,
        channelDescription: _channel.description,
        playSound: true,
        styleInformation: const DefaultStyleInformation(true, true),
        icon: '@mipmap/ic_launcher',
        largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        channelShowBadge: true,
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
        onlyAlertOnce: true,
        visibility: NotificationVisibility.public,
        showWhen: false,
        enableVibration: true,
        vibrationPattern: Int64List.fromList([0, 1000, 500, 1000]),
      );

      String payload = jsonEncode(message.data);

      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: androidNotificationDetails,
          iOS: const DarwinNotificationDetails(),
        ),
        payload: payload,
      );
    }
  }

  static Future<void> _onForegroundNotification(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Foreground Message  : ${message.data}");

    final typeMap = {
      /// Routes.PROFILE: () => Get.toNamed(Routes.PROFILE),
    };

    /// Routes.PROFILE: () => Get.toNamed(Routes.PROFILE),
    var data = message.data['type'];
    if (data != null) {
      Navigator.push(context as BuildContext,
          MaterialPageRoute(builder: (context) => const Home()));
      // Routes.PROFILE: () => Get.toNamed(Routes.PROFILE);//==  your navigator method to Chat room class
    } else {
      // gotoNotifications();   //==  your navigator method for Notification class
      Navigator.push(context as BuildContext,
          MaterialPageRoute(builder: (context) => const Home()));
    }

    final type = message.data['type'];

    if (type != null && typeMap.containsKey(type)) {
      typeMap[type]!();
    }
  }

  static Future<dynamic> _onSelectNotification(
      NotificationResponse details) async {
    try {
      Map<String, dynamic> payloadMap = jsonDecode(details.payload!);

      final typeMap = {
        ///  Routes.PROFILE: () => Get.toNamed(Routes.PROFILE),
      };

      final type = payloadMap['type'];

      if (type != null && typeMap.containsKey(type)) {
        typeMap[type]!();
      }
    } catch (e) {
      print('Notification payload exception : $e');
    }
    return;
  }

  static _onMessageOpenedAppHandle(RemoteMessage? message) {
    print("Message Opened App : ${message?.data}");

    Constants.one = "HOME";

    debugPrint("FROM NOTIFICATIONS PAGE : ${Constants.one}");
    final typeMap = {
      ///  Routes.PROFILE: () => Get.toNamed(Routes.PROFILE),
    };

    final type = message?.data['type'];

    if (type != null && typeMap.containsKey(type)) {
      typeMap[type]!();
      log("type");
    }
  }
}
