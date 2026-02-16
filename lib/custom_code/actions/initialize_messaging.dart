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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Singletons for local notification handling
final FlutterLocalNotificationsPlugin _localNotifications =
    FlutterLocalNotificationsPlugin();
final AndroidNotificationChannel _androidChannel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'Used for important FCM notifications.',
  importance: Importance.high,
);

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
  debugPrint(message.data.toString());
}

Future initializeMessaging() async {
  // Ensure notifications can surface while app is in foreground (iOS/macOS).
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // Init local notifications (needed for Android heads-up + tap handling)
  const AndroidInitializationSettings androidInit =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosInit = DarwinInitializationSettings();
  const InitializationSettings initSettings = InitializationSettings(
    android: androidInit,
    iOS: iosInit,
  );
  await _localNotifications.initialize(initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _onNotificationTap);
  await _ensureAndroidChannel();

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

    // Show a local notification for foreground messages on Android
    if (message.notification != null) {
      await _showLocalNotification(message);
    }

    // Also show in-app banner if context is available (nice UX on iOS too)
    final context = navigatorKey.currentState?.overlay?.context;
    final notification = message.notification;
    if (context != null && notification != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${notification.title ?? 'New notification'}\n${notification.body ?? ''}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
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
    _handleMessageNavigation(message);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _ensureAndroidChannel() async {
  await _localNotifications
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(_androidChannel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
}

Future<void> _showLocalNotification(RemoteMessage message) async {
  final notification = message.notification;
  final android = message.notification?.android;

  final details = NotificationDetails(
    android: AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      icon: android?.smallIcon ?? '@mipmap/ic_launcher',
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: const DarwinNotificationDetails(),
  );

  await _localNotifications.show(
    notification.hashCode,
    notification?.title,
    notification?.body,
    details,
    payload: message.data['route'] ?? '',
  );
}

void _handleMessageNavigation(RemoteMessage message) {
  // Prefer deep-link target passed in data, fallback to Notifications page
  final route = message.data['route'] as String?;
  if (route != null && route.isNotEmpty) {
    navigateToPage(route);
    return;
  }
  navigateToPage(NotificationWidget.routeName);
}

@pragma('vm:entry-point')
void _onNotificationTap(NotificationResponse response) {
  final payload = response.payload;
  debugPrint('Notification tap payload: $payload');
  if (payload != null && payload.isNotEmpty) {
    navigateToPage(payload);
  } else {
    navigateToPage(NotificationWidget.routeName);
  }
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
