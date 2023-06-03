import 'package:flutter/foundation.dart';

bool get isWeb => kIsWeb;

bool get isIOS =>
    (isWeb == false) ? defaultTargetPlatform == TargetPlatform.iOS : false;

/*
bool get isAndroid =>
    (isWeb == false) ? defaultTargetPlatform == TargetPlatform.android : false;
bool get isMacOS =>
    (isWeb == false) ? defaultTargetPlatform == TargetPlatform.macOS : false;
bool get isLinux =>
    (isWeb == false) ? defaultTargetPlatform == TargetPlatform.linux : false;
bool get isWindows =>
    (isWeb == false) ? defaultTargetPlatform == TargetPlatform.windows : false;
*/

