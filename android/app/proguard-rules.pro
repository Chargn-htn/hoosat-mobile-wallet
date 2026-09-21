# Flutter embedding and plugins.
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Referenced by the engine when deferred components are not used.
-dontwarn com.google.android.play.core.**

# App entry point and the NFC / app-link method channel.
-keep class fi.hoosat_mobile.hoosatwallet.** { *; }
