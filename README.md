# Project Alek

App for allocating resources when there is limited supply. Written in Flutter with a Firebase backend. 

## Requirements

You can choose whatever IDE you'd like, but we'd recommend Android Studio. Some plugins (not used here) may require a [Jetbrains account](https://www.jetbrains.com/). You can download AS [here](https://developer.android.com/studio).

After cloning the project, open `team-justice-in-alloc` in Android Studio. It should install 
virtual phones for you. If you don't have Flutter and Dart plugins already, you can add those by
going to `File > Settings > Plugins and adding Flutter`. It will automatically add Dart at this point.

_note - this does not install the SDK's for the corresponding software. Here are some links to help you get that. You will also need the latest version of Java installed._
[FLutter SDK](https://flutter.dev/docs/get-started/install/windows)
[Java](https://java.com/en/download/)
_You also don't explicitly need to install Dart SDK as that comes with the new Flutter SDK, but it's included [here](https://dart.dev/get-dart) just in case._

For a missing AVD (Android Virtual Device) install, check [here](https://abhiandroid.com/androidstudio/create-avd-virtual-device-emulator-android-studio).

If you are running an AMD CPU, your virtualization may be turned OFF by default. 
To turn it on, check [here](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/virtualization/sect-virtualization-troubleshooting-enabling_intel_vt_and_amd_v_virtualization_hardware_extensions_in_bios).

Once all the plugins are installed and you have an AVD setup, you should be able to build the project. 

If you run into where Android License Status is Unknown. Here's a [solution](https://stackoverflow.com/questions/49758849/flutter-io-android-license-status-unknown) that worked for me

## Getting started
_The Magic CLI words to get you started._

Check to make sure you have everything: `flutter doctor`

Your basic 'get' (imagine npm install): `flutter pub get`

Your basic 'run' (imagine npm serve): `flutter run`

Run on chrome: `flutter run -d chrome`

## Connecting to the API

## Staging deployment

## Production deployment

## Flutter resources and documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
