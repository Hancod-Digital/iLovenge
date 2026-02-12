import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../backend/supabase/supabase.dart';
import '../../flutter_flow/flutter_flow_util.dart';

Future<User?> googleSignInFunc() async {
  if (kIsWeb) {
    final success =
        await SupaFlow.client.auth.signInWithOAuth(OAuthProvider.google);
    return success ? SupaFlow.client.auth.currentUser : null;
  }

  final googleSignIn = GoogleSignIn(
    scopes: ['profile', 'email'],
    clientId: isAndroid
        ? null
        : '990183912321-95l9mdm7sorub32ckpann6sgutl0gf5h.apps.googleusercontent.com',
    serverClientId:
        '990183912321-b25mqtb3joclk1ktvket7jl9m7le7rff.apps.googleusercontent.com',
  );

  await googleSignIn.signOut().catchError((_) => null);
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  final authResponse = await SupaFlow.client.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
  return authResponse.user;
}
