// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get account => 'პირადი ანგარიში';

  @override
  String get accounts => 'პირადი ანგარიშები';

  @override
  String get ackBackedUp =>
      'დარწმუნებული ხართ, რომ შექმენით თქვენი საიდუმლო ფრაზის სარეზერვო ასლი?';

  @override
  String get add => 'დამატება';

  @override
  String get addAccount => 'პირადი ანგარიშის დამატება';

  @override
  String get addContact => 'კონტაქტის დამატება';

  @override
  String get addNode => 'ნოუდის დამატება';

  @override
  String get addNodeFailed => 'ვერ მოხერხდა Hoosat-ს ნოუდის დამატება';

  @override
  String addNodeFailedMessage(String error) {
    return 'ვერ მოხერხდა: $error';
  }

  @override
  String get addNodeSuccess => 'ნოუდი წარმატებულად იქნა დამატებული';

  @override
  String get addingNodeMessage =>
      'გთხოვთ მოიცადოთ იქამდე სანამ ვუკავშირდებით ნოუდს';

  @override
  String get addingNodeTitle => 'ნოუდის დამატება';

  @override
  String get address => 'მისამართი';

  @override
  String get addressCopied => 'მისამართი დაკოპირებულია';

  @override
  String get addressCopiedFailed => 'მისამართის კოპირება ვერ მოხერხდა';

  @override
  String get addressHint => 'შეიყვანეთ მისამართი';

  @override
  String get addressMising => 'გთხოვთ შეიყვანოთ მისამართი';

  @override
  String get addressShare => 'მისამართის გაზიარება';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'სიღრმისეული';

  @override
  String get amount => 'ოდენობა';

  @override
  String amountConfirm(String amount, String coin) {
    return 'ოდენობა $amount $coin';
  }

  @override
  String get amountMissing => 'გთხოვთ შეიყვანოთ ოდენობა';

  @override
  String get amountZero => 'ოდენობა არ შეიძლება იყოს ნოლი';

  @override
  String get areYouSure => 'დარწმუნებული ხართ?';

  @override
  String get authBiometricMessage => 'ავთენტიფიკაცია საფულის დასამატებლად';

  @override
  String get authMethod => 'ავთეტიფიკაციის მეთოდი';

  @override
  String get authPinMessage => 'შეიყვანეთ პინ კოდი საფულის დასამატებლად';

  @override
  String get autoLockHeader => 'ავტომატური დაკეტვა';

  @override
  String get available => 'ხელმისაწვდომი';

  @override
  String get back => 'უკან';

  @override
  String get backupConfirmButton => 'მე შევქმენი სარეზერვო ასლი';

  @override
  String get backupSecretPhrase => 'საიდუმლო ფრაზის ბექაფი';

  @override
  String get missingSecretPhrase => 'საიდუმლო ფრაზა არ არის';

  @override
  String get biometricsMethod => 'ბიომეტრიკა';

  @override
  String get blockExplorer => 'ბლოკის მაძიებელი';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get change => 'შეცვლა';

  @override
  String get changeAddress => 'მისამართის ცვლილება';

  @override
  String get changeAddressCopied => 'დაკოპირებული მისამართის ცვლილება';

  @override
  String get changeIndex => 'ინდექსის ცვლილება';

  @override
  String changeIndexParam(String addressIndex) {
    return 'ცვლილება $addressIndex';
  }

  @override
  String get checkCameraPermission => 'გთხოვთ, შეამოწმოთ კამერის ნებართვა';

  @override
  String get clipboardEmpty => 'ბუფერი ცარიელია';

  @override
  String get close => 'დახურვა';

  @override
  String get confirm => 'დადასტურება';

  @override
  String get confirmPasswordHint => 'პაროლის დასტური';

  @override
  String confirmations(String confirmations) {
    return '$confirmations დასტური';
  }

  @override
  String get confirmed => 'დადასტურდა';

  @override
  String get confirmedMaturing => 'დადასტურებულია · მწიფდება';

  @override
  String get confirming => 'დასტურდება';

  @override
  String contactAdded(String contactName) {
    return '$contactName დამატებულია კონტაქტებში';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address მისამართი კოპირებულია';
  }

  @override
  String get contactExists => 'აღნიშნული კონტაქტი უკვე არსებობს';

  @override
  String get contactHeader => 'კონტაქტი';

  @override
  String get contactInvalid => 'არასწორი კონტაქტის დასახელება';

  @override
  String get contactNameHint => 'მიუთითეთ კონტაქტის სახელი @';

  @override
  String get contactNameMissing => 'აირჩიეთ დასახელება კონტაქტისთვის';

  @override
  String contactRemoved(String contactName) {
    return '$contactName ამოღებული იქნა კონტაქტების სიიდან!';
  }

  @override
  String get contactsHeader => 'კონტაქტები';

  @override
  String get contactsImportErr =>
      'დაფიქსირდა შეცდომა კონტაქტების იმპორტირებისას';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'წარმატებით დაიმპორტდა $noContacts კონტაქტები';
  }

  @override
  String get copied => 'დაკოპირდა';

  @override
  String get copy => 'დაკოპირება';

  @override
  String get copyAddress => 'მისამართის დაკოპირება';

  @override
  String get copyErrorButton => 'კოპირების შეცდომა';

  @override
  String get createAPasswordHeader => 'შექმენით პაროლი.';

  @override
  String get createPasswordFirstParagraph =>
      'თქვენ შეგიძლიათ შექმნათ პაროლი თქვენს საფულეზე დამატებითი უსაფრთხოების დასამატებლად.';

  @override
  String get createPasswordHint => 'შექმენით პაროლი';

  @override
  String get createPasswordSecondParagraph =>
      'პაროლი არჩევითია, თქვენი საფულე დაცული იქნება თქვენი PIN-ით ან ბიომეტრიით, მიუხედავად იმისა დააყენებთ თუ არა პაროლს.';

  @override
  String get createPasswordSheetHeader => 'შექმნა';

  @override
  String get currency => 'ვალუტა';

  @override
  String get currencyPoweredBy => 'უზრუნველყოფილია CoinGecko-ს მიერ';

  @override
  String get defaultAccountName => 'მისამართი 1 ';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'მიღება $addressIndex';
  }

  @override
  String get defaultWalletName => 'ჩემი საფულე';

  @override
  String get disablePasswordSheetHeader => 'გამორთვა';

  @override
  String get disablePasswordSuccess => 'პაროლი გამორთულია';

  @override
  String get disableWalletPassword => 'საფულის პაროლის გამორთვა';

  @override
  String get doContinue => 'გაგრძელება';

  @override
  String get donate => 'დონაცია';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'აღარ მაჩვენო';

  @override
  String get emptyCardIntroUtxos =>
      'ეს არის UTXO-ს გვერდი. ყველა UTXO თქვენს საფულეში გამოჩნდება აქ';

  @override
  String get emptyResult => 'ცარიელი შედეგი';

  @override
  String get emptyWalletName => 'საფულის დასახელება არ შეიძლება იყოს ცარიელი';

  @override
  String get encryptionFailedError => 'საფულის პაროლის დაყენება ვერ მოხერხდა';

  @override
  String get enterAddress => 'შეიყვანეთ მისამართი';

  @override
  String get enterAmount => 'შეიყვანეთ ოდენობა';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'შეიყვანეთ ტექსტი';

  @override
  String get enterPasswordHint => 'შეიყვანეთ თქვენი პაროლი';

  @override
  String get errorMessageCopied => 'შეცდომის შეტყობინება კოპირებულია ბუფერში';

  @override
  String get exampleCardIntro =>
      'ეს არის ტრანზაქციების გვერდი. ტრანზაქციის გაგზავნის ან მიღების შემდეგ, იგი გამოჩნდება აქ.';

  @override
  String get export => 'ექსპორტი';

  @override
  String get fee => 'საკომისიო';

  @override
  String feeConfirm(String amount, String coin) {
    return 'საკომისიო $amount $coin';
  }

  @override
  String get feeTitle => 'საკომისიო';

  @override
  String get fetchingTransactions => 'ტრანზაქციის მიღება';

  @override
  String get fingerprintSeedBackup =>
      'გაიარეთ ავთენტიფიკაცია საიდუმლო ფრაზის სარეზერვო ასლის შესაქმნელად';

  @override
  String get goBackButton => 'უკან წასვლა';

  @override
  String get gotItButton => 'მიღებულია!';

  @override
  String get import => 'იმპორტი';

  @override
  String get importSecretPhrase => 'საიდუმლო ფრაზის იმპორტი';

  @override
  String get importSecretPhraseHint =>
      'გთხოვთ ქვემოთ შეიყვანოთ თქვენი 24 სიტყვიანი საიდუმლო ფრაზა';

  @override
  String get importSecretPhraseHintCombo =>
      'გთხოვთ შეიყვანოთ თქვენი 12 ან 24 სიტყვიანი საიდუმლო ფრაზა ქვემოთ.';

  @override
  String get importSecretPhraseHintLegacy =>
      'გთხოვთ შეიყვანოთ თქვენი 12 სიტყვიანი საიდუმლო ფრაზა ქვემოთ.';

  @override
  String get importWallet => 'საფულის იმპორტი';

  @override
  String get importWalletDescription => 'გთხოვთ აირჩიოთ ქვემოთმოცემული ოფცია.';

  @override
  String get instantly => 'მყისიერად';

  @override
  String get insufficientBalance => 'აკმარისი ბალანსი';

  @override
  String get insufficientBalanceDetails =>
      'თქვენ არ გაქვთ საკმარისი HTN ამ ტრანზაქციისთვის';

  @override
  String get invalidAddress => 'შეყვანილი მისამართი იყო არასწორი';

  @override
  String get invalidAmount => 'არასწორი ოდენობა';

  @override
  String get invalidChecksumMessage =>
      'გთხოვთ შეამოწმოთ, რომ თქვენ მიერ შეყვანილი საიდუმლო ფრაზა\nშეყვანილია სწორად!';

  @override
  String get invalidKpubMessage =>
      'გთხოვთ შეამოწმოთ რომ თქვენი გაფართოებული საჯარო გასაღები შეყვანილია სწორად!';

  @override
  String get invalidDestinationAddress => 'არასწორი დანიშნულების მისამართი';

  @override
  String get invalidPassword => 'არასწორი პაროლი';

  @override
  String get hoosatDevFund => 'Hoosat-ს Dev ფონდი';

  @override
  String get hoosatMobile => 'Hoosat Mobile საფულე';

  @override
  String get language => 'ენა';

  @override
  String get loadingTransactions => 'ტრანზაქციები იტვირთება...';

  @override
  String get lockAppSetting => 'ავთენტიფიკაცია გაშვებისას';

  @override
  String get locked => 'ჩაკეტილია';

  @override
  String get loggingOutMessage => 'გასვლა...';

  @override
  String get logout => 'გასვლა';

  @override
  String get logoutDialogContent =>
      'დარწმუნებული ხართ რომ გსურთ ამ საფულიდან გასვლა?';

  @override
  String get logoutOrSwitchWallet => 'გასვლა / საფულის ცვლილება';

  @override
  String get manage => 'მართვა';

  @override
  String get manualEntry => 'ხელით შეყვანა';

  @override
  String get networkHeader => 'ქსელ';

  @override
  String get newAddress => 'ახალი მისამართი';

  @override
  String get newWallet => 'ახალი საფულე';

  @override
  String get nextButton => 'შემდეგი';

  @override
  String get no => 'არა';

  @override
  String get noContactsExport => 'არ არის კონტაქტები ექსპორტისთვის';

  @override
  String get noContactsImport => 'არ არის კონტაქტები იმპორტისთვის';

  @override
  String get noQrCodeFound => 'QR კოდი არ იქნა ნაპოვნი';

  @override
  String get noSkipButton => 'არა, გამოტოვე';

  @override
  String get noUppercase => 'არა';

  @override
  String get nodeAddress => 'Hoosat-ს ნოუდი ';

  @override
  String get nodeDeleteMessage => 'Დარწმუნებული ხართ რომ გსურთ წაშლა?';

  @override
  String get nodeDeleteTitle => 'წაიშალოს Hoosat-ს ნოუდის კონფიგურაცია?';

  @override
  String get nodeNameEmpty => 'ნოუდის დასახელება არ შეიძლება იყოს ცარიელი';

  @override
  String get nodeNameHint => 'შეიყვანეთ ნოუდის დასახელება';

  @override
  String get nodeUrlHint => 'შეიყვანეთ ნოუდის URL';

  @override
  String get nodeUrlInvalid => 'არასწორი ნოუდის URL';

  @override
  String get nodesSheetTitle => 'Hoosat-ს ნოუდები';

  @override
  String get off => 'გამორთული';

  @override
  String get on => 'ჩართული';

  @override
  String get paperWallet => 'ქაღალდის საფულე';

  @override
  String get passwordBlank => 'პაროლი არ შეიძლება იყოს ცარიელი';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'ამ საფულის გასახსნელად პაროლი არ დაგჭირდებათ.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'ეს პაროლი საჭირო იქნება ამ საფულის გასახსნელად.';

  @override
  String get passwordsDontMatch => 'პაროლები არ ემთხვევა';

  @override
  String get pasteMnemonicError =>
      'ბუფერში არსებული ინფორმაცია არ არის ვალიდური საიდუმლო ფრაზა';

  @override
  String get pending => 'მოლოდინის რეჟიმი';

  @override
  String get pinConfirmError => 'წერტილები არ ემთხვევა';

  @override
  String get pinConfirmTitle => 'დაადასტურეთ თქვენი PIN';

  @override
  String get pinCreateTitle => 'შექმენით 6-ციფრა PIN';

  @override
  String get pinEnterTitle => 'შეიყვანეთ PIN';

  @override
  String get pinInvalid => 'იქნა შეყვანილი არასწორი PIN';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup =>
      'შეიყვანეთ PIN საიდუმლო ფრაზის სარეზერვო ასლის შესაქმნელად';

  @override
  String get preferences => 'პრეფერენციები';

  @override
  String get privacyPolicy => 'კონფიდენციალურობის პოლიტიკა';

  @override
  String get qrInvalidAddress => 'QR კოდი არ შეიცავს სწორ მისამართს';

  @override
  String get qrInvalidSeed =>
      'QR კოდი არ შეიცავს ვალიდურ seed-ს ან პირად გასაღებს ';

  @override
  String get qrMnemonicError => 'QR კოდი არ შეიცავს მოქმედ საიდუმლო ფრაზას';

  @override
  String get receive => 'მიღება';

  @override
  String get receiveAddress => 'მიმღები მისამართი';

  @override
  String get receiveAddressCopied => 'მიმღები მისამართი დაკოპირებიულია';

  @override
  String get receiveIndex => 'მიმღები ინდექსი';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'მიმღები $addressIndex';
  }

  @override
  String get received => 'მიღებული';

  @override
  String get removeContact => 'კონტაქტის ამოღება';

  @override
  String removeContactConfirmation(String contactName) {
    return 'დარწმუნებული ხართ რომ გსურთ წაშლა $contactName?';
  }

  @override
  String get removeWalletAction => 'საფულის ამოღება';

  @override
  String get removeWalletBiometricsMessage =>
      'ავთენტიფიკაცია საფულის ამოსაღებად';

  @override
  String get removeWalletDetail =>
      'ამ საფულის ამოღება ამოშლის საიდუმლო ფრაზას და საფულესთან დაკავშირებულ ყველა მონაცემს ამ მოწყობილობიდან. თუ საიდუმლო ფრაზის სარეზერვო ასლი არ არსებობს, თქვენ ვეღარასოდეს შეძლებთ თქვენს სახსრებზე წვდომას.';

  @override
  String get removeWalletPinMessage => 'შეიყვანეთ PIN საფულის ამოსაღებად';

  @override
  String get removeWalletReassurance =>
      'სანამ საიდუმლო ფრაზის სარეზერვო ასლი გაქვთ, სანერვიულო არაფერი გაქვთ.';

  @override
  String get requireAPasswordToOpenHeader =>
      'მოვითხოვოთ პაროლი ამ საფულის გასახსნელად?';

  @override
  String get restartSetupButton => 'წყობის გადატვირთვა';

  @override
  String get scanQrCode => 'QR კოდის სკანირება';

  @override
  String get scanQrCodeError => 'qr კოდის გარჩევა ვერ მოხერხდა';

  @override
  String get scanFromImage => 'სკანირება სურათიდან';

  @override
  String get toggleFlash => 'ფანარის ჩართვა/გამორთვა';

  @override
  String get riskDisclosureHeader => 'დაწყებამდე';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet არის არასაცავი (non-custodial) საფულე. თქვენი საიდუმლო ფრაზა და კერძო გასაღებები იქმნება და ინახება მხოლოდ ამ მოწყობილობაზე — ჩვენ მათ არასდროს ვხედავთ, არცერთ სერვერზე არ ვინახავთ და თქვენთვის ვერ აღვადგენთ.';

  @override
  String get riskDisclosureWarning =>
      'თუ საიდუმლო ფრაზას დაკარგავთ, პაროლის აღდგენა არ არსებობს და არც მხარდაჭერის გუნდს შეუძლია თქვენი სახსრების დაბრუნება. მისი უსაფრთხოდ შენახვის პასუხისმგებლობა მხოლოდ თქვენზეა.';

  @override
  String get riskDisclosureAccept => 'გავიგე, გაგრძელება';

  @override
  String get secretInfo =>
      'შემდეგ ეკრანზე ნახავთ თქვენს საიდუმლო ფრაზას. ეს არის პაროლი თქვენს სახსრებზე წვდომისთვის. გადამწყვეტი მნიშვნელობა აქვს მისი სარეზერვო ასლის შენახვას, რომელიც არასოდეს უნდა გაუზიაროთ ვინმეს.';

  @override
  String get secretInfoHeader => 'უსაფრთხოება უპირველეს ყოვლისა!';

  @override
  String get secretPhrase => 'საიდუმლო ფრაზა';

  @override
  String get verifyBackupTitle => 'დაადასტურეთ თქვენი სარეზერვო ასლი';

  @override
  String get verifyBackupInstruction =>
      'აირჩიეთ სწორი სიტყვა თითოეული პოზიციისთვის, რათა დაადასტუროთ, რომ საიდუმლო ფრაზა შეინახეთ.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'რომელია სიტყვა №$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'ზუსტად არ არის. შეამოწმეთ სარეზერვო ასლი და სცადეთ ხელახლა.';

  @override
  String get secretPhrase12Words => '12 სიტყვა';

  @override
  String get secretPhrase24Words => '24 სიტყვა';

  @override
  String get secretWarning =>
      'თუ დაკარგავთ თქვენს მოწყობილობას ან წაშლით აპლიკაციას, დაგჭირდებათ თქვენი საიდუმლო ფრაზა სახსრების დასაბრუნებლად!';

  @override
  String get securityHeader => 'უსაფრთხოება';

  @override
  String get securitySettingsBiometrics =>
      'გაიარეთ ავტორიზაცია უსაფრთხოების პარამეტრებზე წვდომისთვის';

  @override
  String get securitySettingsPin =>
      'შეიყვანეთ PIN უსაფრთხოების პარამეტრებზე წვდომისთვის';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'შეტყობინების ხელმოწერა';

  @override
  String get signMessageCopySignature => 'ხელმოწერის კოპირება';

  @override
  String get signMessageDescription =>
      'მოაწერეთ ხელი შეტყობინებას თქვენი საფულის ერთ-ერთი მისამართით';

  @override
  String get signMessageHint => 'შეიყვანეთ შეტყობინება ხელმოსაწერად';

  @override
  String get signMessageSignatureCopied => 'ხელმოწერა დაკოპირდა';

  @override
  String get signMessageSigned => 'შეტყობინებას ხელი მოეწერა';

  @override
  String get signMessageTooLong => 'შეტყობინება ძალიან გრძელია';

  @override
  String get seedInvalid => 'Seed არასწორია';

  @override
  String get nodeUnreachable =>
      'თქვენს კვანძს ვერ ვუკავშირდებით. ბალანსები შეიძლება მოძველებული იყოს.';

  @override
  String get nodeUnreachableRetry => 'ხელახლა ცდა';

  @override
  String get send => 'გაგზავნა';

  @override
  String get sendConfirm => 'გაგზავნა';

  @override
  String get sendError => 'დაფიქსირდა შეცდომა. გთხოვთ სცადოთ თავიდან';

  @override
  String get sendNote => 'შენიშვნა';

  @override
  String get sendToAddressTitle => 'რომ';

  @override
  String get sendTxProgressDescription =>
      'გთხოვთ, დაელოდოთ ტრანზაქციის გაგზავნას';

  @override
  String get sendTxProgressTitle => 'იგზავნება ტრანზაქცია';

  @override
  String get sending => 'გაგზავნა';

  @override
  String get sent => 'გაგზავნილია';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'პაროლის დაყენება';

  @override
  String get setPasswordSuccess => 'საფულის პაროლი დაყენებული იქნა';

  @override
  String get setWalletPassword => 'საფულის პაროლის დაყენება';

  @override
  String get settingsHeader => 'პარამეტრები';

  @override
  String get settingsTransfer => 'ქაღალდის საფულიდან ჩატვირთვა';

  @override
  String get setupFailedMessage => 'Რაღაც წავიდა არასწორად';

  @override
  String get shareHoosatMobile => 'Hoosat Mobile-ის გაზიარება';

  @override
  String get shareHoosatMobileSubject => 'Kapsium-ის საფულის შემოწმება';

  @override
  String get shareHoosatMobileText =>
      'იხილეთ Hoosat Mobile - Hoosat-ს მობილური საფულე. \nვებსაიტი - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Რაღაც წავიდა არასწორად';

  @override
  String get systemDefault => 'სისტემის ქარხნული პარამეტრები';

  @override
  String get tapToHide => 'შეეხეთ დასამალად';

  @override
  String get tapToReveal => 'შეეხეთ გამოსაჩენად';

  @override
  String get themeDark => 'მუქი თემა';

  @override
  String get themeHeader => 'თემა';

  @override
  String get themeLight => 'ღია თემა';

  @override
  String get toggleTheme => 'თემის შეცვლა';

  @override
  String get thisWallet => '#ეს საფულე';

  @override
  String get to => 'რომ';

  @override
  String get toAddress => 'ამ მისამართზე';

  @override
  String get tooManyFailedAttempts => 'ზედმეტად ბევრი გახსნის მცდელობა.';

  @override
  String get totalValue => 'სრული ღირებულება';

  @override
  String get transactionId => 'ტრანზაქციის ID';

  @override
  String get transactionsUppercase => 'ტრანზაქციები';

  @override
  String get transfer => 'ტრანსფერი';

  @override
  String get transferClose => 'შეეხეთ ნებისმიერ ადგილას ფანჯრის დასახურად.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN წარმატებით გადავიდა თქვენ Hoosat Mobile-ის საფულეში.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'აღმოჩენილია საფულე $amount HTN-ის ბალანსით.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'შეეხეთ დადასტურებას სახსრების გადასარიცხად.\n';

  @override
  String get transferConfirmInfoThird =>
      'ტრანსფერის დასრულებას შეიძლება დასჭირდეს რამოდენიმე წამი.';

  @override
  String get transferError =>
      'ტრანსფერისას მოხდა შეცდომა. გთხოვთ სცადოთ მოგვიანებით.';

  @override
  String get transferHeader => 'სახსრების ტრასფერი';

  @override
  String transferIntro(String button) {
    return 'ეს პროცესი გადაიტანს თანხებს ქაღალდის საფულედან თქვენს კასპიუმის საფულეში. \n\nშეეხეთ \"$button\" ღილაკს დასაწყებად.';
  }

  @override
  String get transferLoading => 'მიმდინარეობს ტრანსფერი';

  @override
  String get transferManualHint => 'გთხოვთ შეიყვანოთ seed';

  @override
  String get transferNoFunds => 'ამ seed-ს არ აქვს HTN';

  @override
  String get transferQrScanError => 'ეს QR კოდი არ შეიცავს მოქმედ seed-ს.';

  @override
  String get transferQrScanHint =>
      'დაასკანირეთ Hoosat\nseed ან პირადი გასაღები';

  @override
  String get unconfirmed => 'დაუდასტურებელი';

  @override
  String get notAccepted => 'არ არის მიღებული';

  @override
  String get accepted => 'მიღებულია';

  @override
  String get unknown => 'უცნობი';

  @override
  String get unlock => 'გახსნა';

  @override
  String get unlockBiometrics => 'ავთენტიფიკაცია საფულის გასახსნელად';

  @override
  String get unlockPin => 'შეიყვანეთ PIN საფულის გასახსნელად';

  @override
  String get utxosUppercase => 'UTXO-ები';

  @override
  String get viewAddress => 'მისამართის ნახვა';

  @override
  String get viewTransaction => 'ტრანზაქციების ნახვა';

  @override
  String get walletAddresses => 'საფულის მისამართები';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'საფულის დასახელება';

  @override
  String get walletNameDescription => 'შეიყვანეთ დასახელება თქვენი საფულისთვის';

  @override
  String get walletNameHint => 'საფულის დასახელება';

  @override
  String get walletSetupAddressDiscovery =>
      'მიმდინარეობს მისამართიების აღმოჩენა';

  @override
  String get walletSetupMessage => 'საფულის დაყენება';

  @override
  String get walletsTitle => 'საფულეები';

  @override
  String get warning => 'გაფრთხილება';

  @override
  String welcomeMessage(String version) {
    return 'მოგესალმებით\n\nეს არის Hoosat Mobile-ის ვერსია $version - მობილური საფულე Hoosat-სთვის';
  }

  @override
  String get welcomeText =>
      'კეთილი იყოს თქვენი მობრძანება Hoosat Mobile-ში. დასაწყებათ, შეგიძლიათ შექმნათ ახალი საფულე ან დააიმპორტოთ არსებული.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString წუთი',
      one: '1 წუთი',
    );
    return 'შემდეგ $_temp0';
  }

  @override
  String get yes => 'დიახ';

  @override
  String get yesButton => 'დიახ';

  @override
  String get yesUppercase => 'დიახ';

  @override
  String get nodeNotSyncedException => 'ნოუდი არ არის სინქრონიზირებული';

  @override
  String get nodeNoUTXOIndexException => 'ნოუდს არ აქვს UTXO ინდექსი';

  @override
  String get nodeSecureConnection => 'დაცული კავშირი';

  @override
  String get hoosatUriInvalid => 'არასწორი Hoosat URI';

  @override
  String get compoundUtxos => 'გაერთიანებული ტრანზაქციები';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'თქვენ გაქვთ ბევრი მცირე გამოუყენებელი გამომავალი (UTXO). კონსოლიდაცია მათ ნაკლებ, მაგრამ უფრო დიდ UTXO-ებად გააერთიანებს, რაც მომავალ გაგზავნებს დააჩქარებს და შესაძლოა საკომისიოც შეამციროს. ეს ქმნის ერთ ან რამდენიმე ტრანზაქციას და იწვევს ქსელის საკომისიოს.';

  @override
  String get compoundUtxosDescription => 'გააერთიანეთ რამდენიმე UTXO ერთში';

  @override
  String get compoundUtxosConfirmation => 'გაერთიანებული ტრანზაქციები?';

  @override
  String get compoundingUtxos => 'ტრანზაქციების გაერთიანება';

  @override
  String get compoundingMessage => 'გთხოვთ დაელოდოთ...';

  @override
  String get compoundSuccess => 'გაერთიანება წარმატებულია';

  @override
  String get compoundFailure => 'ვერ მოხერხდა ტრანზაქციების გაერთიანება';

  @override
  String get fundsStillConfirmingTitle => 'სახსრები ჯერ კიდევ მოწმდება';

  @override
  String get fundsStillConfirmingBody =>
      'ამ ანგარიშზე არსებული სახსრების ნაწილი ძალიან ცოტა ხნის წინ მიიღეს და ჯერ ვერ გაიგზავნება — ქსელს ჯერ მოკლე მომწიფების დრო სჭირდება, ჩვეულებრივ რამდენიმე წუთი. შეგიძლიათ დაელოდოთ და ხელახლა სცადოთ, ან გააგზავნოთ სხვა ანგარიშიდან, სადაც მომწიფებული სახსრებია.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'ანგარიშის შეცვლა';

  @override
  String get compoundTooFewUtxos => 'როგორც მინიმუმ ორი UTXO არის სავალდებულო';

  @override
  String get moveToMain => 'ძირითადზე შეგროვება';

  @override
  String get moveToMainDescription =>
      'გადაიტანეთ ყველა სხვა მისამართის ბალანსი თქვენს ძირითად მისამართზე';

  @override
  String get moveToMainConfirmation => 'ყველაფერი ძირითადზე გადავიტანოთ?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'ეს გადაიტანს $amount $symbol-ს $count სხვა მისამართიდან თქვენს ძირითად მისამართზე. შეიქმნება ერთი ან მეტი ტრანზაქცია და ჩამოიჭრება ქსელის საკომისიო.';
  }

  @override
  String get moveToMainNothingToMove =>
      'ყველა მისამართის ბალანსი უკვე ძირითადზეა';

  @override
  String get movingToMain => 'ძირითადზე გროვდება';

  @override
  String get moveToMainSuccess => 'ძირითადზე გადატანა წარმატებით დასრულდა';

  @override
  String get moveToMainFailure => 'ძირითადზე გადატანა ვერ მოხერხდა';

  @override
  String get moveToMainUppercased => 'გადატანა';

  @override
  String get manageAccounts => 'ანგარიშები';

  @override
  String get manageAccountsDescription =>
      'დაამატეთ და მართეთ სახელიანი მისამართები';

  @override
  String get mainAccountLabel => 'ძირითადი';

  @override
  String get archiveAction => 'დაარქივება';

  @override
  String get restoreAction => 'აღდგენა';

  @override
  String get archivedAccountsHeader => 'დაარქივებული';

  @override
  String get noAdditionalAccountsYet => 'დამატებითი ანგარიშები ჯერ არ არის';

  @override
  String get renameAccount => 'ანგარიშის გადარქმევა';

  @override
  String get accountLabelHint => 'ანგარიშის სახელი';

  @override
  String get saveUppercased => 'შენახვა';

  @override
  String get addUppercased => 'დამატება';

  @override
  String get sendFromLabel => 'საიდან';

  @override
  String get sendFromAny => 'ნებისმიერი';

  @override
  String get home => 'მთავარი';

  @override
  String get activity => 'აქტივობა';

  @override
  String get totalBalance => 'მთლიანი ბალანსი';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'ახლა დასახარჯი $spendable · ჯერ კიდევ გზაშია $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'კოინები, რომლებიც ჯერ გზაშია, თქვენია და მალე დახარჯვადი იქნება.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'კოინები, რომლებიც ჯერ გზაშია, დახარჯვადი გახდება $time-ში.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'ახლა დასახარჯი $amount. დანარჩენი დახარჯვადი გახდება $time-ში.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'ახლა დასახარჯი $amount. დანარჩენი ჯერ გზაშია.';
  }

  @override
  String get txTagWaiting => 'მიღებას ელოდება';

  @override
  String get txTagStatusUnknown => 'სტატუსი უცნობია';

  @override
  String get txTagNotAccepted => 'არ არის მიღებული';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'დასტურდება $n / $total';
  }

  @override
  String get submittedTo => 'გაგზავნილია';

  @override
  String get testConnection => 'კავშირის შემოწმება';

  @override
  String get accountsOtherWalletHeader =>
      'შენახულია სხვა საფულიდან (მხოლოდ ნახვა)';

  @override
  String get accountsOtherWalletNote =>
      'ამ საფულეს მათი დახარჯვა არ შეუძლია, ამიტომ ისინი მის ჯამში არ ითვლება. გახსენით საფულე, რომელსაც ეკუთვნის, რათა გამოიყენოთ.';

  @override
  String get noActivityTitle => 'აქტივობა ჯერ არ არის';

  @override
  String get txTypeSent => 'გაგზავნილი';

  @override
  String get txTypeReceived => 'მიღებული';

  @override
  String get txTypeThisWallet => 'საფულის შიგნით';

  @override
  String get txTypeMerged => 'გაერთიანებული კოინები';

  @override
  String get noActivityMessage =>
      'როცა HTN-ს გააგზავნით ან მიიღებთ, აქ გამოჩნდება.';

  @override
  String get seeAll => 'ყველას ნახვა';

  @override
  String get show => 'ჩვენება';

  @override
  String get myAccounts => 'ჩემი ანგარიშები';

  @override
  String homeGreeting(String walletName) {
    return 'გამარჯობა, $walletName';
  }

  @override
  String get balance => 'ბალანსი';

  @override
  String get maxSend => 'მაქსიმალური გაგზავნა';

  @override
  String get compoundUppercased => 'გაერთიანება';

  @override
  String get closeUppercased => 'დახურვა';

  @override
  String get scanMoreAddresses => 'დაასკანირეთ მეტი მისამართებისათვის';

  @override
  String get addressDiscovery => 'მისამართების ძებნა';

  @override
  String get scanningTitle => 'სკანირება';

  @override
  String get scanningDescription => 'სკანირება ახალი მისამართებისთვის...';

  @override
  String get scanMore => 'მეტის სკანირება';

  @override
  String get scanFailedMessage =>
      'სკანირება ვერ მოხერხდა, გთხოვთ მოგვიანებით სცადოთ';

  @override
  String get indexHeader => 'ინდექსი';

  @override
  String get currentIndex => 'ამჟამინდელი';

  @override
  String get scannedIndex => 'სკანირებული';

  @override
  String get newIndex => 'ახალი';

  @override
  String get addressFilterDialogTitle => 'მისამართების ფილტრი';

  @override
  String get addressFilterDialogOptionAllAddresses => 'ყველა მისამართის ნახვა';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'ბალანსიანი მისამართების ნახვა';

  @override
  String get importOption24WordsTitle => '24 სიტყვიანი საიდუმლო ფრაზის იმპორტი';

  @override
  String get importOption24WordsDescription =>
      'თავსებადია Cli Wallet-თან და Ledger-თან';

  @override
  String get importOption12WordsTitle => '12 სიტყვიანი საიდუმლო ფრაზის იმპორტი';

  @override
  String get importOption12WordsDescription =>
      'თავსებადია Web Wallet-თან და KDX-თან';

  @override
  String get importOptionStandardWalletTitle => 'სტანდარტული საფულის იმპორტი';

  @override
  String get importOptionStandardWalletDescription =>
      '12 ან 24 სიტყვიანი საფულეები სტანდარტული წარმოებით და არჩევითი BIP39 პაროლ-ფრაზით';

  @override
  String get importOptionLegacyWalletTitle => 'ძველი საფულის იმპორტი';

  @override
  String get importOptionLegacyWalletDescription =>
      '12 სიტყვიანი საფულეები ძველი წარმოებით, თავსებადი ძველ Web Wallet-სა და KDX-თან';

  @override
  String get importOptionKpubTitle => 'Watch Only Wallet-ის იმპორტი';

  @override
  String get importOptionKpubDescription =>
      'აკონტროლეთ საფულის ბალანსი და ტრანზაქციები გაფართოებული საჯარო გასაღების გამოყენებით';

  @override
  String get importKpub => 'Watch Only Wallet-ის იმპორტი';

  @override
  String get importKpubHint =>
      'გთხოვთ, შეიყვანოთ თქვენი გაფართოებული საჯარო გასაღები.';

  @override
  String get importKpubClipboardError =>
      'ბუფერში არსებული კონტენტი არ არის სწორი გაფართოებული საჯარო გასაღები';

  @override
  String get importKpubQrCodeError =>
      'QR კოდი არ შეიცავს მოქმედ გაფართოებულ საჯარო გასაღებს';

  @override
  String get importKpubInvalidMessage =>
      'გთხოვთ, შეამოწმოთ, რომ თქვენი გაფართოებული საჯარო გასაღები სწორად არის შეყვანილი!';

  @override
  String get receiveAddressListEmpty => 'მიმღების მისამართების სია ცარიელია';

  @override
  String get changeAddressListEmpty => 'მისამართების შეცვლა ცარიელია';

  @override
  String get hintAddressListEmpty =>
      'შეამოწმეთ მისამართის ფილტრი ზედა მარჯვენა კუთხიდან';

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
  String get changeAddressModeTitle => 'ხურდის მისამართის ქცევა';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'თითოეული მისამართი ინარჩუნებს საკუთარ ბალანსს, ხურდა კი იქვე რჩება';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'ყოველ ჯერზე ახალი მისამართი გამოიყენება (კონფიდენციალურად, ბალანსი ნაწილდება)';

  @override
  String get changeAddressModeDialogTitle => 'ხურდის მისამართის ქცევა';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'ბალანსების შენარჩუნება თითოეულ მისამართზე';

  @override
  String get changeAddressModeDialogOptionPrivate => 'კონფიდენციალური';

  @override
  String get requestPasswordHeader => 'პაროლის მოთხოვნა';

  @override
  String get requestPasswordAtLaunch => 'გაშვებისას';

  @override
  String get requestPasswordWhenLocked => 'დაბლოკვისას';

  @override
  String get requestPasswordWhenSigning => 'ხელმოწერისას';

  @override
  String get importWalletAdvancedOptions => 'გაფართოებული პარამეტრები';

  @override
  String get bip39Passphrase => 'BIP39 პაროლ-ფრაზა';

  @override
  String get bip39PassphraseWarning =>
      'შენიშვნა: ეს არ არის საფულის პაროლი; სხვადასხვა BIP39 პაროლ-ფრაზა სხვადასხვა საფულეს ხსნის.';

  @override
  String get bip39PassphraseEnter => 'შეიყვანეთ პაროლ-ფრაზა';

  @override
  String get bip39PassphraseConfirm => 'დაადასტურეთ პაროლ-ფრაზა';

  @override
  String get bip39PassphraseMismatch => 'პაროლ-ფრაზები არ ემთხვევა!';

  @override
  String get bip39PassphraseNote => 'საფულე BIP39 პაროლ-ფრაზით.';

  @override
  String get feePriorityHint => 'შეიყვანეთ პრიორიტეტული საკომისიო';

  @override
  String get feeBaseUppercase => 'საბაზისო საკომისიო';

  @override
  String get feePriorityUppsercase => 'პრიორიტეტული საკომისიო';

  @override
  String get feeUpdateAddressError => 'დანიშნულების მისამართი ვერ ამოიცნო';

  @override
  String get feeUpdateRebuildError => 'ტრანზაქციის ხელახლა აგება ვერ მოხერხდა';

  @override
  String get feeUpdateRebuildError2 =>
      'ტრანზაქციის ახალი საკომისიოთი ხელახლა აგება ვერ მოხერხდა';

  @override
  String get feeUpdateError => 'საკომისიოს განახლება ვერ მოხერხდა';

  @override
  String get feeUpdate => 'საკომისიოს განახლება';

  @override
  String get feeUpdateTitle => 'საკომისიო ახლდება';

  @override
  String get feeSheetRecommendedPriority =>
      'რეკომენდებული პრიორიტეტული საკომისიოები';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'ახალი პრიორიტეტული საკომისიო მინიმუმ $amount $symbol უნდა იყოს';
  }

  @override
  String get txPending => 'მოლოდინში';

  @override
  String get txPendingMessage => 'ეს ტრანზაქცია მოლოდინშია';

  @override
  String get txPendingTitle => 'მოლოდინში მყოფი ტრანზაქცია';

  @override
  String get txPendingContent => 'mempool-ში მოლოდინში მყოფი ტრანზაქციებია.';

  @override
  String get txPendingActionUpdateFee => 'ტრანზაქციის საკომისიოს განახლება';

  @override
  String get txPendingActionRbf => 'საკომისიოთი ჩანაცვლება (RBF)';

  @override
  String get txInMempool => 'mempool-ში';

  @override
  String get utxoSelectionTitle => 'აირჩიეთ UTXO';

  @override
  String get utxoSelectionHint => 'გთხოვთ, აირჩიოთ მეტი UTXO';
}
