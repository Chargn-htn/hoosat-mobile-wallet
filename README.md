# Hoosat Mobile - a non-custodial wallet for Hoosat blockDAG

## What is Hoosat Mobile?

Hoosat Mobile is a non-custodial wallet for Hoosat, available for Android and iOS. It is written in [Dart](https://dart.dev) using [Flutter](https://flutter.dev).

> **Status: pre-release.** This wallet is being reviewed and tested and is not on any app store yet. Please do not use it with more than you can afford to lose. Found a security problem? Please report it privately: see [SECURITY.md](./SECURITY.md).

| Link                           | Description                        |
| :----------------------------- | :--------------------------------- |
| [hoosat.fi](https://hoosat.fi) | Hoosat Network Blockchain Homepage |

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
