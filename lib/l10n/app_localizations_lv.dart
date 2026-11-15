// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get account => 'Konts';

  @override
  String get accounts => 'Konti';

  @override
  String get ackBackedUp =>
      'Vai esat drošs ka izveidojāt rezerves kopiju slepenajai frāzei vai privātajai atslēgai?';

  @override
  String get add => 'Add';

  @override
  String get addAccount => 'Pievienot kontu';

  @override
  String get addContact => 'Pievienot kontaktu';

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
  String get addressCopied => 'Adrese nokopēta';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'Enter Address';

  @override
  String get addressMising => 'Lūdzu ievadiet adresi';

  @override
  String get addressShare => 'Kopīgot adresi';

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
  String get amountMissing => 'Lūdzu ievadiet daudzumu';

  @override
  String get amountZero => 'Amount can\'t be zero';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get authBiometricMessage => 'Authenticate to Add Wallet';

  @override
  String get authMethod => 'Autentificēšanās metode';

  @override
  String get authPinMessage => 'Enter PIN to Add Wallet';

  @override
  String get autoLockHeader => 'Automātiski aizslēgt';

  @override
  String get available => 'Available';

  @override
  String get back => 'Atpakaļ';

  @override
  String get backupConfirmButton => 'Esmu izveidojis rezerves kopiju';

  @override
  String get backupSecretPhrase => 'Backup Secret Phrase';

  @override
  String get missingSecretPhrase => 'Trūkst slepenās frāzes';

  @override
  String get biometricsMethod => 'Biometriskā atpazīšana';

  @override
  String get blockExplorer => 'Block Explorer';

  @override
  String get cancel => 'Atcelt';

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
  String get close => 'Aizvērt';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get confirmPasswordHint => 'Confirm the password';

  @override
  String confirmations(String confirmations) {
    return '$confirmations confirmations';
  }

  @override
  String get confirmed => 'confirmed';

  @override
  String get confirmedMaturing => 'apstiprināts · nogatavojas';

  @override
  String get confirming => 'confirming';

  @override
  String contactAdded(String contactName) {
    return '$contactName pievienots kontaktiem.';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address address copied';
  }

  @override
  String get contactExists => 'Kontakts jau eksistē';

  @override
  String get contactHeader => 'Kontakts';

  @override
  String get contactInvalid => 'Nederīgs kontakta nosaukums';

  @override
  String get contactNameHint => 'Ievadiet nosaukumu @';

  @override
  String get contactNameMissing => 'Izvēlieties kontakta nosaukumu';

  @override
  String contactRemoved(String contactName) {
    return '$contactName dzēsts no kontaktiem!';
  }

  @override
  String get contactsHeader => 'Kontakti';

  @override
  String get contactsImportErr => 'Neizdevās importēt kontaktus';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Sekmīgi importēti $noContacts kontakti.';
  }

  @override
  String get copied => 'Nokopēts';

  @override
  String get copy => 'Kopēt';

  @override
  String get copyAddress => 'Kopēt adresi';

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
  String get defaultAccountName => 'Pamata konts';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Konts $addressIndex';
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
  String get enterAddress => 'Ievadiet adresi';

  @override
  String get enterAmount => 'Ievadiet daudzumu';

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
      'Sveicināti Hoosat Mobile. Tiklīdz saņemsiet HTN, transakcijas būs redzamas šādi:';

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
  String get fingerprintSeedBackup => 'Autorizējieties, lai kopētu sēklu.';

  @override
  String get goBackButton => 'Go Back';

  @override
  String get gotItButton => 'Sapratu!';

  @override
  String get import => 'Importēt';

  @override
  String get importSecretPhrase => 'Importēt slepeno frāzi';

  @override
  String get importSecretPhraseHint =>
      'Lūdzu ievadiet jūsu 24 vārdu slepeno frāzi. Katram vārdam jābūt atdalītam ar atstarpi.';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'Importēt maku';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'Uzreiz';

  @override
  String get insufficientBalance => 'Nepietiek līdzekļu';

  @override
  String get insufficientBalanceDetails =>
      'You don\'t have enough HTN for this transaction';

  @override
  String get invalidAddress => 'Ievadītā adrese nav derīga';

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
  String get language => 'Valoda';

  @override
  String get loadingTransactions => 'Loading Transactions...';

  @override
  String get lockAppSetting => 'Autentificēties palaižot';

  @override
  String get locked => 'Aizslēgts';

  @override
  String get loggingOutMessage => 'Logging out...';

  @override
  String get logout => 'Iziet';

  @override
  String get logoutDialogContent =>
      'Are you sure you want to logout from this wallet?';

  @override
  String get logoutOrSwitchWallet => 'Logout / Switch Wallet';

  @override
  String get manage => 'Pārvaldīt';

  @override
  String get manualEntry => 'Manuālā ievade';

  @override
  String get networkHeader => 'Network';

  @override
  String get newAddress => 'New Address';

  @override
  String get newWallet => 'Jauns maks';

  @override
  String get nextButton => 'Next';

  @override
  String get no => 'Nē';

  @override
  String get noContactsExport => 'Nav kontaktu ko eksportēt.';

  @override
  String get noContactsImport => 'Nav jauni kontakti, ko importēt.';

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
  String get off => 'Izslēgts';

  @override
  String get on => 'Ieslēgts';

  @override
  String get paperWallet => 'Papīra maks';

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
  String get pinConfirmError => 'PIN nesakrīt';

  @override
  String get pinConfirmTitle => 'Apstipriniet savu PIN';

  @override
  String get pinCreateTitle => 'Izveidojiet sešu ciparu PIN';

  @override
  String get pinEnterTitle => 'Ievadiet PIN';

  @override
  String get pinInvalid => 'Nepareizs PIN';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'Ievadiet PIN, lai kopētu sēklu';

  @override
  String get preferences => 'Preferences';

  @override
  String get privacyPolicy => 'Privātuma politika';

  @override
  String get qrInvalidAddress => 'QR code does not contain a valid address';

  @override
  String get qrInvalidSeed =>
      'QR kods nesatur derīgu sēklu vai privāto atslēgu';

  @override
  String get qrMnemonicError => 'QR kods nesatur derīgu slepeno frāzi';

  @override
  String get receive => 'Saņemt';

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
  String get received => 'Saņemtie';

  @override
  String get removeContact => 'Dzēst kontaktu';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Vai esat drošs, ka vēlaties dzēst kontaktu $contactName?';
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
  String get scanQrCode => 'Skenēt QR kodu';

  @override
  String get scanQrCodeError => 'Failed to parse qr code';

  @override
  String get scanFromImage => 'Skenēt no attēla';

  @override
  String get toggleFlash => 'Ieslēgt/izslēgt lukturīti';

  @override
  String get riskDisclosureHeader => 'Pirms sākat';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet ir nekustodiāls maks. Jūsu slepenā frāze un privātās atslēgas tiek izveidotas un glabātas tikai šajā ierīcē — mēs tās nekad neredzam, neglabājam nevienā serverī un nevaram tās atjaunot jūsu vietā.';

  @override
  String get riskDisclosureWarning =>
      'Ja pazaudēsiet slepeno frāzi, paroles atiestatīšana nav iespējama un neviena atbalsta komanda nevar atgūt jūsu līdzekļus. Par tās drošu glabāšanu atbildat tikai jūs.';

  @override
  String get riskDisclosureAccept => 'Saprotu, turpināt';

  @override
  String get secretInfo =>
      'Nākamajā sadaļā redzēsiet jūsu slepeno frāzi. Tā ir parole ar kuru varat piekļūt jūsu līdzekļiem. Ir ārkārtīgi svarīgi izveidot rezerves kopiju un turēt to noslēpumā.';

  @override
  String get secretInfoHeader => 'Drošība pirmajā vietā!';

  @override
  String get secretPhrase => 'Slepenā frāze';

  @override
  String get verifyBackupTitle => 'Pārbaudiet rezerves kopiju';

  @override
  String get verifyBackupInstruction =>
      'Izvēlieties pareizo vārdu katrai pozīcijai, lai apstiprinātu, ka slepenā frāze ir saglabāta.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Kāds ir vārds Nr. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Ne gluži pareizi. Pārbaudiet rezerves kopiju un mēģiniet vēlreiz.';

  @override
  String get secretPhrase12Words => '12 vārdi';

  @override
  String get secretPhrase24Words => '24 vārdi';

  @override
  String get secretWarning =>
      'Gadījumā, ja nozaudējat telefonu, vai atinstalējat šo aplikāciju, jums būs nepieciešama slepenā frāze, vai privātā atslēga, lai piekļūtu jūsu līdzekļiem!';

  @override
  String get securityHeader => 'Drošība';

  @override
  String get securitySettingsBiometrics =>
      'Autentificējieties, lai piekļūtu drošības iestatījumiem';

  @override
  String get securitySettingsPin =>
      'Ievadiet PIN, lai piekļūtu drošības iestatījumiem';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Parakstīt ziņojumu';

  @override
  String get signMessageCopySignature => 'Kopēt parakstu';

  @override
  String get signMessageDescription =>
      'Parakstiet ziņojumu ar vienu no sava maka adresēm';

  @override
  String get signMessageHint => 'Ievadiet ziņojumu, ko parakstīt';

  @override
  String get signMessageSignatureCopied => 'Paraksts nokopēts';

  @override
  String get signMessageSigned => 'Ziņojums parakstīts';

  @override
  String get signMessageTooLong => 'Ziņojums ir pārāk garš';

  @override
  String get seedInvalid => 'Sēkla nav derīga';

  @override
  String get nodeUnreachable =>
      'Nevar sasniegt jūsu mezglu. Atlikumi var būt novecojuši.';

  @override
  String get nodeUnreachableRetry => 'Mēģināt vēlreiz';

  @override
  String get send => 'Sūtīt';

  @override
  String get sendConfirm => 'Send';

  @override
  String get sendError => 'Notika kļūda. Pēc laika mēģiniet atkal.';

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
  String get sending => 'Sūta';

  @override
  String get sent => 'Nosūtītie';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Set Password';

  @override
  String get setPasswordSuccess => 'Wallet password has been set';

  @override
  String get setWalletPassword => 'Set Wallet Password';

  @override
  String get settingsHeader => 'Iestatījumi';

  @override
  String get settingsTransfer => 'Ielādēt no papīra maka';

  @override
  String get setupFailedMessage => 'Something went wrong';

  @override
  String get shareHoosatMobile => 'Dalīties ar Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Check out Hoosat Mobile Wallet';

  @override
  String get shareHoosatMobileText =>
      'Uzmet aci Hoosat Mobile! Izcils HTN viedais maks!';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get systemDefault => 'Noklusētie iestatījumi';

  @override
  String get tapToHide => 'Pieskaries, lai paslēptu';

  @override
  String get tapToReveal => 'Pieskaries, lai parādītu';

  @override
  String get themeDark => 'Dark Theme';

  @override
  String get themeHeader => 'Motīvs';

  @override
  String get themeLight => 'Light Theme';

  @override
  String get toggleTheme => 'Pārslēgt motīvu';

  @override
  String get thisWallet => '#This Wallet';

  @override
  String get to => 'Adresāts';

  @override
  String get toAddress => 'To Address';

  @override
  String get tooManyFailedAttempts => 'Pārāk daudz atslēgšanas mēģinājumi.';

  @override
  String get totalValue => 'Total Value';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get transactionsUppercase => 'TRANSACTIONS';

  @override
  String get transfer => 'Pārsūtīt';

  @override
  String get transferClose => 'Pieskarieties jebkur, lai aizvērtu.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN sekmīgi pārskaitīti uz jūsu Hoosat Mobile maku.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Maks ar $amount HTN bilanci ir atrasts.\n';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Pieskarieties, lai apstiprinātu līdzekļu pārskaitīšanu.\n';

  @override
  String get transferConfirmInfoThird =>
      'Pārskaitīšana var prasīt vairākas sekundes.';

  @override
  String get transferError =>
      'Pārsūtīšanas laikā notika kļūda. Lūdzu vēlāk mēģiniet vēlreiz.';

  @override
  String get transferHeader => 'Pārsūtīt līdzekļus';

  @override
  String transferIntro(String button) {
    return 'Šis process pārskaitīs jūsu papīra maka līdzekļus uz jūsu Hoosat Mobile maku.\n\nPieskaries \"$button\" pogai, lai sāktu.';
  }

  @override
  String get transferLoading => 'Pārsūta';

  @override
  String get transferManualHint => 'Lūdzu, zemāk ievadiet sēklu';

  @override
  String get transferNoFunds => 'Šai sēklai nav piesaistīti līdzekļi';

  @override
  String get transferQrScanError => 'Šis QR kods nesatur derīgu sēklu';

  @override
  String get transferQrScanHint => 'Skenē Hoosat \nsēklu vai privāto atslēgu';

  @override
  String get unconfirmed => 'unconfirmed';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'unknown';

  @override
  String get unlock => 'Atslēgt';

  @override
  String get unlockBiometrics => 'Autorizējieties, lai piekļūtu Hoosat Mobile';

  @override
  String get unlockPin => 'Ievadiet PIN, lai piekļūtu Hoosat Mobile';

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
  String get warning => 'Brīdinājums';

  @override
  String welcomeMessage(String version) {
    return 'Welcome!\n\nThis is version $version of Hoosat Mobile - the mobile wallet for Hoosat';
  }

  @override
  String get welcomeText =>
      'Sveicināti Hoosat Mobile. Izveidojiet jaunu maku vai importējiet eksistējošu';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minūtēm',
      one: '1 minūtes',
    );
    return 'Pēc $_temp0';
  }

  @override
  String get yes => 'Jā';

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
      'Jums ir daudz mazu neiztērētu izlažu (UTXO). Konsolidācija tos apvienos mazākā skaitā lielāku UTXO, lai turpmākie sūtījumi būtu ātrāki un, iespējams, ar zemākām komisijām. Tas izveido vienu vai vairākus darījumus un rada tīkla maksas.';

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
  String get fundsStillConfirmingTitle => 'Līdzekļi vēl tiek apstiprināti';

  @override
  String get fundsStillConfirmingBody =>
      'Daļa līdzekļu šajā kontā tika saņemta pārāk nesen, lai tos varētu nosūtīt — tīkls vispirms pieprasa īsu nogatavošanās laiku, parasti dažas minūtes. Varat uzgaidīt un mēģināt vēlreiz vai nosūtīt no cita konta, kurā ir nogatavojušies līdzekļi.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Mainīt kontu';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Apkopot Galvenajā';

  @override
  String get moveToMainDescription =>
      'Pārvietot visu pārējo adrešu atlikumu uz savu galveno adresi';

  @override
  String get moveToMainConfirmation => 'Pārvietot visu uz Galveno?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Tas pārvietos $amount $symbol no $count citām adresēm uz jūsu galveno adresi. Tiks izveidots viens vai vairāki darījumi, un tiks piemērota tīkla komisija.';
  }

  @override
  String get moveToMainNothingToMove => 'Visu adrešu atlikums jau ir Galvenajā';

  @override
  String get movingToMain => 'Apkopošana Galvenajā';

  @override
  String get moveToMainSuccess => 'Pārvietošana uz Galveno veiksmīga';

  @override
  String get moveToMainFailure => 'Neizdevās pārvietot uz Galveno';

  @override
  String get moveToMainUppercased => 'PĀRVIETOT';

  @override
  String get manageAccounts => 'Konti';

  @override
  String get manageAccountsDescription =>
      'Pievienojiet un pārvaldiet nosauktas adreses';

  @override
  String get mainAccountLabel => 'Galvenais';

  @override
  String get archiveAction => 'Arhivēt';

  @override
  String get restoreAction => 'Atjaunot';

  @override
  String get archivedAccountsHeader => 'Arhivēti';

  @override
  String get noAdditionalAccountsYet => 'Papildu kontu vēl nav';

  @override
  String get renameAccount => 'Pārdēvēt kontu';

  @override
  String get accountLabelHint => 'Konta nosaukums';

  @override
  String get saveUppercased => 'SAGLABĀT';

  @override
  String get addUppercased => 'PIEVIENOT';

  @override
  String get sendFromLabel => 'No';

  @override
  String get sendFromAny => 'Jebkurš';

  @override
  String get home => 'Sākums';

  @override
  String get activity => 'Aktivitāte';

  @override
  String get totalBalance => 'Kopējais atlikums';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Tērējams tagad $spendable · Vēl ceļā $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Monētas, kas vēl ir ceļā, pieder jums, un tās drīz varēs iztērēt.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Monētas, kas vēl ir ceļā, varēs iztērēt pēc $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Tērējams tagad $amount. Atlikumu varēs iztērēt pēc $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Tērējams tagad $amount. Atlikums vēl ir ceļā.';
  }

  @override
  String get txTagWaiting => 'gaida pieņemšanu';

  @override
  String get txTagStatusUnknown => 'statuss nezināms';

  @override
  String get txTagNotAccepted => 'nav pieņemts';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'apstiprina $n / $total';
  }

  @override
  String get submittedTo => 'Iesniegts';

  @override
  String get testConnection => 'Pārbaudīt savienojumu';

  @override
  String get accountsOtherWalletHeader =>
      'Saglabāts no cita maka (tikai skatīšanai)';

  @override
  String get accountsOtherWalletNote =>
      'Šis maks tos nevar iztērēt, tāpēc tie netiek ieskaitīti tā kopsummā. Atveriet maku, kuram tie pieder, lai tos izmantotu.';

  @override
  String get noActivityTitle => 'Aktivitātes vēl nav';

  @override
  String get txTypeSent => 'Nosūtīts';

  @override
  String get txTypeReceived => 'Saņemts';

  @override
  String get txTypeThisWallet => 'Maka iekšienē';

  @override
  String get txTypeMerged => 'Apvienotās monētas';

  @override
  String get noActivityMessage =>
      'Kad nosūtīsiet vai saņemsiet HTN, tas parādīsies šeit.';

  @override
  String get seeAll => 'Skatīt visu';

  @override
  String get show => 'Rādīt';

  @override
  String get myAccounts => 'Mani konti';

  @override
  String homeGreeting(String walletName) {
    return 'Sveiki, $walletName';
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
  String get importOptionStandardWalletTitle => 'Importēt standarta maku';

  @override
  String get importOptionStandardWalletDescription =>
      'Maki ar 12 vai 24 vārdiem un standarta atvasināšanu, ar izvēles BIP39 paroles frāzi';

  @override
  String get importOptionLegacyWalletTitle => 'Importēt vecāko maku';

  @override
  String get importOptionLegacyWalletDescription =>
      'Maki ar 12 vārdiem un vecāko atvasināšanu, saderīgi ar veco Web Wallet un KDX';

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
  String get changeAddressModeTitle => 'Sīknaudas adreses darbība';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Katra adrese saglabā savu atlikumu, un sīknauda paliek uz vietas';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Katru reizi tiek izmantota jauna adrese (privāti, atlikums izkliedējas)';

  @override
  String get changeAddressModeDialogTitle => 'Sīknaudas adreses darbība';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Saglabāt atlikumus katrā adresē';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privāti';

  @override
  String get requestPasswordHeader => 'Pieprasīt paroli';

  @override
  String get requestPasswordAtLaunch => 'Palaišanas brīdī';

  @override
  String get requestPasswordWhenLocked => 'Kad bloķēts';

  @override
  String get requestPasswordWhenSigning => 'Parakstīšanas laikā';

  @override
  String get importWalletAdvancedOptions => 'Papildu opcijas';

  @override
  String get bip39Passphrase => 'BIP39 paroles frāze';

  @override
  String get bip39PassphraseWarning =>
      'PIEZĪME: Šī nav maka parole; dažādas BIP39 paroles frāzes atver dažādus makus.';

  @override
  String get bip39PassphraseEnter => 'Ievadiet paroles frāzi';

  @override
  String get bip39PassphraseConfirm => 'Apstipriniet paroles frāzi';

  @override
  String get bip39PassphraseMismatch => 'Paroles frāzes nesakrīt!';

  @override
  String get bip39PassphraseNote => 'Maks ar BIP39 paroles frāzi.';

  @override
  String get feePriorityHint => 'Ievadiet prioritātes komisiju';

  @override
  String get feeBaseUppercase => 'PAMATKOMISIJA';

  @override
  String get feePriorityUppsercase => 'PRIORITĀTES KOMISIJA';

  @override
  String get feeUpdateAddressError => 'Neizdevās atpazīt mērķa adresi';

  @override
  String get feeUpdateRebuildError => 'Neizdevās atkārtoti izveidot darījumu';

  @override
  String get feeUpdateRebuildError2 =>
      'Neizdevās atkārtoti izveidot darījumu ar jauno komisiju';

  @override
  String get feeUpdateError => 'Neizdevās atjaunināt komisiju';

  @override
  String get feeUpdate => 'Atjaunināt komisiju';

  @override
  String get feeUpdateTitle => 'Komisijas atjaunināšana';

  @override
  String get feeSheetRecommendedPriority => 'Ieteiktās prioritātes komisijas';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Jaunajai prioritātes komisijai jābūt vismaz $amount $symbol';
  }

  @override
  String get txPending => 'GAIDA';

  @override
  String get txPendingMessage => 'Šis darījums gaida';

  @override
  String get txPendingTitle => 'Gaidošs darījums';

  @override
  String get txPendingContent => 'Mempool ir gaidoši darījumi.';

  @override
  String get txPendingActionUpdateFee => 'Atjaunināt darījuma komisiju';

  @override
  String get txPendingActionRbf => 'Aizstāt ar komisiju (RBF)';

  @override
  String get txInMempool => 'mempool';

  @override
  String get utxoSelectionTitle => 'Izvēlēties UTXO';

  @override
  String get utxoSelectionHint => 'Lūdzu, izvēlieties vairāk UTXO';
}
