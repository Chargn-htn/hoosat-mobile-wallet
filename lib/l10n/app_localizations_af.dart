// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get account => 'Account';

  @override
  String get accounts => 'Accounts';

  @override
  String get ackBackedUp =>
      'Are you sure that you\'ve backed up your secret phrase?';

  @override
  String get add => 'Add';

  @override
  String get addAccount => 'Add Account';

  @override
  String get addContact => 'Add Contact';

  @override
  String get addNode => 'Add Node';

  @override
  String get addNodeFailed => 'Failed to add Hoosat node';

  @override
  String addNodeFailedMessage(String error) {
    return 'Failed: $error';
  }

  @override
  String get addNodeSuccess => 'Node Added Successfully';

  @override
  String get addingNodeMessage => 'Please wait while contacting node';

  @override
  String get addingNodeTitle => 'Adding Node';

  @override
  String get address => 'Address';

  @override
  String get addressCopied => 'Address Copied';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'Enter Address';

  @override
  String get addressMising => 'Please Enter an Address';

  @override
  String get addressShare => 'Share Address';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Advanced';

  @override
  String get amount => 'Amount';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Amount $amount $coin';
  }

  @override
  String get amountMissing => 'Please Enter an Amount';

  @override
  String get amountZero => 'Amount can\'t be zero';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get authBiometricMessage => 'Authenticate to Add Wallet';

  @override
  String get authMethod => 'Authentication Method';

  @override
  String get authPinMessage => 'Enter PIN to Add Wallet';

  @override
  String get autoLockHeader => 'Automatically Lock';

  @override
  String get available => 'Available';

  @override
  String get back => 'Terug';

  @override
  String get backupConfirmButton => 'I\'ve Backed It Up';

  @override
  String get backupSecretPhrase => 'Backup Secret Phrase';

  @override
  String get missingSecretPhrase => 'Geheime frase ontbreek';

  @override
  String get biometricsMethod => 'Biometrics';

  @override
  String get blockExplorer => 'Block Explorer';

  @override
  String get cancel => 'Cancel';

  @override
  String get change => 'Change';

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
  String get close => 'Close';

  @override
  String get confirm => 'Confirm';

  @override
  String get confirmPasswordHint => 'Confirm the password';

  @override
  String confirmations(String confirmations) {
    return '$confirmations confirmations';
  }

  @override
  String get confirmed => 'confirmed';

  @override
  String get confirmedMaturing => 'bevestig · verryp';

  @override
  String get confirming => 'confirming';

  @override
  String contactAdded(String contactName) {
    return '$contactName added to contacts';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address address copied';
  }

  @override
  String get contactExists => 'Contact Already Exists';

  @override
  String get contactHeader => 'Contact';

  @override
  String get contactInvalid => 'Invalid Contact Name';

  @override
  String get contactNameHint => 'Enter a Name @';

  @override
  String get contactNameMissing => 'Choose a Name for this Contact';

  @override
  String contactRemoved(String contactName) {
    return '$contactName has been removed from contacts!';
  }

  @override
  String get contactsHeader => 'Contacts';

  @override
  String get contactsImportErr => 'Failed to import contacts';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Sucessfully imported $noContacts contacts';
  }

  @override
  String get copied => 'Copied';

  @override
  String get copy => 'Copy';

  @override
  String get copyAddress => 'Copy Address';

  @override
  String get copyErrorButton => 'Copy Error';

  @override
  String get createAPasswordHeader => 'Create a password.';

  @override
  String get createPasswordFirstParagraph =>
      'You can create a password to add additional security to your wallet.';

  @override
  String get createPasswordHint => 'Create a password';

  @override
  String get createPasswordSecondParagraph =>
      'Password is optional, and your wallet will be protected with your PIN or biometrics regardless.';

  @override
  String get createPasswordSheetHeader => 'Create';

  @override
  String get currency => 'Currency';

  @override
  String get currencyPoweredBy => 'Powered by CoinGecko';

  @override
  String get defaultAccountName => 'Address 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Receive $addressIndex';
  }

  @override
  String get defaultWalletName => 'My Wallet';

  @override
  String get disablePasswordSheetHeader => 'Disable';

  @override
  String get disablePasswordSuccess => 'Password has been disabled';

  @override
  String get disableWalletPassword => 'Disable Wallet Password';

  @override
  String get doContinue => 'Continue';

  @override
  String get donate => 'Donate';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Don\'t show again';

  @override
  String get emptyCardIntroUtxos =>
      'This is the UTXOs tab. All UTXOs in your wallet will appear here';

  @override
  String get emptyResult => 'Empty Result';

  @override
  String get emptyWalletName => 'Wallet Name cannot be empty';

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
  String get fetchingTransactions => 'Fetching Transactions';

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
      'You don\'t have enough HTN for this transaction';

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
  String get language => 'Language';

  @override
  String get loadingTransactions => 'Loading Transactions...';

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
  String get networkHeader => 'Network';

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
  String get nodeNameEmpty => 'Node name cannot be empty';

  @override
  String get nodeNameHint => 'Enter Node Name';

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
    return 'Are you sure you want to delete $contactName?';
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
  String get scanQrCode => 'Scan QR Code';

  @override
  String get scanQrCodeError => 'Failed to parse qr code';

  @override
  String get scanFromImage => 'Skandeer vanaf prent';

  @override
  String get toggleFlash => 'Skakel flits aan/af';

  @override
  String get riskDisclosureHeader => 'Voordat jy begin';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet is \'n nie-bewarende (non-custodial) beursie. Jou geheime frase en private sleutels word slegs op hierdie toestel geskep en gestoor — ons sien dit nooit, stoor dit nie op enige bediener nie en kan dit nie vir jou herstel nie.';

  @override
  String get riskDisclosureWarning =>
      'As jy jou geheime frase verloor, is daar geen wagwoordterugstelling nie en geen ondersteuningspan wat jou fondse kan terugkry nie. Jy alleen is verantwoordelik daarvoor om dit veilig te hou.';

  @override
  String get riskDisclosureAccept => 'Ek verstaan, gaan voort';

  @override
  String get secretInfo =>
      'In the next screen, you will see your secret phrase. It is a password to access your funds. It is crucial that you back it up and never share it with anyone.';

  @override
  String get secretInfoHeader => 'Safety First!';

  @override
  String get secretPhrase => 'Secret Phrase';

  @override
  String get verifyBackupTitle => 'Verifieer jou rugsteun';

  @override
  String get verifyBackupInstruction =>
      'Kies die korrekte woord vir elke posisie om te bevestig dat jy jou geheime frase gestoor het.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Wat is woord #$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Dit is nie heeltemal reg nie. Gaan jou rugsteun na en probeer weer.';

  @override
  String get secretPhrase12Words => '12 woorde';

  @override
  String get secretPhrase24Words => '24 woorde';

  @override
  String get secretWarning =>
      'If you lose your device or uninstall the application, you\'ll need your secret phrase to recover your funds!';

  @override
  String get securityHeader => 'Security';

  @override
  String get securitySettingsBiometrics =>
      'Verifieer om toegang tot sekuriteitsinstellings te kry';

  @override
  String get securitySettingsPin =>
      'Voer PIN in om toegang tot sekuriteitsinstellings te kry';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Onderteken boodskap';

  @override
  String get signMessageCopySignature => 'Kopieer handtekening';

  @override
  String get signMessageDescription =>
      'Onderteken \'n boodskap met een van jou beursie-adresse';

  @override
  String get signMessageHint => 'Voer \'n boodskap in om te onderteken';

  @override
  String get signMessageSignatureCopied => 'Handtekening gekopieer';

  @override
  String get signMessageSigned => 'Boodskap onderteken';

  @override
  String get signMessageTooLong => 'Boodskap is te lank';

  @override
  String get seedInvalid => 'Seed is Invalid';

  @override
  String get nodeUnreachable =>
      'Kan nie jou node bereik nie. Saldo\'s kan verouderd wees.';

  @override
  String get nodeUnreachableRetry => 'Probeer weer';

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
  String get sendTxProgressDescription =>
      'Please wait while the transaction is sent';

  @override
  String get sendTxProgressTitle => 'Sending Transaction';

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
  String get themeDark => 'Dark Theme';

  @override
  String get themeHeader => 'Theme';

  @override
  String get themeLight => 'Light Theme';

  @override
  String get toggleTheme => 'Wissel tema';

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
  String get transactionId => 'Transaction ID';

  @override
  String get transactionsUppercase => 'TRANSACTIONS';

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
  String get transferQrScanHint => 'Scan a Hoosat \nseed or private key';

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
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'View Address';

  @override
  String get viewTransaction => 'View Transaction';

  @override
  String get walletAddresses => 'Wallet Addresses';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Wallet name';

  @override
  String get walletNameDescription => 'Enter a name for your wallet';

  @override
  String get walletNameHint => 'Wallet Name';

  @override
  String get walletSetupAddressDiscovery => 'Running Address Discovery';

  @override
  String get walletSetupMessage => 'Setting up wallet';

  @override
  String get walletsTitle => 'Wallets';

  @override
  String get warning => 'Warning';

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
  String get yes => 'Yes';

  @override
  String get yesButton => 'Yes';

  @override
  String get yesUppercase => 'YES';

  @override
  String get nodeNotSyncedException => 'Node is not synced';

  @override
  String get nodeNoUTXOIndexException => 'Node does not have UTXO index';

  @override
  String get nodeSecureConnection => 'Secure connection';

  @override
  String get hoosatUriInvalid => 'Invalid Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Jy het baie klein onbestede uitsette (UTXO). Konsolidering sal dit saamvoeg in minder, groter UTXO\'s sodat toekomstige stuuraksies vinniger is en moontlik laer fooie vereis. Dit skep een of meer transaksies en sal netwerkfooie meebring.';

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
  String get fundsStillConfirmingTitle => 'Fondse word nog bevestig';

  @override
  String get fundsStillConfirmingBody =>
      'Sommige fondse op hierdie rekening is te onlangs ontvang om al gestuur te word — die netwerk vereis eers \'n kort verrypingstyd, gewoonlik \'n paar minute. Jy kan wag en weer probeer, of stuur vanaf \'n ander rekening wat ryp fondse het.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Wissel rekening';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Versamel op Hoof';

  @override
  String get moveToMainDescription =>
      'Skuif die saldo van alle ander adresse na jou hoofadres';

  @override
  String get moveToMainConfirmation => 'Skuif alles na Hoof?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Dit sal $amount $symbol van $count ander adres(se) na jou hoofadres skuif. Een of meer transaksies word geskep en netwerkfooie is van toepassing.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Die saldo van alle adresse is reeds op Hoof';

  @override
  String get movingToMain => 'Versamel tans op Hoof';

  @override
  String get moveToMainSuccess => 'Skuif na Hoof suksesvol';

  @override
  String get moveToMainFailure => 'Kon nie na Hoof skuif nie';

  @override
  String get moveToMainUppercased => 'SKUIF';

  @override
  String get manageAccounts => 'Rekeninge';

  @override
  String get manageAccountsDescription =>
      'Voeg benoemde adresse by en bestuur hulle';

  @override
  String get mainAccountLabel => 'Hoof';

  @override
  String get archiveAction => 'Argiveer';

  @override
  String get restoreAction => 'Herstel';

  @override
  String get archivedAccountsHeader => 'Geargiveer';

  @override
  String get noAdditionalAccountsYet => 'Nog geen bykomende rekeninge nie';

  @override
  String get renameAccount => 'Hernoem rekening';

  @override
  String get accountLabelHint => 'Rekeningnaam';

  @override
  String get saveUppercased => 'STOOR';

  @override
  String get addUppercased => 'VOEG BY';

  @override
  String get sendFromLabel => 'Van';

  @override
  String get sendFromAny => 'Enige';

  @override
  String get home => 'Tuis';

  @override
  String get activity => 'Aktiwiteit';

  @override
  String get totalBalance => 'Totale saldo';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Nou beskikbaar $spendable · Nog op pad $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Munte wat nog aankom, is joune en kan binnekort bestee word.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Die munte wat nog aankom, kan oor $time bestee word.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Nou beskikbaar $amount. Die res kan oor $time bestee word.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Nou beskikbaar $amount. Die res is nog op pad.';
  }

  @override
  String get txTagWaiting => 'wag om aanvaar te word';

  @override
  String get txTagStatusUnknown => 'status onbekend';

  @override
  String get txTagNotAccepted => 'nie aanvaar nie';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'bevestig $n / $total';
  }

  @override
  String get submittedTo => 'Ingedien by';

  @override
  String get testConnection => 'Toets verbinding';

  @override
  String get accountsOtherWalletHeader =>
      'Gestoor vanaf \'n ander beursie (net kyk)';

  @override
  String get accountsOtherWalletNote =>
      'Hierdie beursie kan dit nie bestee nie, so dit tel nie by sy totaal nie. Maak die beursie oop waaraan dit behoort om dit te gebruik.';

  @override
  String get noActivityTitle => 'Nog geen aktiwiteit nie';

  @override
  String get txTypeSent => 'Gestuur';

  @override
  String get txTypeReceived => 'Ontvang';

  @override
  String get txTypeThisWallet => 'Binne beursie';

  @override
  String get txTypeMerged => 'Saamgevoegde munte';

  @override
  String get noActivityMessage =>
      'Wanneer jy HTN stuur of ontvang, verskyn dit hier.';

  @override
  String get seeAll => 'Sien alles';

  @override
  String get show => 'Wys';

  @override
  String get myAccounts => 'My rekeninge';

  @override
  String homeGreeting(String walletName) {
    return 'Hallo, $walletName';
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
  String get importOptionStandardWalletTitle => 'Voer standaardbeursie in';

  @override
  String get importOptionStandardWalletDescription =>
      'Beursies met 12 of 24 woorde en standaardafleiding, met opsionele BIP39-wagfrase';

  @override
  String get importOptionLegacyWalletTitle => 'Voer ouer beursie in';

  @override
  String get importOptionLegacyWalletDescription =>
      'Beursies met 12 woorde en ouer afleiding, versoenbaar met die ou Web Wallet en KDX';

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
  String get changeAddressModeTitle => 'Gedrag van kleingeldadres';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Elke adres hou sy eie saldo, en die kleingeld bly waar dit is';

  @override
  String get changeAddressModeDescriptionPrivate =>
      '\'n Nuwe adres word elke keer gebruik (privaat, saldo versprei)';

  @override
  String get changeAddressModeDialogTitle => 'Gedrag van kleingeldadres';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Hou saldo\'s op elke adres';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privaat';

  @override
  String get requestPasswordHeader => 'Vra wagwoord';

  @override
  String get requestPasswordAtLaunch => 'By opstart';

  @override
  String get requestPasswordWhenLocked => 'Wanneer gesluit';

  @override
  String get requestPasswordWhenSigning => 'By ondertekening';

  @override
  String get importWalletAdvancedOptions => 'Gevorderde opsies';

  @override
  String get bip39Passphrase => 'BIP39-wagfrase';

  @override
  String get bip39PassphraseWarning =>
      'LET WEL: Dit is nie \'n beursie-wagwoord nie; verskillende BIP39-wagfrases maak verskillende beursies oop.';

  @override
  String get bip39PassphraseEnter => 'Voer wagfrase in';

  @override
  String get bip39PassphraseConfirm => 'Bevestig wagfrase';

  @override
  String get bip39PassphraseMismatch => 'Wagfrases stem nie ooreen nie!';

  @override
  String get bip39PassphraseNote => 'Beursie met BIP39-wagfrase.';

  @override
  String get feePriorityHint => 'Voer prioriteitsfooi in';

  @override
  String get feeBaseUppercase => 'BASIESE FOOI';

  @override
  String get feePriorityUppsercase => 'PRIORITEITSFOOI';

  @override
  String get feeUpdateAddressError => 'Kon nie bestemmingsadres herken nie';

  @override
  String get feeUpdateRebuildError => 'Kon nie transaksie herbou nie';

  @override
  String get feeUpdateRebuildError2 =>
      'Kon nie transaksie met nuwe fooi herbou nie';

  @override
  String get feeUpdateError => 'Kon nie fooi opdateer nie';

  @override
  String get feeUpdate => 'Dateer fooi op';

  @override
  String get feeUpdateTitle => 'Dateer tans fooi op';

  @override
  String get feeSheetRecommendedPriority => 'Aanbevole prioriteitsfooie';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Nuwe prioriteitsfooi moet ten minste $amount $symbol wees';
  }

  @override
  String get txPending => 'HANGENDE';

  @override
  String get txPendingMessage => 'Hierdie transaksie is hangende';

  @override
  String get txPendingTitle => 'Hangende transaksie';

  @override
  String get txPendingContent => 'Daar is hangende transaksies in die mempool.';

  @override
  String get txPendingActionUpdateFee => 'Dateer transaksiefooi op';

  @override
  String get txPendingActionRbf => 'Vervang met fooi (RBF)';

  @override
  String get txInMempool => 'in mempool';

  @override
  String get utxoSelectionTitle => 'Kies UTXO\'s';

  @override
  String get utxoSelectionHint => 'Kies meer UTXO\'s';
}
