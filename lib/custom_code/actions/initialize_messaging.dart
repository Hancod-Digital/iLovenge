// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:i_l_o_v_enge/trip/home/home/home_widget.dart';

import 'package:i_l_o_v_enge/profile/notification/notification_widget.dart';

import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
  debugPrint(message.data.toString());
}

Future initializeMessaging() async {
  FirebaseMessaging.instance.requestPermission().then((settings) async {
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // After requesting permissions
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null) {
        debugPrint("APNS Token: $apnsToken");
        // Now you can try getting the FCM token, though it might not be strictly necessary
        // if you only needed the APNS token for some reason.
        // FCM's getToken() uses this APNS token to register with FCM.
      } else {
        debugPrint("Failed to get APNS token.");
        // Handle the case where APNS token is null.
        // This could happen if permissions are denied or on a simulator without proper setup.
      }
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        debugPrint("🚨 FCM Token: $fcmToken");
        FFAppState().fcmToken = fcmToken;
        // Send this token to your server
      } else {
        debugPrint("Failed to get FCM token.");
      }
    } else {
      FFAppState().fcmToken = "No token";
    }
  });

  // Initialize local notifications
  // await AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'alerts',
  //       channelName: 'Alerts',
  //       channelDescription: 'Notification tests as alerts',
  //       playSound: true,
  //       onlyAlertOnce: true,
  //       groupAlertBehavior: GroupAlertBehavior.Children,
  //       importance: NotificationImportance.High,
  //       defaultPrivacy: NotificationPrivacy.Private,
  //       defaultColor: Colors.deepPurple,
  //       ledColor: Colors.deepPurple,
  //     )
  //   ],
  //   debug: true,
  // );

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   (

  //     // await AwesomeNotifications().createNotification(
  //     //   content: NotificationContent(
  //     //     id: -1,
  //     //     channelKey: 'alerts',
  //     //     title: message.notification?.title ?? "No title",
  //     //     // body: message.notification?.body ?? "No body",
  //     //     payload: {'notificationId': '1234567890'},
  //     // ),
  //     actionButtons: [
  //       // NotificationActionButton(
  //       //   key: "DISMISS",
  //       //   label: "Dismiss",
  //       //   actionType: ActionType.DismissAction,
  //       //   isDangerousOption: true,
  //       // )
  //     ],
  //   );
  // });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    debugPrint('Message data: ${message.data}');
    debugPrint('Message notification: ${message.notification?.title}');
    debugPrint('Message notification body: ${message.notification?.body}');
  });

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    debugPrint("🚨 Message: $message");
    if (message != null) {
      navigateToPage(HomeWidget.routeName);
      navigateToPage(NotificationWidget.routeName);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    debugPrint("🚨 Message: $message");
    navigateToPage(HomeWidget.routeName);
    navigateToPage(NotificationWidget.routeName);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

// ✅ Function to safely navigate using navigatorKey
void navigateToPage(String routeName) {
  final navigator = navigatorKey.currentState;
  if (navigator != null) {
    navigator.pushNamed(routeName);
  } else {
    debugPrint("🚨 Error: Navigator is not ready yet!");
  }
}
