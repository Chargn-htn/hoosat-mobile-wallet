// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get account => 'Llogaria';

  @override
  String get accounts => 'Llogaritë';

  @override
  String get ackBackedUp =>
      'Jeni i sigurt që e keni ruajtur frazën tuaj sekrete?';

  @override
  String get add => 'Shto';

  @override
  String get addAccount => 'Shto Llogari';

  @override
  String get addContact => 'Shto Kontakte';

  @override
  String get addNode => 'Shto Nyje';

  @override
  String get addNodeFailed => 'Shtimi i nyjes Hoosat dështoi';

  @override
  String addNodeFailedMessage(String error) {
    return 'Dështoi: $error';
  }

  @override
  String get addNodeSuccess => 'Nyja u shtua me sukses';

  @override
  String get addingNodeMessage => 'Ju lutemi prisni gjatë kontaktit me nyjen';

  @override
  String get addingNodeTitle => 'Duke shtuar nyjen';

  @override
  String get address => 'Adrresa';

  @override
  String get addressCopied => 'Adresa u kopjua';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'Fut Adresën';

  @override
  String get addressMising => 'Ju lutemi shkruani një adresë';

  @override
  String get addressShare => 'Ndani adresën';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'E avancuar';

  @override
  String get amount => 'Sasia';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Shuma $amount $coin';
  }

  @override
  String get amountMissing => 'Ju lutemi vendosni një shumë';

  @override
  String get amountZero => 'Shuma nuk mund të jetë zero';

  @override
  String get areYouSure => 'A je i sigurt?';

  @override
  String get authBiometricMessage => 'Autentifikohu për të shtuar portofolin';

  @override
  String get authMethod => 'Metoda e vërtetimit';

  @override
  String get authPinMessage => 'Fut kodin PIN për të shtuar portofolin';

  @override
  String get autoLockHeader => 'Kyç automatikisht';

  @override
  String get available => 'Në dispozicion';

  @override
  String get back => 'Mbrapa';

  @override
  String get backupConfirmButton => 'Unë e kam ruajtur atë';

  @override
  String get backupSecretPhrase => 'Ruaj Frazën Sekrete';

  @override
  String get missingSecretPhrase => 'Mungon fraza sekrete';

  @override
  String get biometricsMethod => 'Biometrike';

  @override
  String get blockExplorer => 'Block Explorer';

  @override
  String get cancel => 'Anullo';

  @override
  String get change => 'Ndrysho';

  @override
  String get changeAddress => 'Ndrysho Adrresën';

  @override
  String get changeAddressCopied => 'Ndrysho adrresën qe keni kopjuar';

  @override
  String get changeIndex => 'Ndrysho Indeksin';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Ndrysho $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Ju lutemi kontrolloni lejet e kamerës';

  @override
  String get clipboardEmpty => 'Clipboard është bosh';

  @override
  String get close => 'Mbylle';

  @override
  String get confirm => 'Konfirmo';

  @override
  String get confirmPasswordHint => 'Konfirmoni fjalëkalimin';

  @override
  String confirmations(String confirmations) {
    return '$confirmations konfirmime';
  }

  @override
  String get confirmed => 'konfirmuar';

  @override
  String get confirmedMaturing => 'konfirmuar · duke u pjekur';

  @override
  String get confirming => 'duke konfirmuar';

  @override
  String contactAdded(String contactName) {
    return '$contactName u shtua te kontaktet';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address adresa u kopjua';
  }

  @override
  String get contactExists => 'Kontakti tashmë ekziston';

  @override
  String get contactHeader => 'Kontaktoni';

  @override
  String get contactInvalid => 'Emri i pavlefshëm i kontaktit';

  @override
  String get contactNameHint => 'Fut një emër @';

  @override
  String get contactNameMissing => 'Zgjidhni një emër për këtë kontakt';

  @override
  String contactRemoved(String contactName) {
    return '$contactName është hequr nga kontaktet!';
  }

  @override
  String get contactsHeader => 'Kontaktet';

  @override
  String get contactsImportErr => 'Importimi i kontakteve dështoi';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Kontaktet e $noContacts u importuan me sukses';
  }

  @override
  String get copied => 'U kopjua';

  @override
  String get copy => 'Kopjo';

  @override
  String get copyAddress => 'Kopjo Adrresën';

  @override
  String get copyErrorButton => 'Gabim ne kopim';

  @override
  String get createAPasswordHeader => 'Krijo një fjalëkalim.';

  @override
  String get createPasswordFirstParagraph =>
      'Ju mund të krijoni një fjalëkalim për të shtuar siguri shtesë në portofolin tuaj.';

  @override
  String get createPasswordHint => 'Krijo një fjalëkalim';

  @override
  String get createPasswordSecondParagraph =>
      'Fjalëkalimi është opsional dhe kuleta juaj do të mbrohet me kodin PIN ose biometrikë pavarësisht.';

  @override
  String get createPasswordSheetHeader => 'Krijo';

  @override
  String get currency => 'Valuta';

  @override
  String get currencyPoweredBy => 'Mundësuar nga CoinGecko';

  @override
  String get defaultAccountName => 'Adrresa 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Merr $addressIndex';
  }

  @override
  String get defaultWalletName => 'Portofoli im';

  @override
  String get disablePasswordSheetHeader => 'Çaktivizo';

  @override
  String get disablePasswordSuccess => 'Fjalëkalimi është çaktivizuar';

  @override
  String get disableWalletPassword => 'Çaktivizo fjalëkalimin e portofolit';

  @override
  String get doContinue => 'Vazhdo';

  @override
  String get donate => 'Dhuroni';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Mos e shfaq më';

  @override
  String get emptyCardIntroUtxos =>
      'Kjo është skeda UTXOs. Të gjitha UTXO-të në portofolin tuaj do të shfaqen këtu';

  @override
  String get emptyResult => 'Rezultati bosh';

  @override
  String get emptyWalletName => 'Emri i portofolit nuk mund të jetë bosh';

  @override
  String get encryptionFailedError =>
      'Vendosja e fjalëkalimit të portofolit dështoi';

  @override
  String get enterAddress => 'Fut adresën';

  @override
  String get enterAmount => 'Futni shumën';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Shkruani Shënimin';

  @override
  String get enterPasswordHint => 'Futni fjalëkalimin tuaj';

  @override
  String get errorMessageCopied => 'Mesazhi i gabimit u kopjua';

  @override
  String get exampleCardIntro =>
      'Kjo është skeda e transaksioneve. Pasi të dërgoni ose merrni një transaksion, ai do të shfaqet këtu.';

  @override
  String get export => 'Eksporto';

  @override
  String get fee => 'Tarifa';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Tarifa $amount $coin';
  }

  @override
  String get feeTitle => 'TARIFA';

  @override
  String get fetchingTransactions => 'Marrja e transaksioneve';

  @override
  String get fingerprintSeedBackup =>
      'Vërtetoni për të ruajtur frazën sekrete.';

  @override
  String get goBackButton => 'Shko Mbrapa';

  @override
  String get gotItButton => 'E kuptova!';

  @override
  String get import => 'Importo';

  @override
  String get importSecretPhrase => 'Importo Frazën Sekrete';

  @override
  String get importSecretPhraseHint =>
      'Ju lutemi shkruani frazën tuaj sekrete prej 24 fjalësh më poshtë.';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'Importo Portofolin';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'Menjëherë';

  @override
  String get insufficientBalance => 'Bilanci i pamjaftueshëm';

  @override
  String get insufficientBalanceDetails =>
      'Nuk keni mjaftueshëm HTN për këtë transaksion';

  @override
  String get invalidAddress => 'Adresa e futur ishte e pavlefshme';

  @override
  String get invalidAmount => 'Shuma e pavlefshme';

  @override
  String get invalidChecksumMessage =>
      'Ju lutemi kontrolloni që fraza juaj sekrete\nështë futur saktë!';

  @override
  String get invalidKpubMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get invalidDestinationAddress => 'Adresa e destinacionit e pavlefshme';

  @override
  String get invalidPassword => 'Fjalëkalim i pavlefshëm';

  @override
  String get hoosatDevFund => 'Fondi i Dev te Hoosat';

  @override
  String get hoosatMobile => 'Portofoli i Hoosatit';

  @override
  String get language => 'Gjuhë';

  @override
  String get loadingTransactions => 'Transaksionet po ngarkohen...';

  @override
  String get lockAppSetting => 'Autentifikojeni në nisje';

  @override
  String get locked => 'Kycur';

  @override
  String get loggingOutMessage => 'Po dilni...';

  @override
  String get logout => 'Dil';

  @override
  String get logoutDialogContent =>
      'Jeni i sigurt që dëshironi të dilni nga ky portofol?';

  @override
  String get logoutOrSwitchWallet => 'Dilni / Ndërroni portofolin';

  @override
  String get manage => 'Menaxho';

  @override
  String get manualEntry => 'Hyrja manuale';

  @override
  String get networkHeader => 'Rrjeti';

  @override
  String get newAddress => 'Adrresë e re';

  @override
  String get newWallet => 'Portofol i ri';

  @override
  String get nextButton => 'Tjetra';

  @override
  String get no => 'Jo';

  @override
  String get noContactsExport => 'Nuk ka kontakte për të eksportuar';

  @override
  String get noContactsImport => 'Nuk ka kontakte të reja për të eksportuar';

  @override
  String get noQrCodeFound => 'Nuk u gjet asnjë kod QR';

  @override
  String get noSkipButton => 'Jo, Kalo';

  @override
  String get noUppercase => 'JO';

  @override
  String get nodeAddress => 'Nyje Hoosat';

  @override
  String get nodeDeleteMessage => 'Jeni i sigurt që dëshironi ta fshini?';

  @override
  String get nodeDeleteTitle => 'Të fshihet konfigurimi i Nyjes Hoosat?';

  @override
  String get nodeNameEmpty => 'Emri i nyjes nuk mund të jetë bosh';

  @override
  String get nodeNameHint => 'Futni emrin e nyjes';

  @override
  String get nodeUrlHint => 'Fut URL-në e nyjes';

  @override
  String get nodeUrlInvalid => 'URL e pavlefshme e nyjes';

  @override
  String get nodesSheetTitle => 'Nyjet Hoosat';

  @override
  String get off => 'Fik';

  @override
  String get on => 'Ndiz';

  @override
  String get paperWallet => 'Portofoli prej letre';

  @override
  String get passwordBlank => 'Fjalëkalimi nuk mund të jetë bosh';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Nuk do t\'ju duhet një fjalëkalim për të hapur këtë portofol.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Ky fjalëkalim do të kërkohet për të hapur këtë portofol.';

  @override
  String get passwordsDontMatch => 'Fjalëkalimet nuk përputhen';

  @override
  String get pasteMnemonicError =>
      'Përmbajtja e kujtesës nuk është një frazë e vlefshme sekrete';

  @override
  String get pending => 'në pritje';

  @override
  String get pinConfirmError => 'Pinet nuk përputhen';

  @override
  String get pinConfirmTitle => 'Konfirmoni PIN-in tuaj';

  @override
  String get pinCreateTitle => 'Krijo një PIN 6-shifror';

  @override
  String get pinEnterTitle => 'Fut kodin PIN';

  @override
  String get pinInvalid => 'Është futur kodi PIN i pavlefshëm';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'Fut kodin PIN për të rezervuar frazën sekrete';

  @override
  String get preferences => 'Preferancat';

  @override
  String get privacyPolicy => 'Politika e privatësisë';

  @override
  String get qrInvalidAddress => 'Kodi QR nuk përmban një adresë të vlefshme';

  @override
  String get qrInvalidSeed =>
      'Kodi QR nuk përmban një seed të vlefshme ose çelës privat';

  @override
  String get qrMnemonicError =>
      'Kodi QR nuk përmban një frazë të vlefshme sekrete';

  @override
  String get receive => 'Merrni';

  @override
  String get receiveAddress => 'Merrni Adrresën';

  @override
  String get receiveAddressCopied => 'Adressa e marrjes është kopjuar';

  @override
  String get receiveIndex => 'Merr Indeksin';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Marrë $addressIndex';
  }

  @override
  String get received => 'Marrë';

  @override
  String get removeContact => 'Hiq kontaktin';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Jeni i sigurt që dëshironi të fshini $contactName?';
  }

  @override
  String get removeWalletAction => 'Hiq portofolin';

  @override
  String get removeWalletBiometricsMessage =>
      'Autentifikohu për të hequr portofolin';

  @override
  String get removeWalletDetail =>
      'Heqja e këtij portofoli do të heqë frazën sekrete dhe të gjitha të dhënat e lidhura me portofolin nga kjo pajisje. Nëse Fraza Sekrete nuk është e rezervuar, nuk do të mund të përdorni më kurrë fondet tuaja.';

  @override
  String get removeWalletPinMessage => 'Fut kodin PIN për të hequr portofolin';

  @override
  String get removeWalletReassurance =>
      'Për sa kohë që e keni ruajtur Frazën Sekrete, nuk keni asgjë për t\'u shqetësuar.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Kërkohet një fjalëkalim për të hapur këtë portofol?';

  @override
  String get restartSetupButton => 'Rinis konfigurimin';

  @override
  String get scanQrCode => 'Skanoni kodin QR';

  @override
  String get scanQrCodeError => 'Analizimi i kodit qr dështoi';

  @override
  String get scanFromImage => 'Skano nga imazhi';

  @override
  String get toggleFlash => 'Ndiz/fik elektrikun';

  @override
  String get riskDisclosureHeader => 'Para se të filloni';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet është një portofol jo-kujdestar (non-custodial). Fraza juaj sekrete dhe çelësat privatë krijohen dhe ruhen vetëm në këtë pajisje — ne nuk i shohim kurrë, nuk i ruajmë në asnjë server dhe nuk mund t\'i rikuperojmë për ju.';

  @override
  String get riskDisclosureWarning =>
      'Nëse humbni frazën sekrete, nuk ka rivendosje fjalëkalimi dhe asnjë ekip mbështetjeje nuk mund t\'jua kthejë fondet. Vetëm ju jeni përgjegjës për ta mbajtur të sigurt.';

  @override
  String get riskDisclosureAccept => 'E kuptoj, vazhdo';

  @override
  String get secretInfo =>
      'Në ekranin tjetër, do të shihni frazën tuaj sekrete. Është një fjalëkalim për të hyrë në fondet tuaja. Është thelbësore që ta mbështesni atë dhe të mos e ndani kurrë me askënd.';

  @override
  String get secretInfoHeader => 'Siguaria Primare!';

  @override
  String get secretPhrase => 'Fraze Sekrete';

  @override
  String get verifyBackupTitle => 'Verifikoni kopjen rezervë';

  @override
  String get verifyBackupInstruction =>
      'Zgjidhni fjalën e saktë për çdo pozicion për të konfirmuar se e keni ruajtur frazën sekrete.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Cila është fjala nr. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Jo plotësisht e saktë. Kontrolloni kopjen rezervë dhe provoni përsëri.';

  @override
  String get secretPhrase12Words => '12 fjalë';

  @override
  String get secretPhrase24Words => '24 fjalë';

  @override
  String get secretWarning =>
      'Nëse humbni pajisjen tuaj ose çinstaloni aplikacionin, do t\'ju duhet fraza juaj sekrete për të rikuperuar fondet tuaja!';

  @override
  String get securityHeader => 'Siguria';

  @override
  String get securitySettingsBiometrics =>
      'Vërtetohuni për të hyrë te cilësimet e sigurisë';

  @override
  String get securitySettingsPin =>
      'Futni PIN-in për të hyrë te cilësimet e sigurisë';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Nënshkruaj mesazhin';

  @override
  String get signMessageCopySignature => 'Kopjo nënshkrimin';

  @override
  String get signMessageDescription =>
      'Nënshkruani një mesazh me një nga adresat e portofolit tuaj';

  @override
  String get signMessageHint => 'Futni një mesazh për ta nënshkruar';

  @override
  String get signMessageSignatureCopied => 'Nënshkrimi u kopjua';

  @override
  String get signMessageSigned => 'Mesazhi u nënshkrua';

  @override
  String get signMessageTooLong => 'Mesazhi është shumë i gjatë';

  @override
  String get seedInvalid => 'Seed është i pavlefshëm';

  @override
  String get nodeUnreachable =>
      'Nuk mund të arrihet nyja juaj. Bilancet mund të jenë të vjetruara.';

  @override
  String get nodeUnreachableRetry => 'Provo përsëri';

  @override
  String get send => 'Dërgo';

  @override
  String get sendConfirm => 'Dërgo';

  @override
  String get sendError => 'Ka ndodhur një problem. Provoni përsëri';

  @override
  String get sendNote => 'SHËNIM';

  @override
  String get sendToAddressTitle => 'Në';

  @override
  String get sendTxProgressDescription =>
      'Ju lutemi prisni derisa transaksioni të dërgohet';

  @override
  String get sendTxProgressTitle => 'Dërgimi i transaksionit';

  @override
  String get sending => 'Dërgo';

  @override
  String get sent => 'Dërguar';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Vendosni fjalëkalimin';

  @override
  String get setPasswordSuccess => 'Është vendosur fjalëkalimi i portofolit';

  @override
  String get setWalletPassword => 'Vendosni fjalëkalimin e portofolit';

  @override
  String get settingsHeader => 'Cilësimet';

  @override
  String get settingsTransfer => 'Ngarkoni nga Portofoli i letrës';

  @override
  String get setupFailedMessage => 'Dicka shkoj keq';

  @override
  String get shareHoosatMobile => 'Shpërnda Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Shikoni Portofolin Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Shikoni Hoosat Mobile - Hoosat Mobile Wallet.\nFaqja e internetit - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Dicka shkoj keq';

  @override
  String get systemDefault => 'Parazgjedhjet e sistemit';

  @override
  String get tapToHide => 'Trokit për ta fshehur';

  @override
  String get tapToReveal => 'Trokit për të zbuluar';

  @override
  String get themeDark => 'Temë e errët';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Tema e lehtë';

  @override
  String get toggleTheme => 'Ndrysho temën';

  @override
  String get thisWallet => '#Ky Portofol';

  @override
  String get to => 'Në';

  @override
  String get toAddress => 'Në adresën';

  @override
  String get tooManyFailedAttempts =>
      'Shumë përpjekje të dështuara për shkyçje.';

  @override
  String get totalValue => 'Vlera Totale';

  @override
  String get transactionId => 'ID Transaksionit';

  @override
  String get transactionsUppercase => 'TRANSAKSION';

  @override
  String get transfer => 'Transfertë';

  @override
  String get transferClose => 'Prekni kudo për të mbyllur dritaren.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN u transferua me sukses në portofolin tuaj Hoosat Mobile.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Është zbuluar një portofol me një bilanc prej $amount HTN.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Prekni konfirmoni për të transferuar fondet.\n';

  @override
  String get transferConfirmInfoThird =>
      'Transferimi mund të marrë disa sekonda për të përfunduar.';

  @override
  String get transferError =>
      'Ka ndodhur një gabim gjatë transferimit. Ju lutemi provoni përsëri më vonë.';

  @override
  String get transferHeader => 'Transfero Fondet';

  @override
  String transferIntro(String button) {
    return 'Ky proces do të transferojë fondet nga një portofol letre në portofolin tuaj Hoosat Mobile.\n\nPrekni butonin \"$button\" për të filluar.';
  }

  @override
  String get transferLoading => 'Duke transferuar';

  @override
  String get transferManualHint => 'Ju lutemi shkruani seed më poshtë.';

  @override
  String get transferNoFunds => 'Ky seed nuk ka asnjë HTN mbi të';

  @override
  String get transferQrScanError =>
      'Ky kod QR nuk përmban një seed të vlefshme.';

  @override
  String get transferQrScanHint => 'Skanoni një seed Hoosat\n ose çelës privat';

  @override
  String get unconfirmed => 'e pakonfirmuar';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'e paditur';

  @override
  String get unlock => 'Hap';

  @override
  String get unlockBiometrics => 'Autentifikohu për të zhbllokuar portofolin';

  @override
  String get unlockPin => 'Fut kodin PIN për të zhbllokuar portofolin';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Shiko adresën';

  @override
  String get viewTransaction => 'Shikoni transaksionin';

  @override
  String get walletAddresses => 'Adresat e portofolit';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Emri i portofolit';

  @override
  String get walletNameDescription => 'Futni një emër për portofolin tuaj';

  @override
  String get walletNameHint => 'Emri i portofolit';

  @override
  String get walletSetupAddressDiscovery => 'Zbulimi i adresës në punë';

  @override
  String get walletSetupMessage => 'Vendosja e portofolit';

  @override
  String get walletsTitle => 'Portofolat';

  @override
  String get warning => 'Paralajmërim';

  @override
  String welcomeMessage(String version) {
    return 'Mirë se vini!\n\nKy është versioni $version i Hoosat Mobile - portofoli celular për Hoosat';
  }

  @override
  String get welcomeText =>
      'Mirë se vini në Hoosat Mobile. Për të filluar, mund të krijoni një portofol të ri ose të importoni një ekzistues.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutash',
      one: '1 minuti',
    );
    return 'Pas $_temp0';
  }

  @override
  String get yes => 'Po';

  @override
  String get yesButton => 'Po';

  @override
  String get yesUppercase => 'PO';

  @override
  String get nodeNotSyncedException => 'Nyja nuk sinkronizohet';

  @override
  String get nodeNoUTXOIndexException => 'Nyja nuk ka indeks UTXO';

  @override
  String get nodeSecureConnection => 'Lidhje e sigurt';

  @override
  String get hoosatUriInvalid => 'Invalid Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Keni shumë dalje të vogla të pashfrytëzuara (UTXO). Konsolidimi do t’i bashkojë ato në më pak UTXO më të mëdha, kështu që dërgesat e ardhshme do të jenë më të shpejta dhe mund të kenë tarifa më të ulëta. Kjo krijon një ose më shumë transaksione dhe shkakton tarifa rrjeti.';

  @override
  String get compoundUtxosDescription => 'Combine multiple UTXOs into one';

  @override
  String get compoundUtxosConfirmation => 'Compound transactions?';

  @override
  String get compoundingUtxos => 'Compounding transactions';

  @override
  String get compoundingMessage => 'Please wait...';

  @override
  String get compoundSuccess => 'Compound successful';

  @override
  String get compoundFailure => 'Failed to compound transactions';

  @override
  String get fundsStillConfirmingTitle => 'Fondet ende po konfirmohen';

  @override
  String get fundsStillConfirmingBody =>
      'Një pjesë e fondeve në këtë llogari u pranua shumë së fundmi për t\'u dërguar ende — rrjeti kërkon fillimisht një kohë të shkurtër pjekjeje, zakonisht disa minuta. Mund të prisni dhe të provoni përsëri, ose të dërgoni nga një llogari tjetër që ka fonde të pjekura.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Ndërro llogarinë';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Mblidh te Kryesorja';

  @override
  String get moveToMainDescription =>
      'Transferoni bilancin e të gjitha adresave të tjera te adresa juaj kryesore';

  @override
  String get moveToMainConfirmation => 'Të zhvendosen të gjitha te Kryesorja?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Kjo do të zhvendosë $amount $symbol nga $count adresa të tjera te adresa juaj kryesore. Do të krijohen një ose më shumë transaksione dhe do të aplikohen tarifa rrjeti.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Bilanci i të gjitha adresave është tashmë te Kryesorja';

  @override
  String get movingToMain => 'Po mblidhet te Kryesorja';

  @override
  String get moveToMainSuccess => 'Zhvendosja te Kryesorja u krye me sukses';

  @override
  String get moveToMainFailure => 'Zhvendosja te Kryesorja dështoi';

  @override
  String get moveToMainUppercased => 'ZHVENDOS';

  @override
  String get manageAccounts => 'Llogaritë';

  @override
  String get manageAccountsDescription => 'Shtoni dhe menaxhoni adresa me emër';

  @override
  String get mainAccountLabel => 'Kryesore';

  @override
  String get archiveAction => 'Arkivo';

  @override
  String get restoreAction => 'Rikthe';

  @override
  String get archivedAccountsHeader => 'Të arkivuara';

  @override
  String get noAdditionalAccountsYet => 'Ende nuk ka llogari shtesë';

  @override
  String get renameAccount => 'Riemërto llogarinë';

  @override
  String get accountLabelHint => 'Emri i llogarisë';

  @override
  String get saveUppercased => 'RUAJ';

  @override
  String get addUppercased => 'SHTO';

  @override
  String get sendFromLabel => 'Nga';

  @override
  String get sendFromAny => 'Çdo';

  @override
  String get home => 'Kreu';

  @override
  String get activity => 'Aktiviteti';

  @override
  String get totalBalance => 'Bilanci total';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'E shpenzueshme tani $spendable · Ende në rrugë $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Monedhat që janë ende në rrugë janë tuajat dhe do të mund të shpenzohen së shpejti.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Monedhat që janë ende në rrugë do të mund të shpenzohen pas $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'E shpenzueshme tani $amount. Pjesa tjetër mund të shpenzohet pas $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'E shpenzueshme tani $amount. Pjesa tjetër është ende në rrugë.';
  }

  @override
  String get txTagWaiting => 'në pritje të pranimit';

  @override
  String get txTagStatusUnknown => 'gjendje e panjohur';

  @override
  String get txTagNotAccepted => 'nuk u pranua';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'konfirmim $n / $total';
  }

  @override
  String get submittedTo => 'Dërguar te';

  @override
  String get testConnection => 'Testo lidhjen';

  @override
  String get accountsOtherWalletHeader =>
      'Ruajtur nga një portofol tjetër (vetëm shikim)';

  @override
  String get accountsOtherWalletNote =>
      'Ky portofol nuk mund t\'i shpenzojë, ndaj nuk llogariten në totalin e tij. Hapni portofolin të cilit i përkasin për t\'i përdorur.';

  @override
  String get noActivityTitle => 'Ende pa aktivitet';

  @override
  String get txTypeSent => 'Dërguar';

  @override
  String get txTypeReceived => 'Pranuar';

  @override
  String get txTypeThisWallet => 'Brenda portofolit';

  @override
  String get txTypeMerged => 'Monedha të bashkuara';

  @override
  String get noActivityMessage =>
      'Kur dërgoni ose pranoni HTN, do të shfaqet këtu.';

  @override
  String get seeAll => 'Shiko të gjitha';

  @override
  String get show => 'Shfaq';

  @override
  String get myAccounts => 'Llogaritë e mia';

  @override
  String homeGreeting(String walletName) {
    return 'Përshëndetje, $walletName';
  }

  @override
  String get balance => 'Balance';

  @override
  String get maxSend => 'Max Send';

  @override
  String get compoundUppercased => 'COMPOUND';

  @override
  String get closeUppercased => 'CLOSE';

  @override
  String get scanMoreAddresses => 'Scan For More Addresses';

  @override
  String get addressDiscovery => 'Address Discovery';

  @override
  String get scanningTitle => 'Scanning';

  @override
  String get scanningDescription => 'Scanning for new addresses...';

  @override
  String get scanMore => 'SCAN MORE';

  @override
  String get scanFailedMessage => 'Scan failed, please try again later';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Current';

  @override
  String get scannedIndex => 'Scanned';

  @override
  String get newIndex => 'New';

  @override
  String get addressFilterDialogTitle => 'Address Filter';

  @override
  String get addressFilterDialogOptionAllAddresses => 'View All Addresses';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'View Addresses With Balance';

  @override
  String get importOption24WordsTitle => 'Import 24 Word Secret Phrase';

  @override
  String get importOption24WordsDescription =>
      'Compatible with Cli Wallet and Ledger';

  @override
  String get importOption12WordsTitle => 'Import 12 Word Secret Phrase';

  @override
  String get importOption12WordsDescription =>
      'Compatible with Web Wallet and KDX';

  @override
  String get importOptionStandardWalletTitle => 'Importo portofol standard';

  @override
  String get importOptionStandardWalletDescription =>
      'Portofolë me 12 ose 24 fjalë me derivim standard dhe fraza kalimi BIP39 opsionale';

  @override
  String get importOptionLegacyWalletTitle => 'Importo portofol të vjetër';

  @override
  String get importOptionLegacyWalletDescription =>
      'Portofolë me 12 fjalë me derivim të vjetër, të përputhshëm me Web Wallet të vjetër dhe KDX';

  @override
  String get importOptionKpubTitle => 'Import Watch Only Wallet';

  @override
  String get importOptionKpubDescription =>
      'Monitor the balance and transactions of a wallet using an extended public key';

  @override
  String get importKpub => 'Import Watch Only Wallet';

  @override
  String get importKpubHint => 'Please enter your extended public key.';

  @override
  String get importKpubClipboardError =>
      'Clipboard content is not a valid extended public key';

  @override
  String get importKpubQrCodeError =>
      'QR code does not contain a valid extended public key';

  @override
  String get importKpubInvalidMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get receiveAddressListEmpty => 'Receive address list is empty';

  @override
  String get changeAddressListEmpty => 'Change address list is empty';

  @override
  String get hintAddressListEmpty =>
      'Check address filter from the top right corner';

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
  String get changeAddressModeTitle => 'Sjellja e adresës së kusurit';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Çdo adresë mban bilancin e vet dhe kusuri mbetet aty';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Çdo herë përdoret një adresë e re (privat, bilanci shpërndahet)';

  @override
  String get changeAddressModeDialogTitle => 'Sjellja e adresës së kusurit';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Mbaj bilancet në çdo adresë';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privat';

  @override
  String get requestPasswordHeader => 'Kërko fjalëkalimin';

  @override
  String get requestPasswordAtLaunch => 'Gjatë nisjes';

  @override
  String get requestPasswordWhenLocked => 'Kur është i kyçur';

  @override
  String get requestPasswordWhenSigning => 'Gjatë nënshkrimit';

  @override
  String get importWalletAdvancedOptions => 'Opsione të avancuara';

  @override
  String get bip39Passphrase => 'Fraza e kalimit BIP39';

  @override
  String get bip39PassphraseWarning =>
      'SHËNIM: Ky nuk është fjalëkalim portofoli; fraza të ndryshme kalimi BIP39 hapin portofolë të ndryshëm.';

  @override
  String get bip39PassphraseEnter => 'Futni frazën e kalimit';

  @override
  String get bip39PassphraseConfirm => 'Konfirmoni frazën e kalimit';

  @override
  String get bip39PassphraseMismatch => 'Frazat e kalimit nuk përputhen!';

  @override
  String get bip39PassphraseNote => 'Portofol me frazë kalimi BIP39.';

  @override
  String get feePriorityHint => 'Futni tarifën e përparësisë';

  @override
  String get feeBaseUppercase => 'TARIFA BAZË';

  @override
  String get feePriorityUppsercase => 'TARIFA E PËRPARËSISË';

  @override
  String get feeUpdateAddressError => 'Adresa e destinacionit nuk u njoh';

  @override
  String get feeUpdateRebuildError => 'Transaksioni nuk u rindërtua dot';

  @override
  String get feeUpdateRebuildError2 =>
      'Transaksioni nuk u rindërtua dot me tarifën e re';

  @override
  String get feeUpdateError => 'Tarifa nuk u përditësua dot';

  @override
  String get feeUpdate => 'Përditëso tarifën';

  @override
  String get feeUpdateTitle => 'Po përditësohet tarifa';

  @override
  String get feeSheetRecommendedPriority => 'Tarifa përparësie të rekomanduara';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Tarifa e re e përparësisë duhet të jetë të paktën $amount $symbol';
  }

  @override
  String get txPending => 'NË PRITJE';

  @override
  String get txPendingMessage => 'Ky transaksion është në pritje';

  @override
  String get txPendingTitle => 'Transaksion në pritje';

  @override
  String get txPendingContent => 'Ka transaksione në pritje në mempool.';

  @override
  String get txPendingActionUpdateFee => 'Përditëso tarifën e transaksionit';

  @override
  String get txPendingActionRbf => 'Zëvendëso me tarifë (RBF)';

  @override
  String get txInMempool => 'në mempool';

  @override
  String get utxoSelectionTitle => 'Zgjidh UTXO';

  @override
  String get utxoSelectionHint => 'Ju lutemi zgjidhni më shumë UTXO';
}
