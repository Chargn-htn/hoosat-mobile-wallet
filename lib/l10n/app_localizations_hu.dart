// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get account => 'Fiók';

  @override
  String get accounts => 'Fiókok';

  @override
  String get ackBackedUp => 'Biztos, hogy elmentetted a Seed Phrase-t?';

  @override
  String get add => 'Hozzáadás';

  @override
  String get addAccount => 'Fiók hozzáadása';

  @override
  String get addContact => 'Cím felvétele';

  @override
  String get addNode => 'Csomópont hozzáadása';

  @override
  String get addNodeFailed => 'Hoosat csomópont hozzáadása sikertelen';

  @override
  String addNodeFailedMessage(String error) {
    return 'Hiba: $error';
  }

  @override
  String get addNodeSuccess => 'Csomópont sikeresen hozzáadva';

  @override
  String get addingNodeMessage =>
      'Kérlek várj, kapcsolatfelvétel a csomóponttal... ';

  @override
  String get addingNodeTitle => 'Csomópont hozzáadása';

  @override
  String get address => 'Cím';

  @override
  String get addressCopied => 'Cím másolva';

  @override
  String get addressCopiedFailed => 'A cím másolása sikertelen';

  @override
  String get addressHint => 'Cím megadása';

  @override
  String get addressMising => 'Adj meg egy Hoosat címet';

  @override
  String get addressShare => 'Cím megosztása';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Haladó';

  @override
  String get amount => 'Összeg';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Összeg $amount $coin';
  }

  @override
  String get amountMissing => 'Adj meg egy összeget';

  @override
  String get amountZero => 'Az összeg nem lehet nulla';

  @override
  String get areYouSure => 'Biztos?';

  @override
  String get authBiometricMessage => 'Hitelesítés tárca hozzáadásához';

  @override
  String get authMethod => 'Hitelesítési módszer';

  @override
  String get authPinMessage => 'PIN megadás tárca hozzáadáshoz';

  @override
  String get autoLockHeader => 'Automatikus zárolás';

  @override
  String get available => 'Egyenleg';

  @override
  String get back => 'Back';

  @override
  String get backupConfirmButton => 'Mentés kész!';

  @override
  String get backupSecretPhrase => 'Seed Phrase mentése';

  @override
  String get missingSecretPhrase => 'Missing Secret Phrase';

  @override
  String get biometricsMethod => 'Biometrikus';

  @override
  String get blockExplorer => 'Blokk megjelenítő kiválasztása';

  @override
  String get cancel => 'Mégse';

  @override
  String get change => 'Cserélt';

  @override
  String get changeAddress => 'Cserélt cím';

  @override
  String get changeAddressCopied => 'Cserélt cím kimásolva';

  @override
  String get changeIndex => 'Cserélt Index';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Cserélt $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Ellenőrizd a kamera engedélyeit';

  @override
  String get clipboardEmpty => 'Nincs mit beilleszteni';

  @override
  String get close => 'Bezárás';

  @override
  String get confirm => 'Megerősít';

  @override
  String get confirmPasswordHint => 'Jelszó megerősítése';

  @override
  String confirmations(String confirmations) {
    return '$confirmations megerősítés';
  }

  @override
  String get confirmed => 'megerősített';

  @override
  String get confirming => 'megerősítve';

  @override
  String contactAdded(String contactName) {
    return '$contactName hozzá lett adva a címjegyzékhez!';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address cím kimásolva';
  }

  @override
  String get contactExists => 'Ez a cím már szerepel a listán!';

  @override
  String get contactHeader => 'Cím';

  @override
  String get contactInvalid => 'Helytelen cím elnevezés';

  @override
  String get contactNameHint => 'Írj be egy nevet @';

  @override
  String get contactNameMissing => 'Nincsenek exportálható címek';

  @override
  String contactRemoved(String contactName) {
    return 'Törlöd $contactName-t a címjegyzékből?';
  }

  @override
  String get contactsHeader => 'Címjegyzék';

  @override
  String get contactsImportErr => 'Sikertelen cím importálás';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Sikeresen importáltál $noContacts címet';
  }

  @override
  String get copied => 'Másolva';

  @override
  String get copy => 'Másol';

  @override
  String get copyAddress => 'Cím másolása';

  @override
  String get copyErrorButton => 'Másolási hiba';

  @override
  String get createAPasswordHeader => 'Jelszó létrehozása';

  @override
  String get createPasswordFirstParagraph =>
      'Megadhatsz egy jelszót, amivel Hoosat Mobile tárcád megnyitását védheted. A biztonság mértéke a jelszó erősségétől függ.';

  @override
  String get createPasswordHint => 'Írd be a jelszót';

  @override
  String get createPasswordSecondParagraph =>
      'A jelszó nem kötelező, a tárcához való hozzáférés PIN kód használatával, vagy biometrikus azonosítással biztosítható.';

  @override
  String get createPasswordSheetHeader => 'Jelszó beállítás';

  @override
  String get currency => 'Pénznem';

  @override
  String get currencyPoweredBy => 'CoinGecko adatait használva';

  @override
  String get defaultAccountName => 'Cím 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Saját cím $addressIndex';
  }

  @override
  String get defaultWalletName => 'Tárcám';

  @override
  String get disablePasswordSheetHeader => 'Kikapcsolás';

  @override
  String get disablePasswordSuccess => 'Jelszókérés letiltva';

  @override
  String get disableWalletPassword => 'Jelszókérés tiltása';

  @override
  String get doContinue => 'Tovább';

  @override
  String get donate => 'Adományozás';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Ne mutasd újra';

  @override
  String get emptyCardIntroUtxos =>
      'Itt találod majd a tárcába érkezett utalások maradékait.';

  @override
  String get emptyResult => 'Nincs találat';

  @override
  String get emptyWalletName => 'Adnod kell egy nevet a tárcának!';

  @override
  String get encryptionFailedError => 'Jelszó beállítása sikertelen';

  @override
  String get enterAddress => 'Küldés erre a címre';

  @override
  String get enterAmount => 'Küldött mennyiség';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Megjegyzés';

  @override
  String get enterPasswordHint => 'Írd be a jelszót';

  @override
  String get errorMessageCopied => 'Hibaüzenet a vágólapra másolva';

  @override
  String get exampleCardIntro =>
      'Itt találod majd a tárcához tartozó tranzakciókat.';

  @override
  String get export => 'Export';

  @override
  String get fee => 'Hálózati díj';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Díj $amount $coin';
  }

  @override
  String get feeTitle => 'DÍJ';

  @override
  String get fetchingTransactions => 'Tranzakciók lekérése';

  @override
  String get fingerprintSeedBackup =>
      'Erősítsd meg, hogy szeretnéd elmenteni a Seed Phrase-t.';

  @override
  String get goBackButton => 'Vissza';

  @override
  String get gotItButton => 'Rendben';

  @override
  String get import => 'Import';

  @override
  String get importSecretPhrase => 'Seed Phrase importálása';

  @override
  String get importSecretPhraseHint => 'Írd be a 24 szóból álló Seed Phrase-t.';

  @override
  String get importSecretPhraseHintCombo =>
      'Add meg a 12, vagy 24 szóból álló Seed Phrase-t.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Add meg a 12 szóból álló Seed Phrase-t.';

  @override
  String get importWallet => 'HTN tárca importálása';

  @override
  String get importWalletDescription => 'Válassz az alábbi lehetőségek közül.';

  @override
  String get instantly => 'Azonnal';

  @override
  String get insufficientBalance => 'Fedezethiány';

  @override
  String get insufficientBalanceDetails => 'Nincs elegendő HTN a tranzakcióhoz';

  @override
  String get invalidAddress => 'A megadott cím érvénytelen';

  @override
  String get invalidAmount => 'Érvénytelen összeg';

  @override
  String get invalidChecksumMessage =>
      'Ellenőrizd a Seed Phrase-t,\nhogy helyesen legyen megadva!';

  @override
  String get invalidKpubMessage =>
      'Ellenőrizd, hogy a kibővített nyilvános kulcs helyesen van-e megadva!';

  @override
  String get invalidDestinationAddress => 'Érvénytelen a megadott cím';

  @override
  String get invalidPassword => 'Helytelen jelszó';

  @override
  String get hoosatDevFund => 'Hoosat fejlesztői alap';

  @override
  String get hoosatMobile => 'Hoosat Mobile tárca';

  @override
  String get language => 'Nyelv';

  @override
  String get loadingTransactions => 'Tranzakciók betöltése...';

  @override
  String get lockAppSetting => 'Megnyitás hitelesítéssel';

  @override
  String get locked => 'Lezárva';

  @override
  String get loggingOutMessage => 'Kijelentkezés...';

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get logoutDialogContent =>
      'Szeretnél kijelentkezni ebből a HTN tárcából?';

  @override
  String get logoutOrSwitchWallet => 'Ki-, vagy átjelentkezés';

  @override
  String get manage => 'Kezelés';

  @override
  String get manualEntry => 'Kézi bevitel';

  @override
  String get networkHeader => 'Hálózat';

  @override
  String get newAddress => 'Új cím';

  @override
  String get newWallet => 'Új tárca';

  @override
  String get nextButton => 'Tovább';

  @override
  String get no => 'Nem';

  @override
  String get noContactsExport => 'Nincsenek exportálható címek';

  @override
  String get noContactsImport => 'Nincsenek importálható címek';

  @override
  String get noQrCodeFound => 'Nem található QR-kód';

  @override
  String get noSkipButton => 'Nem, kihagyom';

  @override
  String get noUppercase => 'NEM';

  @override
  String get nodeAddress => 'Hoosat csomópont';

  @override
  String get nodeDeleteMessage => 'Biztos, hogy TÖRÖLNI akarod?';

  @override
  String get nodeDeleteTitle => 'Törlöd a Hoosat csomópont beállítását?';

  @override
  String get nodeNameEmpty => 'Adj nevet a csomópontnak!';

  @override
  String get nodeNameHint => 'Csomópont neve';

  @override
  String get nodeUrlHint => 'Csomópont URL';

  @override
  String get nodeUrlInvalid => 'Helytelen csomópont URL';

  @override
  String get nodesSheetTitle => 'Hoosat csomópontok';

  @override
  String get off => 'Ki';

  @override
  String get on => 'Be';

  @override
  String get paperWallet => 'Papír tárca';

  @override
  String get passwordBlank => 'Adj meg egy jelszót!';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Kikapcsolás után nincs szükség jelszó megadásra a pénztárca megnyitásához.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Ezzel a jelszóval tudod majd a tárcát megnyitni.';

  @override
  String get passwordsDontMatch => 'A jelszavak nem egyeznek';

  @override
  String get pasteMnemonicError =>
      'A vágólap nem tartalmaz érvényes Seed Phrase-t.';

  @override
  String get pending => 'függőben';

  @override
  String get pinConfirmError => 'A PIN-kódok nem egyeznek';

  @override
  String get pinConfirmTitle => 'Erősítsd meg a PIN-kódod';

  @override
  String get pinCreateTitle => 'Hozz létre egy 6 számjegyű PIN-kódot';

  @override
  String get pinEnterTitle => 'Írd be a PIN-kódot';

  @override
  String get pinInvalid => 'Helytelen PIN-kód';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'a Seed Phrase megjelenítéséhez.';

  @override
  String get preferences => 'Beállítások';

  @override
  String get privacyPolicy => 'Adatvédelmi Szabályzat';

  @override
  String get qrInvalidAddress => 'A QR-kód nem tartalmaz érvényes címet';

  @override
  String get qrInvalidSeed =>
      'A QR-kód nem tartalmaz érvényes Seed Phrase-t, vagy privát kulcsot';

  @override
  String get qrMnemonicError =>
      'A QR-kód nem tartalmaz érvényes Seed Phrase-t.';

  @override
  String get receive => 'Saját cím';

  @override
  String get receiveAddress => 'Saját cím';

  @override
  String get receiveAddressCopied => 'Saját cím kimásolva';

  @override
  String get receiveIndex => 'Saját Index';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Saját cím $addressIndex';
  }

  @override
  String get received => 'Fogadott';

  @override
  String get removeContact => 'Cím törlése';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Biztos, hogy $contactName-t törölni szeretnéd?';
  }

  @override
  String get removeWalletAction => 'Tárca eltávolítása';

  @override
  String get removeWalletBiometricsMessage =>
      'Hitelesítés a tárca eltávolításához';

  @override
  String get removeWalletDetail =>
      'A Hoosat Mobile tárca eltávolításával eltávolítod a Seed Phrase-t és a tárcával kapcsolatos összes adatot erről az eszközről. Amennyiben a Seed Phrase-ről NEM készült másolat, SOHA többé nem fogsz hozzáférni a tárcádhoz.';

  @override
  String get removeWalletPinMessage => 'PIN megadása a tárca eltávolításához';

  @override
  String get removeWalletReassurance =>
      'Amennyiben elmentetted a Seed Phrase-t, akkor nincs miért aggódnod, mert annak a használatával, bármikor vissza tudsz lépni a tárcádba. ';

  @override
  String get requireAPasswordToOpenHeader =>
      'Szeretnél jelszót használni a megnyitáshoz?    ';

  @override
  String get restartSetupButton => 'Beállítás újraindítása';

  @override
  String get scanQrCode => 'QR-kód beolvasás';

  @override
  String get scanQrCodeError => 'Nem sikerült a QR-kód elemzése';

  @override
  String get scanFromImage => 'Scan from image';

  @override
  String get toggleFlash => 'Toggle flashlight';

  @override
  String get riskDisclosureHeader => 'Before You Begin';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet is non-custodial. Your recovery phrase and private keys are generated and stored only on this device -- we never see them, never store them on any server, and cannot recover them for you.';

  @override
  String get riskDisclosureWarning =>
      'If you lose your recovery phrase, there is no password reset and no support team that can get your funds back. You are solely responsible for keeping it safe.';

  @override
  String get riskDisclosureAccept => 'I Understand, Continue';

  @override
  String get secretInfo =>
      'A következő képernyőn látni fogod a Seed Phrase-t. Ez a 24 szó az, amivel mindig el fogod tudni érni a tárcád. NAGYON fontos, hogy  másolatot készíts róla -ÍRD LE- és soha ne oszd meg senkivel.  ';

  @override
  String get secretInfoHeader => 'Első a biztonság!';

  @override
  String get secretPhrase => 'Seed Phrase';

  @override
  String get verifyBackupTitle => 'Verify Your Backup';

  @override
  String get verifyBackupInstruction =>
      'Select the correct word for each position to confirm you\'ve saved your secret phrase.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'What is word #$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'That\'s not quite right. Check your backup and try again.';

  @override
  String get secretPhrase12Words => '12 WORDS';

  @override
  String get secretPhrase24Words => '24 WORDS';

  @override
  String get secretWarning =>
      'Ha elveszted ezt az eszközt, vagy eltávolítod az alkalmazást, szükség lesz a Seed Phrase-re a Hoosat Mobile tárcád ismételt eléréséhez. ';

  @override
  String get securityHeader => 'Biztonság';

  @override
  String get securitySettingsBiometrics =>
      'Authenticate to Access Security Settings';

  @override
  String get securitySettingsPin => 'Enter PIN to Access Security Settings';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Sign Message';

  @override
  String get signMessageCopySignature => 'Copy Signature';

  @override
  String get signMessageDescription =>
      'Sign a message with one of your wallet addresses';

  @override
  String get signMessageHint => 'Enter a message to sign';

  @override
  String get signMessageSignatureCopied => 'Signature Copied';

  @override
  String get signMessageSigned => 'Message Signed';

  @override
  String get signMessageTooLong => 'Message is too long';

  @override
  String get seedInvalid => 'Helytelen Seed Phrase';

  @override
  String get nodeUnreachable =>
      'Can\'t reach your node. Balances may be out of date.';

  @override
  String get nodeUnreachableRetry => 'Retry';

  @override
  String get send => 'Küldés';

  @override
  String get sendConfirm => 'Küldök';

  @override
  String get sendError => 'Hiba történt. Próbálkozz később.';

  @override
  String get sendNote => 'JEGYZET';

  @override
  String get sendToAddressTitle => 'erre a címre';

  @override
  String get sendTxProgressDescription =>
      'Kérjük várj, amíg a tranzakció elküldésre kerül';

  @override
  String get sendTxProgressTitle => 'Tranzakció küldése';

  @override
  String get sending => 'Küldés folyamatban';

  @override
  String get sent => 'Küldött';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Jelszó mentése';

  @override
  String get setPasswordSuccess => 'Jelszó sikeresen beállítva';

  @override
  String get setWalletPassword => 'Jelszó beállítása';

  @override
  String get settingsHeader => 'Beállítások';

  @override
  String get settingsTransfer => 'Betöltés egy papírtárcából';

  @override
  String get setupFailedMessage => 'Valami hiba történt.';

  @override
  String get shareHoosatMobile => 'Hoosat Mobile megosztása';

  @override
  String get shareHoosatMobileSubject => 'Nézd meg a Hoosat Mobile tárcát';

  @override
  String get shareHoosatMobileText =>
      'Próbáld ki a Hoosatot, a Hoosat mobiltárcáját!\nWebsite - mobile.hoosat.fi';

  @override
  String get somethingWentWrong => 'Valami hiba történt.';

  @override
  String get systemDefault => 'Alapértelmezett';

  @override
  String get tapToHide => 'Koppints az elrejtéshez';

  @override
  String get tapToReveal => 'Koppints a felfedéshez';

  @override
  String get themeDark => 'Sötét';

  @override
  String get themeHeader => 'Megjelenés';

  @override
  String get themeLight => 'Világos';

  @override
  String get toggleTheme => 'Switch theme';

  @override
  String get thisWallet => '#Ez a tárca';

  @override
  String get to => 'Küldés ide';

  @override
  String get toAddress => 'címre';

  @override
  String get tooManyFailedAttempts => 'Túl sok hibás feloldási kísérlet.';

  @override
  String get totalValue => 'Összérték';

  @override
  String get transactionId => 'Tranzakció azonosítója';

  @override
  String get transactionsUppercase => 'TRANZAKCIÓK';

  @override
  String get transfer => 'Küldés';

  @override
  String get transferClose => 'Koppints bárhova az ablak bezárásához.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN sikeresen átkerült a Hoosat Mobile tárcádba.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return '$amount HTN egyenlegű tárca észlelve.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Koppints az átutalás megerősítéséhez.\n';

  @override
  String get transferConfirmInfoThird =>
      'Az átvitel néhány másodpercig tarthat.';

  @override
  String get transferError =>
      'Hiba történt az átvitel során. Kérlek, próbáld újra később.';

  @override
  String get transferHeader => 'Átutalás';

  @override
  String transferIntro(String button) {
    return 'Ez a folyamat egy papírtárcán lévő HTN-t a Hoosat Mobile tárcába helyezi át.\n\nA kezdéshez érintsd meg a \"$button\" gombot.';
  }

  @override
  String get transferLoading => 'Átutalás folyamatban';

  @override
  String get transferManualHint => 'Írd be a Seed Phrase-t.';

  @override
  String get transferNoFunds => 'A Seed Phrase-hez tartózó tárcában nincs HTN';

  @override
  String get transferQrScanError =>
      'Ez a QR-kód nem tartalmaz érvényes Seed Phrase-t';

  @override
  String get transferQrScanHint =>
      'Olvass be Hoosat\nSeed Phrase-t, vagy privát kulcsot';

  @override
  String get unconfirmed => 'nem megerősített';

  @override
  String get notAccepted => 'elutasítva';

  @override
  String get accepted => 'elfogadva';

  @override
  String get unknown => 'ismeretlen';

  @override
  String get unlock => 'Feloldás';

  @override
  String get unlockBiometrics =>
      'Hitelesítés szükséges a Hoosatba való bejelentkezéshez';

  @override
  String get unlockPin => 'a tárca megnyitásához.';

  @override
  String get utxosUppercase => 'MARADÉKOK';

  @override
  String get viewAddress => 'Cím megtekintése';

  @override
  String get viewTransaction => 'Tranzakció megtekintése';

  @override
  String get walletAddresses => 'Tárca címek';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Tárca neve';

  @override
  String get walletNameDescription => 'Adj egy nevet a tárcának';

  @override
  String get walletNameHint => 'Tárca neve';

  @override
  String get walletSetupAddressDiscovery => 'Címek felderítése';

  @override
  String get walletSetupMessage => 'Tárca beállítása';

  @override
  String get walletsTitle => 'HTN tárcák';

  @override
  String get warning => 'FIGYELEM';

  @override
  String welcomeMessage(String version) {
    return 'Légy üdvözölve!\n\nEz a Hoosat mobiltárca $version verziója.';
  }

  @override
  String get welcomeText =>
      'Üdv Hoosatban! Hozz létre egy új tárcát, vagy importálj egy meglévőt.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString perc után',
      one: '1 perc után',
    );
    return '$_temp0';
  }

  @override
  String get yes => 'Igen';

  @override
  String get yesButton => 'Igen';

  @override
  String get yesUppercase => 'IGEN';

  @override
  String get nodeNotSyncedException => 'A csomópont nincs szinkronizálva';

  @override
  String get nodeNoUTXOIndexException => 'A csomóponton nincs UTXO index ';

  @override
  String get nodeSecureConnection => 'Biztonságos kapcsolat';

  @override
  String get hoosatUriInvalid => 'Helytelen Hoosat URI';

  @override
  String get compoundUtxos => 'Tranzakciók egyesítése';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Sok kicsi el nem költött kimenete van. A konszolidálás ezeket kevesebb, nagyobb UTXO-ba egyesíti, így a jövőbeni küldések gyorsabbak lehetnek és alacsonyabb díjakkal járhatnak. Ez egy vagy több tranzakciót hoz létre, és hálózati díjakat von maga után.';

  @override
  String get compoundUtxosDescription => 'Több Maradék (UTXOs) egyesítése';

  @override
  String get compoundUtxosConfirmation => 'Egyesíted a tranzakciókat?';

  @override
  String get compoundingUtxos => 'Egyesített tranzakciók';

  @override
  String get compoundingMessage => 'Kérlek várj...';

  @override
  String get compoundSuccess => 'Sikeres egyesítés';

  @override
  String get compoundFailure => 'Tranzakciók egyesítése sikertelen';

  @override
  String get compoundTooFewUtxos => 'Legalább két Maradék szükséges';

  @override
  String get moveToMain => 'Move to Main';

  @override
  String get moveToMainDescription =>
      'Sweep every other address\'s balance into your main address';

  @override
  String get moveToMainConfirmation => 'Move everything to Main?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'This will move $amount $symbol from $count other address(es) into your main address. This creates one or more transactions and will incur network fees.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Every address\'s balance is already on Main';

  @override
  String get movingToMain => 'Moving to Main';

  @override
  String get moveToMainSuccess => 'Move to Main successful';

  @override
  String get moveToMainFailure => 'Failed to move to Main';

  @override
  String get moveToMainUppercased => 'MOVE';

  @override
  String get manageAccounts => 'Accounts';

  @override
  String get manageAccountsDescription => 'Add and manage named addresses';

  @override
  String get mainAccountLabel => 'Main';

  @override
  String get archiveAction => 'Archive';

  @override
  String get restoreAction => 'Restore';

  @override
  String get archivedAccountsHeader => 'Archived';

  @override
  String get noAdditionalAccountsYet => 'No additional accounts yet';

  @override
  String get renameAccount => 'Rename Account';

  @override
  String get accountLabelHint => 'Account name';

  @override
  String get saveUppercased => 'SAVE';

  @override
  String get addUppercased => 'ADD';

  @override
  String get sendFromLabel => 'From';

  @override
  String get sendFromAny => 'Any';

  @override
  String get home => 'Home';

  @override
  String get activity => 'Activity';

  @override
  String get totalBalance => 'Total balance';

  @override
  String get seeAll => 'See all';

  @override
  String homeGreeting(String walletName) {
    return 'Hey, $walletName';
  }

  @override
  String get balance => 'Egyenleg';

  @override
  String get maxSend => 'Egyesítve';

  @override
  String get compoundUppercased => 'EGYESÍTÉS';

  @override
  String get closeUppercased => 'BEZÁR';

  @override
  String get scanMoreAddresses => 'További címek keresése';

  @override
  String get addressDiscovery => 'Címek felfedezése';

  @override
  String get scanningTitle => 'Keresés';

  @override
  String get scanningDescription => 'Új címek keresése...';

  @override
  String get scanMore => 'KERESÉS';

  @override
  String get scanFailedMessage => 'Sikertelen keresés, próbáld később';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Jelenlegi';

  @override
  String get scannedIndex => 'Beolvasva';

  @override
  String get newIndex => 'Új';

  @override
  String get addressFilterDialogTitle => 'Cím szűrő';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Minden cím látható';

  @override
  String get addressFilterDialogOptionNonZeroBalances => 'Címek egyenleggel';

  @override
  String get importOption24WordsTitle => '24 szavas Secret Phrase importálása';

  @override
  String get importOption24WordsDescription =>
      'Kompatibilis Cli pénztárcával és Ledger-rel ';

  @override
  String get importOption12WordsTitle => '12 szavas Secret Phrase importálása';

  @override
  String get importOption12WordsDescription =>
      'Kompatibilis a webes pénztárcával és KDX mentéssel.';

  @override
  String get importOptionStandardWalletTitle => 'Import Standard Wallet';

  @override
  String get importOptionStandardWalletDescription =>
      'Standard derivation 12 or 24 word wallets with optional BIP39 passphrase';

  @override
  String get importOptionLegacyWalletTitle => 'Import Legacy Wallet';

  @override
  String get importOptionLegacyWalletDescription =>
      'Legacy derivation 12 word wallets compatible with legacy Web Wallet and KDX';

  @override
  String get importOptionKpubTitle => 'Tárca figyelés importálása';

  @override
  String get importOptionKpubDescription =>
      'Egy kibővített nyilvános kulcs segítségével nyomon követhető egy pénztárca egyenlege és tranzakciói.';

  @override
  String get importKpub => 'Tárca figyelés importálása';

  @override
  String get importKpubHint => 'Add meg a kibővített nyilvános kulcsod.';

  @override
  String get importKpubClipboardError =>
      'A vágólap nem tartalmaz érvényes kibővített nyilvános kulcsot';

  @override
  String get importKpubQrCodeError =>
      'A QR kód nem tartalmaz érvényes kibővített nyilvános kulcsot';

  @override
  String get importKpubInvalidMessage =>
      'Ellenőrizd, hogy a kibővített nyilvános kulcs helyesen van-e megadva!';

  @override
  String get receiveAddressListEmpty => 'Saját címek listája üres';

  @override
  String get changeAddressListEmpty => 'Cserélt címek listája üres';

  @override
  String get hintAddressListEmpty =>
      'Ellenőrizd a cím szűrőt a jobb felső sarokban';

  @override
  String get invalidSecretPhrase => 'Invalid Secret Phrase';

  @override
  String get invalidSecretPhraseDetails =>
      'The Secret Phrase you entered has an invalid checksum.';

  @override
  String get invalidSecretPhraseConfirmation => 'I know what I\'m doing';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String emailAction(String email) {
    return 'Email $email';
  }

  @override
  String get noteLabel => 'Note:';

  @override
  String get optionalLabel => '(Optional)';

  @override
  String get buyHoosatSubtitle => 'Via Topper by Uphold';

  @override
  String get buyHoosatTitle => 'Buy Hoosat';

  @override
  String get buyHoosatMessage => 'Buy \$HTN quickly & easily.';

  @override
  String get buyHoosatMessageSecondary =>
      'Service provided by Topper, Uphold\'s fiat-to-crypto onramp.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get aboutTopperTitle => 'About Topper';

  @override
  String get aboutTopperDescription =>
      'Topper by Uphold is an easy to use fiat-to-crypto onramp that allows users to buy cryptocurencies using a credit/debit card or with a bank account.';

  @override
  String get moreInfo => 'More Info';

  @override
  String get selectAddress => 'Select Address';

  @override
  String get kpubTitle => 'Extended Public Key';

  @override
  String get kpubAuth => 'View Extended Public Key';

  @override
  String get kpubDescription =>
      'The extended public key can be used to import your wallet as a \'watch only\' wallet.';

  @override
  String get copyKpub => 'Copy Kpub';

  @override
  String get kpubCopied => 'Extended Public Key Copied';

  @override
  String get kpubCopyFailed => 'Failed to copy Extended Public Key';

  @override
  String walletAddressesCopied(String addressType) {
    return 'Wallet $addressType Addresses Copied to Clipboard';
  }

  @override
  String walletAddressesCopyFailed(String addressType) {
    return 'Failed to Copy Wallet $addressType Addresses';
  }

  @override
  String get txReport => 'Transaction Report';

  @override
  String get txReportSubtitle => 'Get CSV file with transaction history';

  @override
  String get txReportDetails =>
      'Generate a transaction report, in CSV format, that contains all the wallet\'s transaction history.';

  @override
  String get txReportOptionIgnoreCompound => 'Ignore compound transactions';

  @override
  String get txReportOptionIgnoreSelfTxs => 'Ignore transactions sent to self';

  @override
  String get txReportOptionRefreshTxs => 'Refresh transactions';

  @override
  String get txReportGenerate => 'Generate';

  @override
  String get txReportStatusRefreshing => 'Refreshing transactions';

  @override
  String get txReportStatusLoading => 'Loading transactions';

  @override
  String get txReportStatusReady => 'Transaction report is ready!';

  @override
  String get txReportGetReport => 'Get Report';

  @override
  String get txReportDate => 'Date';

  @override
  String get txReportSentAmount => 'Sent Amount';

  @override
  String get txReportSentCurrency => 'Sent Currency';

  @override
  String get txReportReceivedAmount => 'Received Amount';

  @override
  String get txReportReceivedCurrency => 'Received Currency';

  @override
  String get txReportFeeAmount => 'Fee Amount';

  @override
  String get txReportFeeCurrency => 'Fee Currency';

  @override
  String get txReportLabel => 'Label';

  @override
  String get txReportDescription => 'Description';

  @override
  String get txReportTxHash => 'TxHash';

  @override
  String get txReportNote => 'Note';

  @override
  String get txReportLabelCost => 'cost';

  @override
  String get txReportFeeForCompound => 'Fee for Compound Transaction';

  @override
  String get txReportFeeForSelfSend => 'Fee to send to own addresses';

  @override
  String get txReportError => 'Error generating report';

  @override
  String txReportNoTxs(int numberOf) {
    return 'Found $numberOf transactions.';
  }

  @override
  String txReportNoLoadedTxs(int loadedTxs, int totalTxs) {
    return '($loadedTxs of $totalTxs)';
  }

  @override
  String get txFilterDialogTitle => 'Transaction Filter';

  @override
  String get txFilterDialogOptionAllTxs => 'Show All Transactions';

  @override
  String get txFilterDialogOptionHideNotAcceptedCoinbase =>
      'Hide Not Accepted Coinbase Transactions';

  @override
  String get changeAddressModeTitle => 'Change Address Behavior';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Change and compounds return to your main address';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'A new address is used each time (private, balance spreads out)';

  @override
  String get changeAddressModeDialogTitle => 'Change Address Behavior';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Keep Balances On Each Address';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Private';

  @override
  String get requestPasswordHeader => 'Request Password';

  @override
  String get requestPasswordAtLaunch => 'At Launch';

  @override
  String get requestPasswordWhenLocked => 'When Locked';

  @override
  String get requestPasswordWhenSigning => 'When Signing';

  @override
  String get importWalletAdvancedOptions => 'Advanced Options';

  @override
  String get bip39Passphrase => 'BIP39 Passphrase';

  @override
  String get bip39PassphraseWarning =>
      'NOTE: This is not a wallet password, different BIP39 passphrases will open different wallets.';

  @override
  String get bip39PassphraseEnter => 'Enter Passphrase';

  @override
  String get bip39PassphraseConfirm => 'Confirm Passphrase';

  @override
  String get bip39PassphraseMismatch => 'Passphrases do not match!';

  @override
  String get bip39PassphraseNote => 'Wallet with BIP39 passphrase.';

  @override
  String get feePriorityHint => 'Enter Priority Fee';

  @override
  String get feeBaseUppercase => 'BASE FEE';

  @override
  String get feePriorityUppsercase => 'PRIORITY FEE';

  @override
  String get feeUpdateAddressError => 'Failed to recognise destination address';

  @override
  String get feeUpdateRebuildError => 'Failed to rebuild transaction';

  @override
  String get feeUpdateRebuildError2 =>
      'Failed to rebuild transaction with new fee';

  @override
  String get feeUpdateError => 'Failed to update fee';

  @override
  String get feeUpdate => 'Update Fee';

  @override
  String get feeUpdateTitle => 'Updating fee';

  @override
  String get feeSheetRecommendedPriority => 'Recommended Priority Fees';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'New priority fee must be at least $amount $symbol';
  }

  @override
  String get txPending => 'PENDING';

  @override
  String get txPendingMessage => 'This transaction is pending';

  @override
  String get txPendingTitle => 'Pending Transaction';

  @override
  String get txPendingContent =>
      'There is a pending transactions in the mempool.';

  @override
  String get txPendingActionUpdateFee => 'Update Tx Fee';

  @override
  String get txPendingActionRbf => 'Replace By Fee';

  @override
  String get txInMempool => 'in mempool';

  @override
  String get utxoSelectionTitle => 'Select UTXOs';

  @override
  String get utxoSelectionHint => 'Please select more UTXOs';
}
