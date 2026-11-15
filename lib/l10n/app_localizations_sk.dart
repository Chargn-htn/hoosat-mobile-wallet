// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get account => 'Účet';

  @override
  String get accounts => 'Účty';

  @override
  String get ackBackedUp =>
      'Ste si istí, že ste si zálohovali svoju tajnú frázu?';

  @override
  String get add => 'Pridať';

  @override
  String get addAccount => 'Pridať Účet';

  @override
  String get addContact => 'Pridať kontakt';

  @override
  String get addNode => 'Pridať Uzol';

  @override
  String get addNodeFailed => 'Nepodarilo sa pridať Hoosat uzol ';

  @override
  String addNodeFailedMessage(String error) {
    return 'Failed: $error';
  }

  @override
  String get addNodeSuccess => 'Uzol Úspešne Pridaný';

  @override
  String get addingNodeMessage => 'Čakajte prosím, kontaktuje sa uzol';

  @override
  String get addingNodeTitle => 'Uzol sa pridáva';

  @override
  String get address => 'Adresa';

  @override
  String get addressCopied => 'Adresa Skopírovaná';

  @override
  String get addressCopiedFailed => 'Nepodarilo sa skopírovať adresu';

  @override
  String get addressHint => 'Zadajte Adresu';

  @override
  String get addressMising => 'Prosím Zadajte Adresu';

  @override
  String get addressShare => 'Zdieľať Adresu';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Rozšírené nastavenia';

  @override
  String get amount => 'Čiastka';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Čiastka $amount $coin';
  }

  @override
  String get amountMissing => 'Prosím Zadajte Čiastku';

  @override
  String get amountZero => 'Čiastka sa nesmie rovnať nule';

  @override
  String get areYouSure => 'Ste si istí?';

  @override
  String get authBiometricMessage => 'Authenticate to Add Wallet';

  @override
  String get authMethod => 'Spôsob Overovania';

  @override
  String get authPinMessage => 'Zadajte PIN pre Pridanie Peňaženky';

  @override
  String get autoLockHeader => 'Automaticky Zamknúť';

  @override
  String get available => 'Available';

  @override
  String get back => 'Späť';

  @override
  String get backupConfirmButton => 'I\'ve Backed It Up';

  @override
  String get backupSecretPhrase => 'Zálohovať Tajnú Frázu';

  @override
  String get missingSecretPhrase => 'Chýba tajná fráza';

  @override
  String get biometricsMethod => 'Biometrické údaje';

  @override
  String get blockExplorer => 'Prieskumník Blokov';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get change => 'Zmeniť';

  @override
  String get changeAddress => 'Change Address';

  @override
  String get changeAddressCopied => 'Change address copied';

  @override
  String get changeIndex => 'Change Index';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Change $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Please check camera permissions';

  @override
  String get clipboardEmpty => 'Clipboard is empty';

  @override
  String get close => 'Zavrieť';

  @override
  String get confirm => 'Potvrdiť';

  @override
  String get confirmPasswordHint => 'Potvrdiť heslo';

  @override
  String confirmations(String confirmations) {
    return '$confirmations potvrdení';
  }

  @override
  String get confirmed => 'potvrdená';

  @override
  String get confirmedMaturing => 'potvrdené · dozrieva';

  @override
  String get confirming => 'potvrdzovanie';

  @override
  String contactAdded(String contactName) {
    return 'Kontakt $contactName bol pridaný';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address address copied';
  }

  @override
  String get contactExists => 'Kontakt už Existuje';

  @override
  String get contactHeader => 'Kontakt';

  @override
  String get contactInvalid => 'Neplatný Názov Kontaktu';

  @override
  String get contactNameHint => 'Zadajte Názov @';

  @override
  String get contactNameMissing => 'Zadajte názov pre tento Kontakt';

  @override
  String contactRemoved(String contactName) {
    return 'Kontakt $contactName bol odstránený!';
  }

  @override
  String get contactsHeader => 'Kontakty';

  @override
  String get contactsImportErr => 'Nepodarilo sa importovať kontakty';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Úspešne importované kontakty v počte - $noContacts';
  }

  @override
  String get copied => 'Skopírované';

  @override
  String get copy => 'Kopírovať';

  @override
  String get copyAddress => 'Kopírovať Adresu';

  @override
  String get copyErrorButton => 'Chyba pri Kopírovaní';

  @override
  String get createAPasswordHeader => 'Vytvorte heslo.';

  @override
  String get createPasswordFirstParagraph =>
      'Môžete vytvoriť heslo pre dodatočné zabezpečenie svojej peňaženky.';

  @override
  String get createPasswordHint => 'Vytvoriť heslo';

  @override
  String get createPasswordSecondParagraph =>
      'Heslo je voliteľné a vaša peňaženka bude chránená PIN kódom alebo biometrickými údajmi.';

  @override
  String get createPasswordSheetHeader => 'Vytvoriť';

  @override
  String get currency => 'Mena';

  @override
  String get currencyPoweredBy => 'Powered by CoinGecko';

  @override
  String get defaultAccountName => 'Adresa 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Receive $addressIndex';
  }

  @override
  String get defaultWalletName => 'Moja Peňaženka';

  @override
  String get disablePasswordSheetHeader => 'Disable';

  @override
  String get disablePasswordSuccess => 'Password has been disabled';

  @override
  String get disableWalletPassword => 'Disable Wallet Password';

  @override
  String get doContinue => 'Pokračovať';

  @override
  String get donate => 'Darovať';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Don\'t show again';

  @override
  String get emptyCardIntroUtxos =>
      'Toto je karta UTXO. Tu sa zobrazia všetky UTXO vo vašej peňaženke';

  @override
  String get emptyResult => 'Empty Result';

  @override
  String get emptyWalletName => 'Názov Peňaženky nesmie byť prázdny';

  @override
  String get encryptionFailedError => 'Failed to set a wallet password';

  @override
  String get enterAddress => 'Enter Address';

  @override
  String get enterAmount => 'Enter Amount';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Enter Note';

  @override
  String get enterPasswordHint => 'Enter your password';

  @override
  String get errorMessageCopied => 'Error message copied to clipboard';

  @override
  String get exampleCardIntro =>
      'This is the transactions tab. Once you send or receive a transaction, it will show up here.';

  @override
  String get export => 'Export';

  @override
  String get fee => 'Fee';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Fee $amount $coin';
  }

  @override
  String get feeTitle => 'FEE';

  @override
  String get fetchingTransactions => 'Získavanie Transakcií';

  @override
  String get fingerprintSeedBackup => 'Authenticate to Backup Secret Phrase.';

  @override
  String get goBackButton => 'Go Back';

  @override
  String get gotItButton => 'Got It!';

  @override
  String get import => 'Import';

  @override
  String get importSecretPhrase => 'Import Secret Phrase';

  @override
  String get importSecretPhraseHint =>
      'Please enter your 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'Import Wallet';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'Instantly';

  @override
  String get insufficientBalance => 'Insufficient Balance';

  @override
  String get insufficientBalanceDetails =>
      'Na túto transakciu nemáte dostatok HTN';

  @override
  String get invalidAddress => 'Address entered was invalid';

  @override
  String get invalidAmount => 'Invalid Amount';

  @override
  String get invalidChecksumMessage =>
      'Please check that your Secret Phrase\n is entered correctly!';

  @override
  String get invalidKpubMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get invalidDestinationAddress => 'Invalid Destination Address';

  @override
  String get invalidPassword => 'Invalid Password';

  @override
  String get hoosatDevFund => 'Hoosat Dev Fund';

  @override
  String get hoosatMobile => 'Hoosat Mobile Wallet';

  @override
  String get language => 'Jazyk';

  @override
  String get loadingTransactions => 'Načítavanie Transakcií...';

  @override
  String get lockAppSetting => 'Authenticate on Launch';

  @override
  String get locked => 'Locked';

  @override
  String get loggingOutMessage => 'Logging out...';

  @override
  String get logout => 'Logout';

  @override
  String get logoutDialogContent =>
      'Are you sure you want to logout from this wallet?';

  @override
  String get logoutOrSwitchWallet => 'Logout / Switch Wallet';

  @override
  String get manage => 'Manage';

  @override
  String get manualEntry => 'Manual Entry';

  @override
  String get networkHeader => 'Sieť';

  @override
  String get newAddress => 'New Address';

  @override
  String get newWallet => 'New Wallet';

  @override
  String get nextButton => 'Next';

  @override
  String get no => 'No';

  @override
  String get noContactsExport => 'There\'s no contacts to export';

  @override
  String get noContactsImport => 'No new contacts to import';

  @override
  String get noQrCodeFound => 'No QR code found';

  @override
  String get noSkipButton => 'No, Skip';

  @override
  String get noUppercase => 'NO';

  @override
  String get nodeAddress => 'Hoosat Node';

  @override
  String get nodeDeleteMessage => 'Are you sure you want to delete?';

  @override
  String get nodeDeleteTitle => 'Delete Hoosat Node Config?';

  @override
  String get nodeNameEmpty => 'Názov Uzla nesmie byť prázdny';

  @override
  String get nodeNameHint => 'Zadajte Názov Uzla';

  @override
  String get nodeUrlHint => 'Enter Node URL';

  @override
  String get nodeUrlInvalid => 'Invalid node URL';

  @override
  String get nodesSheetTitle => 'Hoosat Nodes';

  @override
  String get off => 'Off';

  @override
  String get on => 'On';

  @override
  String get paperWallet => 'Paper Wallet';

  @override
  String get passwordBlank => 'Password cannot be empty';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'You will not need a password to open this wallet.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'This password will be required to open this wallet.';

  @override
  String get passwordsDontMatch => 'Passwords do not match';

  @override
  String get pasteMnemonicError =>
      'Clipboard content is not a valid secret phrase';

  @override
  String get pending => 'pending';

  @override
  String get pinConfirmError => 'Pins do not match';

  @override
  String get pinConfirmTitle => 'Confirm your PIN';

  @override
  String get pinCreateTitle => 'Create a 6-digit PIN';

  @override
  String get pinEnterTitle => 'Enter PIN';

  @override
  String get pinInvalid => 'Invalid PIN entered';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'Enter PIN to Backup Secret Phrase';

  @override
  String get preferences => 'Preferences';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get qrInvalidAddress => 'QR code does not contain a valid address';

  @override
  String get qrInvalidSeed =>
      'QR code does not contain a valid seed or private key';

  @override
  String get qrMnemonicError =>
      'QR code does not contain a valid secret phrase';

  @override
  String get receive => 'Receive';

  @override
  String get receiveAddress => 'Receive Address';

  @override
  String get receiveAddressCopied => 'Receive address copied';

  @override
  String get receiveIndex => 'Receive Index';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Receive $addressIndex';
  }

  @override
  String get received => 'Received';

  @override
  String get removeContact => 'Remove Contact';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Ste si istí, že chcete odstrániť kontakt $contactName?';
  }

  @override
  String get removeWalletAction => 'Remove Wallet';

  @override
  String get removeWalletBiometricsMessage => 'Authenticate to Remove Wallet';

  @override
  String get removeWalletDetail =>
      'Removing this wallet will remove the Secret Phrase and all wallet-related data from this device. If the Secret Phrase is not backed up, you will never be able to access your funds again.';

  @override
  String get removeWalletPinMessage => 'Enter PIN to Remove Wallet';

  @override
  String get removeWalletReassurance =>
      'As long as you\'ve backed up the Secret Phrase you have nothing to worry about.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Require a password to open this wallet?';

  @override
  String get restartSetupButton => 'Restart Setup';

  @override
  String get scanQrCode => 'Naskenovať QR Kód';

  @override
  String get scanQrCodeError => 'Failed to parse qr code';

  @override
  String get scanFromImage => 'Skenovať z obrázka';

  @override
  String get toggleFlash => 'Zapnúť/vypnúť baterku';

  @override
  String get riskDisclosureHeader => 'Skôr než začnete';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet je nekustodiálna peňaženka. Vaša tajná fráza a súkromné kľúče sa vytvárajú a ukladajú iba v tomto zariadení – nikdy ich nevidíme, neukladáme ich na žiadny server a nemôžeme ich pre vás obnoviť.';

  @override
  String get riskDisclosureWarning =>
      'Ak stratíte tajnú frázu, neexistuje obnovenie hesla ani tím podpory, ktorý by vám vrátil prostriedky. Za jej bezpečné uchovanie zodpovedáte výlučne vy.';

  @override
  String get riskDisclosureAccept => 'Rozumiem, pokračovať';

  @override
  String get secretInfo =>
      'In the next screen, you will see your secret phrase. It is a password to access your funds. It is crucial that you back it up and never share it with anyone.';

  @override
  String get secretInfoHeader => 'Safety First!';

  @override
  String get secretPhrase => 'Secret Phrase';

  @override
  String get verifyBackupTitle => 'Overte zálohu';

  @override
  String get verifyBackupInstruction =>
      'Pre každú pozíciu vyberte správne slovo, aby ste potvrdili, že ste si tajnú frázu uložili.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Aké je slovo č. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'To nie je celkom správne. Skontrolujte zálohu a skúste to znova.';

  @override
  String get secretPhrase12Words => '12 slov';

  @override
  String get secretPhrase24Words => '24 slov';

  @override
  String get secretWarning =>
      'If you lose your device or uninstall the application, you\'ll need your secret phrase to recover your funds!';

  @override
  String get securityHeader => 'Zabezpečenie';

  @override
  String get securitySettingsBiometrics =>
      'Overte sa, aby ste získali prístup k nastaveniam zabezpečenia';

  @override
  String get securitySettingsPin =>
      'Zadajte PIN pre prístup k nastaveniam zabezpečenia';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Podpísať správu';

  @override
  String get signMessageCopySignature => 'Kopírovať podpis';

  @override
  String get signMessageDescription =>
      'Podpíšte správu jednou z adries svojej peňaženky';

  @override
  String get signMessageHint => 'Zadajte správu na podpis';

  @override
  String get signMessageSignatureCopied => 'Podpis skopírovaný';

  @override
  String get signMessageSigned => 'Správa podpísaná';

  @override
  String get signMessageTooLong => 'Správa je príliš dlhá';

  @override
  String get seedInvalid => 'Seed is Invalid';

  @override
  String get nodeUnreachable =>
      'Nedá sa spojiť s vaším uzlom. Zostatky môžu byť zastarané.';

  @override
  String get nodeUnreachableRetry => 'Skúsiť znova';

  @override
  String get send => 'Send';

  @override
  String get sendConfirm => 'Send';

  @override
  String get sendError => 'An error occurred. Please try again';

  @override
  String get sendNote => 'NOTE';

  @override
  String get sendToAddressTitle => 'To';

  @override
  String get sendTxProgressDescription => 'Počkajte, kým sa transakcia odošle';

  @override
  String get sendTxProgressTitle => 'Odosielanie Transakcie';

  @override
  String get sending => 'Send';

  @override
  String get sent => 'Sent';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Set Password';

  @override
  String get setPasswordSuccess => 'Wallet password has been set';

  @override
  String get setWalletPassword => 'Set Wallet Password';

  @override
  String get settingsHeader => 'Settings';

  @override
  String get settingsTransfer => 'Load from Paper Wallet';

  @override
  String get setupFailedMessage => 'Something went wrong';

  @override
  String get shareHoosatMobile => 'Share Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Check out Hoosat Mobile Wallet';

  @override
  String get shareHoosatMobileText =>
      'Check out Hoosat Mobile - Hoosat Mobile Wallet.\nWebsite - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get systemDefault => 'System Default';

  @override
  String get tapToHide => 'Tap to hide';

  @override
  String get tapToReveal => 'Tap to reveal';

  @override
  String get themeDark => 'Tmavá Téma';

  @override
  String get themeHeader => 'Téma';

  @override
  String get themeLight => 'Svetlá Téma';

  @override
  String get toggleTheme => 'Prepnúť tému';

  @override
  String get thisWallet => '#This Wallet';

  @override
  String get to => 'To';

  @override
  String get toAddress => 'To Address';

  @override
  String get tooManyFailedAttempts => 'Too many failed unlock attempts.';

  @override
  String get totalValue => 'Total Value';

  @override
  String get transactionId => 'ID Transakcie';

  @override
  String get transactionsUppercase => 'TRANSAKCIE';

  @override
  String get transfer => 'Transfer';

  @override
  String get transferClose => 'Tap anywhere to close the window.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN successfully transferred to your Hoosat Mobile Wallet.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'A wallet with a balance of $amount HTN has been detected.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Tap confirm to transfer the funds.\n';

  @override
  String get transferConfirmInfoThird =>
      'Transfer may take several seconds to complete.';

  @override
  String get transferError =>
      'An error has occurred during the transfer. Please try again later.';

  @override
  String get transferHeader => 'Transfer Funds';

  @override
  String transferIntro(String button) {
    return 'This process will transfer the funds from a paper wallet to your Hoosat Mobile wallet.\n\nTap the \"$button\" button to start.';
  }

  @override
  String get transferLoading => 'Transferring';

  @override
  String get transferManualHint => 'Please enter the seed below.';

  @override
  String get transferNoFunds => 'This seed does not have any HTN on it';

  @override
  String get transferQrScanError =>
      'This QR code does not contain a valid seed.';

  @override
  String get transferQrScanHint => 'Vyhľadať Hoosat\nseed alebo privátny kľúč';

  @override
  String get unconfirmed => 'unconfirmed';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'unknown';

  @override
  String get unlock => 'Unlock';

  @override
  String get unlockBiometrics => 'Authenticate to Unlock Wallet';

  @override
  String get unlockPin => 'Enter PIN to Unlock Wallet';

  @override
  String get utxosUppercase => 'UTXO';

  @override
  String get viewAddress => 'View Address';

  @override
  String get viewTransaction => 'Zobraziť Transakciu';

  @override
  String get walletAddresses => 'Adresy Peňaženiek';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Meno peňaženky';

  @override
  String get walletNameDescription => 'Zadajte názov svojej peňaženky';

  @override
  String get walletNameHint => 'Názov Peňaženky';

  @override
  String get walletSetupAddressDiscovery => 'Running Address Discovery';

  @override
  String get walletSetupMessage => 'Setting up wallet';

  @override
  String get walletsTitle => 'Peňaženky';

  @override
  String get warning => 'Upozornenie';

  @override
  String welcomeMessage(String version) {
    return 'Welcome!\n\nThis is version $version of Hoosat Mobile - the mobile wallet for Hoosat';
  }

  @override
  String get welcomeText =>
      'Welcome to Hoosat Mobile. To begin, you may create a new wallet or import an existing one.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutes',
      one: '1 minute',
    );
    return 'After $_temp0';
  }

  @override
  String get yes => 'Áno';

  @override
  String get yesButton => 'Áno';

  @override
  String get yesUppercase => 'ÁNO';

  @override
  String get nodeNotSyncedException => 'Uzol nie je synchronizovaný';

  @override
  String get nodeNoUTXOIndexException => 'Uzol nemá index UTXO';

  @override
  String get nodeSecureConnection => 'Bezpečné pripojenie';

  @override
  String get hoosatUriInvalid => 'Neplatné Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Máte mnoho malých nevyčerpaných výstupov (UTXO). Konsolidácia ich zlúči na menší počet väčších UTXO, takže budúce odosielania budú rýchlejšie a môžu vyžadovať nižšie poplatky. Vznikne jedna alebo viac transakcií a budú účtované sieťové poplatky.';

  @override
  String get compoundUtxosDescription => 'Kombinácia viacerých UTXO do jedného';

  @override
  String get compoundUtxosConfirmation => 'Compound transactions?';

  @override
  String get compoundingUtxos => 'Compounding transactions';

  @override
  String get compoundingMessage => 'Čakajte prosím...';

  @override
  String get compoundSuccess => 'Compound successful';

  @override
  String get compoundFailure => 'Failed to compound transactions';

  @override
  String get fundsStillConfirmingTitle => 'Prostriedky sa stále potvrdzujú';

  @override
  String get fundsStillConfirmingBody =>
      'Časť prostriedkov na tomto účte bola prijatá príliš nedávno na to, aby sa dala odoslať – sieť najprv vyžaduje krátky čas dozrievania, zvyčajne niekoľko minút. Môžete počkať a skúsiť to znova, alebo odoslať z iného účtu, ktorý má dozreté prostriedky.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Prepnúť účet';

  @override
  String get compoundTooFewUtxos => 'Vyžadujú sa najmenej dve UTXO';

  @override
  String get moveToMain => 'Zhromaždiť na Hlavnom';

  @override
  String get moveToMainDescription =>
      'Presunúť zostatok všetkých ostatných adries na vašu hlavnú adresu';

  @override
  String get moveToMainConfirmation => 'Presunúť všetko na Hlavný?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Týmto presuniete $amount $symbol z $count ďalších adries na svoju hlavnú adresu. Vytvorí sa jedna alebo viac transakcií a účtujú sa sieťové poplatky.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Zostatok všetkých adries je už na Hlavnom';

  @override
  String get movingToMain => 'Zhromažďovanie na Hlavnom';

  @override
  String get moveToMainSuccess => 'Presun na Hlavný bol úspešný';

  @override
  String get moveToMainFailure => 'Presun na Hlavný zlyhal';

  @override
  String get moveToMainUppercased => 'PRESUNÚŤ';

  @override
  String get manageAccounts => 'Účty';

  @override
  String get manageAccountsDescription =>
      'Pridávajte pomenované adresy a spravujte ich';

  @override
  String get mainAccountLabel => 'Hlavný';

  @override
  String get archiveAction => 'Archivovať';

  @override
  String get restoreAction => 'Obnoviť';

  @override
  String get archivedAccountsHeader => 'Archivované';

  @override
  String get noAdditionalAccountsYet => 'Zatiaľ žiadne ďalšie účty';

  @override
  String get renameAccount => 'Premenovať účet';

  @override
  String get accountLabelHint => 'Názov účtu';

  @override
  String get saveUppercased => 'ULOŽIŤ';

  @override
  String get addUppercased => 'PRIDAŤ';

  @override
  String get sendFromLabel => 'Z';

  @override
  String get sendFromAny => 'Ľubovoľný';

  @override
  String get home => 'Domov';

  @override
  String get activity => 'Aktivita';

  @override
  String get totalBalance => 'Celkový zostatok';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Na utratenie teraz $spendable · Ešte prichádza $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Mince, ktoré ešte prichádzajú, sú vaše a čoskoro ich bude možné minúť.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Mince, ktoré ešte prichádzajú, bude možné minúť o $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Na utratenie teraz $amount. Zvyšok bude možné minúť o $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Na utratenie teraz $amount. Zvyšok ešte prichádza.';
  }

  @override
  String get txTagWaiting => 'čaká na prijatie';

  @override
  String get txTagStatusUnknown => 'stav neznámy';

  @override
  String get txTagNotAccepted => 'neprijaté';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'potvrdzovanie $n / $total';
  }

  @override
  String get submittedTo => 'Odoslané na';

  @override
  String get testConnection => 'Otestovať pripojenie';

  @override
  String get accountsOtherWalletHeader =>
      'Uložené z inej peňaženky (iba na zobrazenie)';

  @override
  String get accountsOtherWalletNote =>
      'Táto peňaženka ich nemôže minúť, preto sa nezapočítavajú do jej súčtu. Otvorte peňaženku, ku ktorej patria, aby ste ich mohli použiť.';

  @override
  String get noActivityTitle => 'Zatiaľ žiadna aktivita';

  @override
  String get txTypeSent => 'Odoslané';

  @override
  String get txTypeReceived => 'Prijaté';

  @override
  String get txTypeThisWallet => 'V rámci peňaženky';

  @override
  String get txTypeMerged => 'Zlúčené mince';

  @override
  String get noActivityMessage =>
      'Keď odošlete alebo prijmete HTN, zobrazí sa to tu.';

  @override
  String get seeAll => 'Zobraziť všetko';

  @override
  String get show => 'Zobraziť';

  @override
  String get myAccounts => 'Moje účty';

  @override
  String homeGreeting(String walletName) {
    return 'Ahoj, $walletName';
  }

  @override
  String get balance => 'Zostatok';

  @override
  String get maxSend => 'Max Send';

  @override
  String get compoundUppercased => 'ZLOŽIŤ';

  @override
  String get closeUppercased => 'ZAVRIEŤ';

  @override
  String get scanMoreAddresses => 'Vyhľadávanie Ďalších Adries';

  @override
  String get addressDiscovery => 'Address Discovery';

  @override
  String get scanningTitle => 'Vyhľadávanie';

  @override
  String get scanningDescription => 'Vyhľadávanie nových adries...';

  @override
  String get scanMore => 'VYHĽADAŤ VIAC';

  @override
  String get scanFailedMessage =>
      'Vyhľadávanie zlyhalo, skúste to prosím neskôr';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Current';

  @override
  String get scannedIndex => 'Naskenované';

  @override
  String get newIndex => 'New';

  @override
  String get addressFilterDialogTitle => 'Address Filter';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Zobraziť Všetky Adresy';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Zobraziť Adresy so Zostatkom';

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
  String get importOptionStandardWalletTitle =>
      'Importovať štandardnú peňaženku';

  @override
  String get importOptionStandardWalletDescription =>
      'Peňaženky s 12 alebo 24 slovami a štandardným odvodením, s voliteľnou frázou BIP39';

  @override
  String get importOptionLegacyWalletTitle => 'Importovať staršiu peňaženku';

  @override
  String get importOptionLegacyWalletDescription =>
      'Peňaženky s 12 slovami a starším odvodením, kompatibilné so starým Web Wallet a KDX';

  @override
  String get importOptionKpubTitle => 'Import Watch Only Wallet';

  @override
  String get importOptionKpubDescription =>
      'Monitor the balance and transactions of a wallet using an extended public key';

  @override
  String get importKpub => 'Import Watch Only Wallet';

  @override
  String get importKpubHint => 'Zadajte prosím svoj rozšírený verejný kľúč.';

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
  String get changeAddressModeTitle => 'Správanie adresy pre drobné';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Každá adresa si ponechá svoj zostatok a drobné zostanú na mieste';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Zakaždým sa použije nová adresa (súkromne, zostatok sa rozptýli)';

  @override
  String get changeAddressModeDialogTitle => 'Správanie adresy pre drobné';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Ponechať zostatky na každej adrese';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Súkromné';

  @override
  String get requestPasswordHeader => 'Žiadať heslo';

  @override
  String get requestPasswordAtLaunch => 'Pri spustení';

  @override
  String get requestPasswordWhenLocked => 'Pri uzamknutí';

  @override
  String get requestPasswordWhenSigning => 'Pri podpisovaní';

  @override
  String get importWalletAdvancedOptions => 'Rozšírené možnosti';

  @override
  String get bip39Passphrase => 'Fráza BIP39';

  @override
  String get bip39PassphraseWarning =>
      'POZNÁMKA: Toto nie je heslo peňaženky – rôzne frázy BIP39 otvárajú rôzne peňaženky.';

  @override
  String get bip39PassphraseEnter => 'Zadajte frázu';

  @override
  String get bip39PassphraseConfirm => 'Potvrďte frázu';

  @override
  String get bip39PassphraseMismatch => 'Frázy sa nezhodujú!';

  @override
  String get bip39PassphraseNote => 'Peňaženka s frázou BIP39.';

  @override
  String get feePriorityHint => 'Zadajte prioritný poplatok';

  @override
  String get feeBaseUppercase => 'ZÁKLADNÝ POPLATOK';

  @override
  String get feePriorityUppsercase => 'PRIORITNÝ POPLATOK';

  @override
  String get feeUpdateAddressError => 'Cieľovú adresu sa nepodarilo rozpoznať';

  @override
  String get feeUpdateRebuildError => 'Transakciu sa nepodarilo znova zostaviť';

  @override
  String get feeUpdateRebuildError2 =>
      'Transakciu sa nepodarilo znova zostaviť s novým poplatkom';

  @override
  String get feeUpdateError => 'Poplatok sa nepodarilo aktualizovať';

  @override
  String get feeUpdate => 'Aktualizovať poplatok';

  @override
  String get feeUpdateTitle => 'Aktualizácia poplatku';

  @override
  String get feeSheetRecommendedPriority => 'Odporúčané prioritné poplatky';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Nový prioritný poplatok musí byť aspoň $amount $symbol';
  }

  @override
  String get txPending => 'ČAKÁ';

  @override
  String get txPendingMessage => 'Táto transakcia čaká';

  @override
  String get txPendingTitle => 'Čakajúca transakcia';

  @override
  String get txPendingContent => 'V mempoole sú čakajúce transakcie.';

  @override
  String get txPendingActionUpdateFee => 'Aktualizovať poplatok transakcie';

  @override
  String get txPendingActionRbf => 'Nahradiť poplatkom (RBF)';

  @override
  String get txInMempool => 'v mempoole';

  @override
  String get utxoSelectionTitle => 'Vybrať UTXO';

  @override
  String get utxoSelectionHint => 'Vyberte viac UTXO';
}
