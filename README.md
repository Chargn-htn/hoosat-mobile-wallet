# Hoosat Mobile - a non-custodial wallet for Hoosat blockDAG

## What is Hoosat Mobile?

Hoosat Mobile is a non-custodial wallet for Hoosat, available for Android and iOS. It is written in [Dart](https://dart.dev) using [Flutter](https://flutter.dev).

> **Status: pre-release, Android sideload only.** This wallet is not on Google Play or the App Store and there is no plan to publish it there for now. It is released here, on GitHub, as a downloadable APK. **Use it at your own risk** - it has not been independently audited, only reviewed and tested by the maintainer and GitHub PR reviewers (see [SECURITY.md](./SECURITY.md) to report a problem privately, and the Known limitations in each [release](https://github.com/Chargn-htn/hoosat-mobile-wallet/releases)). Start with a small amount, and keep your recovery phrase written down on paper, offline.

| Link                           | Description                        |
| :----------------------------- | :--------------------------------- |
| [hoosat.fi](https://hoosat.fi) | Hoosat Network Blockchain Homepage |

## Download (Android)

1. Go to [Releases](https://github.com/Chargn-htn/hoosat-mobile-wallet/releases) and download the latest `hoosat-mobile-wallet-*.apk`.
2. Check its SHA-256 checksum matches the value printed on the release page (on a PC: `sha256sum hoosat-mobile-wallet-*.apk`, or any SHA-256 checksum app on the phone itself).
3. Open the downloaded file. Android will ask to allow installs from this source for your browser/file manager - allow it only for this install, then install.
4. There is no auto-update. Check the Releases page for new versions and repeat these steps; your wallet and funds are not affected by updating.

There is no iOS build right now. Only install APKs from this repository's own Releases page - never from a link someone sends you, even if it looks identical.

## Contributing

- Fork the repository and clone it to your local machine
- Follow the instructions [here](https://flutter.io/docs/get-started/install) to install the Flutter SDK
- Setup [Android Studio](https://flutter.io/docs/development/tools/android-studio) or [Visual Studio Code](https://flutter.io/docs/development/tools/vs-code).

## Building

Android:

```bash
flutter build apk
```

iOS:

```bash
flutter build ios
```

If you have a connected device or emulator you can run the app right from your development machine.

Debug mode:

```bash
flutter run
```

Release mode:

```bash
flutter run --release
```

## Translations

For some details regarding translations, have a look at [Translations and translators](./TRANSLATORS.md).

## Have a question?

If you need any help, feel free to [file a feature request or an issue](https://github.com/Chargn-htn/hoosat-mobile-wallet/issues/new/choose) if you do not manage to find a solution.

## License

Hoosat Mobile is released under the MIT License (see [LICENSE](./LICENSE)).

## Credits

- Hoosat Mobile Wallet is a fork of Hoosat Mobile (© 2024 Hoosat Oy), which builds on Kaspium Wallet (© 2021 Kaspium Wallet authors).
- Fonts: Inter, Comfortaa, Nunito Sans and Overpass Mono are used under the SIL Open Font License 1.1; Roboto Mono under the Apache License 2.0. The licence texts are in the [fonts](./fonts) folder.
- The icon font `AppIcons.ttf` came with the original code. Its origin and licence are still being checked.
