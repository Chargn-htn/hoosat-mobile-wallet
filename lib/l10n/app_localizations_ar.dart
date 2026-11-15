// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get account => 'الحساب';

  @override
  String get accounts => 'الحسابات';

  @override
  String get ackBackedUp =>
      'هل أنت متأكد من أنك قمت بنسخ نسخة احتياطية من العبارة السرية أو مفتاحك الخاص؟';

  @override
  String get add => 'Add';

  @override
  String get addAccount => 'إضافة حساب';

  @override
  String get addContact => 'إضافة جهة الاتصال';

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
  String get addressCopied => 'تم نسخ العنوان';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'أدخل العنوان\n';

  @override
  String get addressMising => 'يرجى إدخال العنوان';

  @override
  String get addressShare => 'أنشر العنوان';

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
  String get amountMissing => 'يرجى إدخال المبلغ';

  @override
  String get amountZero => 'Amount can\'t be zero';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get authBiometricMessage => 'Authenticate to Add Wallet';

  @override
  String get authMethod => 'طريقة المصادقة';

  @override
  String get authPinMessage => 'Enter PIN to Add Wallet';

  @override
  String get autoLockHeader => 'قفل آليً';

  @override
  String get available => 'Available';

  @override
  String get back => 'رجوع';

  @override
  String get backupConfirmButton => 'لقد حفظت العبارة السرية';

  @override
  String get backupSecretPhrase => 'حفظ العبارة السرية الخاصة بك\n';

  @override
  String get missingSecretPhrase => 'العبارة السرية مفقودة';

  @override
  String get biometricsMethod => 'القياسات الحيوية';

  @override
  String get blockExplorer => 'Block Explorer';

  @override
  String get cancel => 'إلغاء';

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
  String get close => 'إغلاق';

  @override
  String get confirm => 'تأكيد';

  @override
  String get confirmPasswordHint => 'تأكيد كلمة المرور\n';

  @override
  String confirmations(String confirmations) {
    return '$confirmations confirmations';
  }

  @override
  String get confirmed => 'confirmed';

  @override
  String get confirmedMaturing => 'مؤكد · قيد النضج';

  @override
  String get confirming => 'confirming';

  @override
  String contactAdded(String contactName) {
    return 'تم إضافة $contactName إلى جهات الاتصال.';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address address copied';
  }

  @override
  String get contactExists => 'جهة الاتصال موجودة مسبقا';

  @override
  String get contactHeader => 'جهة الاتصال';

  @override
  String get contactInvalid => 'اسم جهة الاتصال خاطيء';

  @override
  String get contactNameHint => 'أدخل اسم @';

  @override
  String get contactNameMissing => 'إختر إسم جهة الاتصال';

  @override
  String contactRemoved(String contactName) {
    return 'تم حذف $contactName من جهة الاتصال !';
  }

  @override
  String get contactsHeader => 'جهات الاتصال';

  @override
  String get contactsImportErr => 'فشل استيراد جهات الاتصال';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'تم جلب جهات اتصال $noContacts بنجاح.';
  }

  @override
  String get copied => 'تم نسخ';

  @override
  String get copy => 'نسخ';

  @override
  String get copyAddress => 'نسخ العنوان';

  @override
  String get copyErrorButton => 'Copy Error';

  @override
  String get createAPasswordHeader => 'أنشئ كلمة مرور.';

  @override
  String get createPasswordFirstParagraph =>
      'يمكنك إنشاء كلمة مرور لإضافة أمان إلى محفظتك.\n';

  @override
  String get createPasswordHint => 'أنشئ كلمة مرور\n';

  @override
  String get createPasswordSecondParagraph =>
      'كلمة المرور اختيارية ، وسيتم حماية محفظتك برقم التعريف الشخصي أو القياسات الحيوية بغض النظر.\n';

  @override
  String get createPasswordSheetHeader => 'خلق';

  @override
  String get currency => 'عملة';

  @override
  String get currencyPoweredBy => 'Powered by CoinGecko';

  @override
  String get defaultAccountName => 'الحساب الرئيسي';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'الحساب $addressIndex';
  }

  @override
  String get defaultWalletName => 'My Wallet';

  @override
  String get disablePasswordSheetHeader => 'تعطيل';

  @override
  String get disablePasswordSuccess => 'تم تعطيل كلمة المرور\n';

  @override
  String get disableWalletPassword => 'تعطيل كلمة مرور المحفظة\n';

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
  String get encryptionFailedError => 'أخفق إنشاء كلمة مرور المحفظة\n';

  @override
  String get enterAddress => 'أدخل العنوان';

  @override
  String get enterAmount => 'أدخل المبلغ';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Enter Note';

  @override
  String get enterPasswordHint => 'ادخل رقمك ادخل رقمك\n';

  @override
  String get errorMessageCopied => 'Error message copied to clipboard';

  @override
  String get exampleCardIntro =>
      'مرحبا بكم في نتريوم. بمجرد تلقي HTN ، ستظهر المعاملات كما يلي:';

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
  String get fingerprintSeedBackup => 'المصادقة على نسخ المفتاح الخاص.';

  @override
  String get goBackButton => 'عد\n';

  @override
  String get gotItButton => 'موافق!';

  @override
  String get import => 'استيراد';

  @override
  String get importSecretPhrase => 'استيراد العبارة السرية';

  @override
  String get importSecretPhraseHint =>
      'الرجاء إدخال عبارة سرية مكونة من 24 كلمة. يجب فصل كل كلمة بمسافة.';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'إجلب محفظة';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'فوراً';

  @override
  String get insufficientBalance => 'لرصيد غير كافي';

  @override
  String get insufficientBalanceDetails =>
      'You don\'t have enough HTN for this transaction';

  @override
  String get invalidAddress => 'العنوان المدخل غير صحيح';

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
  String get invalidPassword => 'كلمة المرور خاطئ\n';

  @override
  String get hoosatDevFund => 'Hoosat Dev Fund';

  @override
  String get hoosatMobile => 'Hoosat Mobile Wallet';

  @override
  String get language => 'اللغة';

  @override
  String get loadingTransactions => 'Loading Transactions...';

  @override
  String get lockAppSetting => 'المصادقة في الاطلاق';

  @override
  String get locked => 'مقفل';

  @override
  String get loggingOutMessage => 'Logging out...';

  @override
  String get logout => 'خروج';

  @override
  String get logoutDialogContent =>
      'Are you sure you want to logout from this wallet?';

  @override
  String get logoutOrSwitchWallet => 'Logout / Switch Wallet';

  @override
  String get manage => 'إدارة';

  @override
  String get manualEntry => 'إدخال يدوي';

  @override
  String get networkHeader => 'Network';

  @override
  String get newAddress => 'New Address';

  @override
  String get newWallet => 'محفظة جديدة';

  @override
  String get nextButton => 'التالى';

  @override
  String get no => 'لا';

  @override
  String get noContactsExport => 'لا توجد جهات الاتصال للنقل';

  @override
  String get noContactsImport => 'لا توجد جهات اتصال جديدة للجلب.';

  @override
  String get noQrCodeFound => 'No QR code found';

  @override
  String get noSkipButton => 'لا ، تخطي\n';

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
  String get off => 'غلق';

  @override
  String get on => 'فتح';

  @override
  String get paperWallet => 'المحفظة الورقية';

  @override
  String get passwordBlank => 'لا يمكن أن تكون كلمة المرور فارغة\n';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'لن تحتاج إلى كلمة مرور لفتح  نتريم بعد الآن.\n';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'هناك حاجة إلى كلمة المرور لفتح نتريم';

  @override
  String get passwordsDontMatch => 'كلمة المرور غير مطابقة\n';

  @override
  String get pasteMnemonicError =>
      'Clipboard content is not a valid secret phrase';

  @override
  String get pending => 'pending';

  @override
  String get pinConfirmError => 'رمز الPIN غير مطابق';

  @override
  String get pinConfirmTitle => 'تأكيد رمز الPIN';

  @override
  String get pinCreateTitle => 'ضع 6 أرقام رمز الPIN';

  @override
  String get pinEnterTitle => 'أدخل رمز الPIN';

  @override
  String get pinInvalid => 'رمز الPIN غير صحيح';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'أدخل الPIN للنسخ المفتاح الخاص';

  @override
  String get preferences => 'الاختيارات';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get qrInvalidAddress =>
      'لا يحتوي رمز الاستجابة السريعة على وجهة صالحة\n';

  @override
  String get qrInvalidSeed =>
      'رمز الاستجابة السريعة لا يحتوي على مفتاح خاص صحيح';

  @override
  String get qrMnemonicError =>
      'لا يحتوي رمز الاستجابة السريعة على عبارة سرية صالحة';

  @override
  String get receive => 'إستلام';

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
  String get received => 'تم الإستلام';

  @override
  String get removeContact => 'حذف بيانات جهة الاتصال';

  @override
  String removeContactConfirmation(String contactName) {
    return 'هل تريد حذف $contactName؟';
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
  String get requireAPasswordToOpenHeader => 'مطالبة كلمة مرور لفتح نتريم ؟';

  @override
  String get restartSetupButton => 'Restart Setup';

  @override
  String get scanQrCode => 'مسح رمز الاستجابة السريعة';

  @override
  String get scanQrCodeError => 'Failed to parse qr code';

  @override
  String get scanFromImage => 'مسح من صورة';

  @override
  String get toggleFlash => 'تشغيل/إيقاف المصباح';

  @override
  String get riskDisclosureHeader => 'قبل أن تبدأ';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet محفظة غير احتجازية (non-custodial). يتم إنشاء عبارتك السرية ومفاتيحك الخاصة وتخزينها على هذا الجهاز فقط — لا نراها أبدًا، ولا نخزنها على أي خادم، ولا يمكننا استرجاعها لك.';

  @override
  String get riskDisclosureWarning =>
      'إذا فقدت عبارتك السرية فلا توجد إعادة تعيين لكلمة المرور ولا فريق دعم يمكنه استرجاع أموالك. أنت وحدك المسؤول عن الحفاظ عليها آمنة.';

  @override
  String get riskDisclosureAccept => 'أفهم، متابعة';

  @override
  String get secretInfo =>
      'في الشاشة التالية ، سترى العبارة السرية الخاصة بك. إنها كلمة مرور للوصول إلى أموالك. من الأهمية أن تقوم بنسخه احتياطيًا وأن لا تشاركه أبدًا مع أي شخص.';

  @override
  String get secretInfoHeader => 'السلامة اولا!';

  @override
  String get secretPhrase => 'العبارة السرية';

  @override
  String get verifyBackupTitle => 'تحقق من نسختك الاحتياطية';

  @override
  String get verifyBackupInstruction =>
      'اختر الكلمة الصحيحة لكل موضع للتأكد من أنك حفظت عبارتك السرية.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'ما هي الكلمة رقم $index؟';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'هذا ليس صحيحًا تمامًا. تحقق من نسختك الاحتياطية وحاول مرة أخرى.';

  @override
  String get secretPhrase12Words => '12 كلمة';

  @override
  String get secretPhrase24Words => '24 كلمة';

  @override
  String get secretWarning =>
      'إذا فقدت جهازك أو قمت بحذف التطبيق ، فستحتاج إلى عباراتك السرية أو بمفتاح سري لاسترداد أموالك!';

  @override
  String get securityHeader => 'تأمين';

  @override
  String get securitySettingsBiometrics =>
      'قم بالمصادقة للوصول إلى إعدادات الأمان';

  @override
  String get securitySettingsPin => 'أدخل رمز PIN للوصول إلى إعدادات الأمان';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'توقيع رسالة';

  @override
  String get signMessageCopySignature => 'نسخ التوقيع';

  @override
  String get signMessageDescription => 'وقّع رسالة بأحد عناوين محفظتك';

  @override
  String get signMessageHint => 'أدخل رسالة لتوقيعها';

  @override
  String get signMessageSignatureCopied => 'تم نسخ التوقيع';

  @override
  String get signMessageSigned => 'تم توقيع الرسالة';

  @override
  String get signMessageTooLong => 'الرسالة طويلة جدًا';

  @override
  String get seedInvalid => 'مفتاح خاص غير صحيح';

  @override
  String get nodeUnreachable =>
      'تعذر الوصول إلى العقدة الخاصة بك. قد تكون الأرصدة قديمة.';

  @override
  String get nodeUnreachableRetry => 'إعادة المحاولة';

  @override
  String get send => 'إرسال';

  @override
  String get sendConfirm => 'Send';

  @override
  String get sendError => 'يوجد خطأ. حاول لاحقاً.';

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
  String get sending => 'إرسال';

  @override
  String get sent => 'تم الارسال';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'إنشاء كلمة مرور\n';

  @override
  String get setPasswordSuccess => 'تم إنشاء كلمة مرور المحفظة بنجاح\n';

  @override
  String get setWalletPassword => 'إنشاء كلمة مرور المحفظة\n';

  @override
  String get settingsHeader => 'الإعدادات';

  @override
  String get settingsTransfer => 'تحميل من المحفظة الورقية';

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
  String get systemDefault => 'النظام الافتراضي';

  @override
  String get tapToHide => 'إضغط للاخفاء';

  @override
  String get tapToReveal => 'اضغط للكشف';

  @override
  String get themeDark => 'Dark Theme';

  @override
  String get themeHeader => 'مظهر';

  @override
  String get themeLight => 'Light Theme';

  @override
  String get toggleTheme => 'تبديل المظهر';

  @override
  String get thisWallet => '#This Wallet';

  @override
  String get to => 'إلى';

  @override
  String get toAddress => 'To Address';

  @override
  String get tooManyFailedAttempts => 'العديد من محاولات الفتح الفاشلة.';

  @override
  String get totalValue => 'Total Value';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get transactionsUppercase => 'TRANSACTIONS';

  @override
  String get transfer => 'تحويل';

  @override
  String get transferClose => 'اضغط في أي مكان لغلق النافذة.';

  @override
  String transferComplete(String amount) {
    return 'تم تحويل $amount HTN إلى محفظة نتريوم.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'تم كشف محفظة برصيد $amount HTN.\n';
  }

  @override
  String get transferConfirmInfoSecond => 'إضغط لتأكيد تحويل الرصيد.\n';

  @override
  String get transferConfirmInfoThird => 'قد يستغرق النقل عدة ثوانيٍ.';

  @override
  String get transferError =>
      'لقد حدث خطأ أثناء النقل. الرجاء إعادة المحاولة في وقت لاحق.';

  @override
  String get transferHeader => 'تحويل الرصيد';

  @override
  String transferIntro(String button) {
    return 'ستقوم هذه العملية بتحويل الرصيد من المحفظة الورقية إلى محفظة نتريوم الخاصة بك. \n\n اضغط على الزر \"$button\" للبدء.';
  }

  @override
  String get transferLoading => 'بصدد التحويل';

  @override
  String get transferManualHint => 'الرجاء إدخال المفتاح الخاص.';

  @override
  String get transferNoFunds => 'هذا المفتاح الخاص لا يحتوي على HTN';

  @override
  String get transferQrScanError =>
      'لا يحتوي رمز الاستجابة السريعة على مفتاح خاص صحيح.';

  @override
  String get transferQrScanHint => 'مسح\n المفتاح الخاص';

  @override
  String get unconfirmed => 'unconfirmed';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'unknown';

  @override
  String get unlock => 'فتح';

  @override
  String get unlockBiometrics => 'مصادقة لفتح نتريوم';

  @override
  String get unlockPin => 'أدخل الPIN لفتح نتريوم';

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
  String get warning => 'تحذير';

  @override
  String welcomeMessage(String version) {
    return 'Welcome!\n\nThis is version $version of Hoosat Mobile - the mobile wallet for Hoosat';
  }

  @override
  String get welcomeText =>
      'أهلا بك في نتريوم. لتبدأ، إحدث محفظة أو إجلب محفظة موجودة.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString دقائق',
      one: '1 دقيقة',
    );
    return 'بعد $_temp0';
  }

  @override
  String get yes => 'نعم';

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
      'لديك العديد من المخرجات غير المنفقة الصغيرة (UTXO). سيؤدي الدمج إلى ضمّها في عدد أقل من UTXO أكبر حجماً، مما يجعل التحويلات المستقبلية أسرع وقد يتطلب رسوماً أقل. هذا ينشئ معاملة واحدة أو أكثر ويستتبع رسوم شبكة.';

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
  String get fundsStillConfirmingTitle => 'الأموال قيد التأكيد';

  @override
  String get fundsStillConfirmingBody =>
      'استُلم جزء من الأموال في هذا الحساب مؤخرًا جدًا بحيث لا يمكن إرساله بعد — تتطلب الشبكة أولًا فترة نضج قصيرة، عادةً بضع دقائق. يمكنك الانتظار والمحاولة مرة أخرى، أو الإرسال من حساب آخر لديه أموال ناضجة.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'تبديل الحساب';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'التجميع في الرئيسي';

  @override
  String get moveToMainDescription =>
      'انقل رصيد جميع العناوين الأخرى إلى عنوانك الرئيسي';

  @override
  String get moveToMainConfirmation => 'نقل كل شيء إلى الرئيسي؟';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'سيؤدي هذا إلى نقل $amount $symbol من $count عنوان/عناوين أخرى إلى عنوانك الرئيسي. سيتم إنشاء معاملة واحدة أو أكثر وستُطبَّق رسوم الشبكة.';
  }

  @override
  String get moveToMainNothingToMove =>
      'رصيد جميع العناوين موجود بالفعل في الرئيسي';

  @override
  String get movingToMain => 'جارٍ التجميع في الرئيسي';

  @override
  String get moveToMainSuccess => 'تم النقل إلى الرئيسي بنجاح';

  @override
  String get moveToMainFailure => 'فشل النقل إلى الرئيسي';

  @override
  String get moveToMainUppercased => 'نقل';

  @override
  String get manageAccounts => 'الحسابات';

  @override
  String get manageAccountsDescription => 'أضف العناوين المسمّاة وأدرها';

  @override
  String get mainAccountLabel => 'الرئيسي';

  @override
  String get archiveAction => 'أرشفة';

  @override
  String get restoreAction => 'استعادة';

  @override
  String get archivedAccountsHeader => 'المؤرشفة';

  @override
  String get noAdditionalAccountsYet => 'لا توجد حسابات إضافية بعد';

  @override
  String get renameAccount => 'إعادة تسمية الحساب';

  @override
  String get accountLabelHint => 'اسم الحساب';

  @override
  String get saveUppercased => 'حفظ';

  @override
  String get addUppercased => 'إضافة';

  @override
  String get sendFromLabel => 'من';

  @override
  String get sendFromAny => 'أي حساب';

  @override
  String get home => 'الرئيسية';

  @override
  String get activity => 'النشاط';

  @override
  String get totalBalance => 'الرصيد الإجمالي';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'متاح للإنفاق الآن $spendable · لا يزال قيد الوصول $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'العملات التي لا تزال قيد الوصول ملكك ويمكن إنفاقها قريبًا.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'يمكن إنفاق العملات التي لا تزال قيد الوصول خلال $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'متاح للإنفاق الآن $amount. يمكن إنفاق الباقي خلال $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'متاح للإنفاق الآن $amount. الباقي لا يزال قيد الوصول.';
  }

  @override
  String get txTagWaiting => 'بانتظار القبول';

  @override
  String get txTagStatusUnknown => 'الحالة غير معروفة';

  @override
  String get txTagNotAccepted => 'غير مقبولة';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'جارٍ التأكيد $n / $total';
  }

  @override
  String get submittedTo => 'أُرسلت إلى';

  @override
  String get testConnection => 'اختبار الاتصال';

  @override
  String get accountsOtherWalletHeader => 'محفوظة من محفظة أخرى (للعرض فقط)';

  @override
  String get accountsOtherWalletNote =>
      'لا يمكن لهذه المحفظة إنفاقها، لذلك لا تُحتسب ضمن إجماليها. افتح المحفظة التي تنتمي إليها لاستخدامها.';

  @override
  String get noActivityTitle => 'لا يوجد نشاط بعد';

  @override
  String get txTypeSent => 'مُرسَل';

  @override
  String get txTypeReceived => 'مُستلَم';

  @override
  String get txTypeThisWallet => 'داخل المحفظة';

  @override
  String get txTypeMerged => 'عملات مدموجة';

  @override
  String get noActivityMessage => 'عند إرسال HTN أو استلامه، سيظهر هنا.';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get show => 'عرض';

  @override
  String get myAccounts => 'حساباتي';

  @override
  String homeGreeting(String walletName) {
    return 'مرحبًا، $walletName';
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
  String get importOptionStandardWalletTitle => 'استيراد محفظة قياسية';

  @override
  String get importOptionStandardWalletDescription =>
      'محافظ من 12 أو 24 كلمة بالاشتقاق القياسي مع عبارة مرور BIP39 اختيارية';

  @override
  String get importOptionLegacyWalletTitle => 'استيراد محفظة قديمة';

  @override
  String get importOptionLegacyWalletDescription =>
      'محافظ من 12 كلمة بالاشتقاق القديم، متوافقة مع Web Wallet القديمة وKDX';

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
  String get changeAddressModeTitle => 'سلوك عنوان الباقي';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'يحتفظ كل عنوان برصيده الخاص ويبقى الباقي في مكانه';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'يُستخدم عنوان جديد في كل مرة (خاص، ويتوزع الرصيد)';

  @override
  String get changeAddressModeDialogTitle => 'سلوك عنوان الباقي';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'الاحتفاظ بالأرصدة على كل عنوان';

  @override
  String get changeAddressModeDialogOptionPrivate => 'خاص';

  @override
  String get requestPasswordHeader => 'طلب كلمة المرور';

  @override
  String get requestPasswordAtLaunch => 'عند التشغيل';

  @override
  String get requestPasswordWhenLocked => 'عند القفل';

  @override
  String get requestPasswordWhenSigning => 'عند التوقيع';

  @override
  String get importWalletAdvancedOptions => 'خيارات متقدمة';

  @override
  String get bip39Passphrase => 'عبارة مرور BIP39';

  @override
  String get bip39PassphraseWarning =>
      'ملاحظة: هذه ليست كلمة مرور المحفظة؛ عبارات مرور BIP39 المختلفة تفتح محافظ مختلفة.';

  @override
  String get bip39PassphraseEnter => 'أدخل عبارة المرور';

  @override
  String get bip39PassphraseConfirm => 'أكّد عبارة المرور';

  @override
  String get bip39PassphraseMismatch => 'عبارتا المرور غير متطابقتين!';

  @override
  String get bip39PassphraseNote => 'محفظة بعبارة مرور BIP39.';

  @override
  String get feePriorityHint => 'أدخل رسوم الأولوية';

  @override
  String get feeBaseUppercase => 'الرسوم الأساسية';

  @override
  String get feePriorityUppsercase => 'رسوم الأولوية';

  @override
  String get feeUpdateAddressError => 'تعذر التعرف على عنوان الوجهة';

  @override
  String get feeUpdateRebuildError => 'تعذرت إعادة بناء المعاملة';

  @override
  String get feeUpdateRebuildError2 =>
      'تعذرت إعادة بناء المعاملة بالرسوم الجديدة';

  @override
  String get feeUpdateError => 'تعذر تحديث الرسوم';

  @override
  String get feeUpdate => 'تحديث الرسوم';

  @override
  String get feeUpdateTitle => 'جارٍ تحديث الرسوم';

  @override
  String get feeSheetRecommendedPriority => 'رسوم الأولوية الموصى بها';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'يجب ألا تقل رسوم الأولوية الجديدة عن $amount $symbol';
  }

  @override
  String get txPending => 'قيد الانتظار';

  @override
  String get txPendingMessage => 'هذه المعاملة قيد الانتظار';

  @override
  String get txPendingTitle => 'معاملة قيد الانتظار';

  @override
  String get txPendingContent => 'توجد معاملات قيد الانتظار في mempool.';

  @override
  String get txPendingActionUpdateFee => 'تحديث رسوم المعاملة';

  @override
  String get txPendingActionRbf => 'الاستبدال بالرسوم (RBF)';

  @override
  String get txInMempool => 'في mempool';

  @override
  String get utxoSelectionTitle => 'اختيار UTXO';

  @override
  String get utxoSelectionHint => 'يُرجى اختيار المزيد من UTXO';
}
