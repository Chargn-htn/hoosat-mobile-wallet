// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get account => 'חשבון';

  @override
  String get accounts => 'חשבונות';

  @override
  String get ackBackedUp => 'האם אתם בטוחים ששמרתם את הביטוי הסודי שלכם?';

  @override
  String get add => 'הוספה';

  @override
  String get addAccount => 'הוסף חשבון';

  @override
  String get addContact => 'הוסף איש קשר';

  @override
  String get addNode => 'הוסף צומת';

  @override
  String get addNodeFailed => 'הוספת צומת כספא נכשלה';

  @override
  String addNodeFailedMessage(String error) {
    return 'שגיאה: $error';
  }

  @override
  String get addNodeSuccess => 'צומת הוספה בהצלחה';

  @override
  String get addingNodeMessage => 'אנא המתינו בזמן יצירת קשר עם צומת';

  @override
  String get addingNodeTitle => 'מוסיף צומת';

  @override
  String get address => 'כתובת ';

  @override
  String get addressCopied => 'כתובת הועתקה';

  @override
  String get addressCopiedFailed => 'נכשל להעתיק את הכתובת';

  @override
  String get addressHint => 'הזן כתובת';

  @override
  String get addressMising => 'אנא הזן כתובת';

  @override
  String get addressShare => 'שתף כתובת';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'מתקדם ';

  @override
  String get amount => 'סכום ';

  @override
  String amountConfirm(String amount, String coin) {
    return 'סכום $amount $coin';
  }

  @override
  String get amountMissing => 'הזן סכום';

  @override
  String get amountZero => 'הסכום לא יכול להיות אפס';

  @override
  String get areYouSure => 'את/ה בטוח/ה?';

  @override
  String get authBiometricMessage => 'התאמתו על מנת להוסיף ארנק';

  @override
  String get authMethod => 'שיטת אימות';

  @override
  String get authPinMessage => 'הזן קוד להוספת ארנק';

  @override
  String get autoLockHeader => 'נעל באופן אוטומטי';

  @override
  String get available => 'זמין';

  @override
  String get back => 'Back';

  @override
  String get backupConfirmButton => 'גיביתי במקום בטוח';

  @override
  String get backupSecretPhrase => 'גבה את הביטוי הסודי';

  @override
  String get missingSecretPhrase => 'Missing Secret Phrase';

  @override
  String get biometricsMethod => 'ביומטריה';

  @override
  String get blockExplorer => 'בלוק אקספלורר';

  @override
  String get cancel => 'בטל';

  @override
  String get change => 'עודף ';

  @override
  String get changeAddress => 'כתובת עודף';

  @override
  String get changeAddressCopied => 'כתובת עודף הועתקה';

  @override
  String get changeIndex => 'עודף אינדקס';

  @override
  String changeIndexParam(String addressIndex) {
    return 'עודף $addressIndex';
  }

  @override
  String get checkCameraPermission => 'אנא בדקו הרשאות מצלמה';

  @override
  String get clipboardEmpty => 'לוח העתקה ריק';

  @override
  String get close => 'סגור';

  @override
  String get confirm => 'אשר';

  @override
  String get confirmPasswordHint => 'אשר את הסיסמה';

  @override
  String confirmations(String confirmations) {
    return '$confirmations אישורים';
  }

  @override
  String get confirmed => 'מאושר';

  @override
  String get confirming => 'מאשר';

  @override
  String contactAdded(String contactName) {
    return '$contactName נוסף לאנשי הקשר';
  }

  @override
  String contactAddressCopied(String address) {
    return 'הכתובת $address הועתקה';
  }

  @override
  String get contactExists => 'איש קשר כבר קיים';

  @override
  String get contactHeader => 'איש קשר';

  @override
  String get contactInvalid => 'שם איש קשר לא תקין';

  @override
  String get contactNameHint => 'הזן שם @';

  @override
  String get contactNameMissing => 'בחרו שם עבור איש קשר זה';

  @override
  String contactRemoved(String contactName) {
    return '$contactName הוסר מאנשי הקשר!';
  }

  @override
  String get contactsHeader => 'אנשי קשר';

  @override
  String get contactsImportErr => 'ייבוא איש קשר נכשל';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'יבוא אנשי הקשר של $noContacts עבר בהצלחה';
  }

  @override
  String get copied => 'הועתק';

  @override
  String get copy => 'העתק';

  @override
  String get copyAddress => 'העתק כתובת';

  @override
  String get copyErrorButton => 'שגיאת העתקה';

  @override
  String get createAPasswordHeader => 'צור סיסמה';

  @override
  String get createPasswordFirstParagraph =>
      'ניתן לבחור סיסמה כדי להוסיף אבטחה נוספת לארנק';

  @override
  String get createPasswordHint => 'צור סיסמה';

  @override
  String get createPasswordSecondParagraph =>
      'ניתן לדלג על בחירת הסיסמה. הארנק מאובטח על ידי הקוד הסודי או טביעת אצבע בכל מקרה.';

  @override
  String get createPasswordSheetHeader => 'צור';

  @override
  String get currency => 'מטבע חליפין';

  @override
  String get currencyPoweredBy => 'מופעל על ידי CoinGecko';

  @override
  String get defaultAccountName => 'כתובת 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'כתובת $addressIndex';
  }

  @override
  String get defaultWalletName => 'הארנק שלי';

  @override
  String get disablePasswordSheetHeader => 'בטל';

  @override
  String get disablePasswordSuccess => 'הסיסמה בוטלה';

  @override
  String get disableWalletPassword => 'בטל את סיסמת הארנק';

  @override
  String get doContinue => 'המשך';

  @override
  String get donate => 'תרומה';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'אל תציג שוב';

  @override
  String get emptyCardIntroUtxos => 'לשונית ה-UTXO. כל ה-UTXO בארנק יופיעו פה';

  @override
  String get emptyResult => 'תוצאה ריקה';

  @override
  String get emptyWalletName => 'שם הארנק אינו יכול להיות ריק';

  @override
  String get encryptionFailedError => 'הגדרת סיסמת הארנק נכשלה';

  @override
  String get enterAddress => 'הזן כתובת';

  @override
  String get enterAmount => 'הזן כמות';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'הזן הערה';

  @override
  String get enterPasswordHint => 'הזן סיסמה';

  @override
  String get errorMessageCopied => 'הודעת שגיאת הועתקה ללוח העתקות';

  @override
  String get exampleCardIntro =>
      'זוהי לשונית עסקאות. לאחר שתשלחו או תקבלו עסקה, היא תופיע פה.';

  @override
  String get export => 'יצוא';

  @override
  String get fee => 'עמלה';

  @override
  String feeConfirm(String amount, String coin) {
    return 'עמלה $amount $coin';
  }

  @override
  String get feeTitle => 'עמלה';

  @override
  String get fetchingTransactions => 'הבאת עסקאות';

  @override
  String get fingerprintSeedBackup => 'התאמתו כדי לגבות את הביטוי הסודי';

  @override
  String get goBackButton => 'חזור';

  @override
  String get gotItButton => 'הבנתי!';

  @override
  String get import => 'יבוא';

  @override
  String get importSecretPhrase => 'יבוא ביטוי סודי';

  @override
  String get importSecretPhraseHint => 'הזן את 24 מילות הביטוי הסודי למטה ';

  @override
  String get importSecretPhraseHintCombo =>
      'אנא הזן את הביטוי הסודי שלך בן 12 או 24 מילים למטה';

  @override
  String get importSecretPhraseHintLegacy =>
      'הזן את 12 מילות הביטוי הסודי למטה ';

  @override
  String get importWallet => 'יבוא ארנק';

  @override
  String get importWalletDescription => 'אנא בחר אפשרות למטה';

  @override
  String get instantly => 'באופן מידי';

  @override
  String get insufficientBalance => 'אין מספיק מטבעות בחשבון';

  @override
  String get insufficientBalanceDetails => 'אין מספיק כספא לעסקה זו';

  @override
  String get invalidAddress => 'כתובת יעד שהוזנה אינה תקינה';

  @override
  String get invalidAmount => 'סכום לא חוקי';

  @override
  String get invalidChecksumMessage => 'בבקשה תבדוק שהזנת נכון את הביטוי הסודי';

  @override
  String get invalidKpubMessage =>
      'אנא בדוק שהמפתח הציבורי המורחב שלך הוזן כראוי!';

  @override
  String get invalidDestinationAddress => 'כתובת יעד לא חוקית';

  @override
  String get invalidPassword => 'סיסמה לא חוקית';

  @override
  String get hoosatDevFund => 'קרן פיתוח כספא';

  @override
  String get hoosatMobile => 'ארנק כספיום';

  @override
  String get language => 'שפה';

  @override
  String get loadingTransactions => 'טוען עסקאות...';

  @override
  String get lockAppSetting => 'בצע אימות בעת הפעלה';

  @override
  String get locked => 'נעול';

  @override
  String get loggingOutMessage => 'מתנתק מהמערכת...';

  @override
  String get logout => 'התנתקות';

  @override
  String get logoutDialogContent => 'בטוחים שאתם רוצים להתנתק מהארנק?';

  @override
  String get logoutOrSwitchWallet => 'התנתקות / שינוי ארנק';

  @override
  String get manage => 'נהל';

  @override
  String get manualEntry => 'הזנה ידנית';

  @override
  String get networkHeader => 'רשת';

  @override
  String get newAddress => 'כתובת חדשה';

  @override
  String get newWallet => 'ארנק חדש';

  @override
  String get nextButton => 'הבא';

  @override
  String get no => 'לא';

  @override
  String get noContactsExport => 'לא קיימים אנשי קשר לייצא';

  @override
  String get noContactsImport => 'לא נמצאו אנשי קשר לייבוא';

  @override
  String get noQrCodeFound => 'קוד QR לא נמצא';

  @override
  String get noSkipButton => 'לא, דלג';

  @override
  String get noUppercase => 'לא';

  @override
  String get nodeAddress => 'צומת כספא';

  @override
  String get nodeDeleteMessage => 'בטוחים שברצונכם למחוק?';

  @override
  String get nodeDeleteTitle => 'למחוק את הגדרות צומת הכספא?';

  @override
  String get nodeNameEmpty => 'שם הצומת אינו יכול להיות ריק';

  @override
  String get nodeNameHint => 'הזן את שם הצומת';

  @override
  String get nodeUrlHint => 'הזן את כתובת הצומת';

  @override
  String get nodeUrlInvalid => 'כתובת הצומת אינה חוקית';

  @override
  String get nodesSheetTitle => 'צמתי כספא';

  @override
  String get off => 'כבוי';

  @override
  String get on => 'פועל';

  @override
  String get paperWallet => 'ארנק נייר';

  @override
  String get passwordBlank => 'הסיסמה לא יכולה להיות ריקה';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'אין צורך בסיסמה לפתיחת ארנק זה';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'חייבים להשתמש בסיסמה זו לפתיחת הארנק.';

  @override
  String get passwordsDontMatch => 'הסיסמאות לא תואמות';

  @override
  String get pasteMnemonicError => 'תוכן לוח העתקה אינו ביטוי סודי חוקי';

  @override
  String get pending => 'בהמתנה';

  @override
  String get pinConfirmError => 'הקודים אינם תואמים';

  @override
  String get pinConfirmTitle => 'אשר את הקוד';

  @override
  String get pinCreateTitle => 'יצר קוד באורך 6 ספרות';

  @override
  String get pinEnterTitle => 'הזן קוד';

  @override
  String get pinInvalid => 'הוזן קוד לא תקין';

  @override
  String get pinMethod => 'קוד';

  @override
  String get pinSeedBackup => 'הזן קוד כדי לגבות את הביטוי הסודי';

  @override
  String get preferences => 'העדפות';

  @override
  String get privacyPolicy => 'מדיניות הפרטיות';

  @override
  String get qrInvalidAddress => 'קוד ה-QR לא מכיל כתובת חוקית';

  @override
  String get qrInvalidSeed => 'הברקוד אינו מכיל \"סיד\" תקין או מפתח פרטי';

  @override
  String get qrMnemonicError => 'ה-QR קוד לא מכיל ביטוי סודי חוקי';

  @override
  String get receive => 'קבל';

  @override
  String get receiveAddress => 'כתובת קבלה';

  @override
  String get receiveAddressCopied => 'כתובת קבלה הועתקה';

  @override
  String get receiveIndex => 'אינדקס קבלה';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'אינדקס כתובת מקבלת $addressIndex';
  }

  @override
  String get received => 'התקבל';

  @override
  String get removeContact => 'הסר איש קשר';

  @override
  String removeContactConfirmation(String contactName) {
    return 'האם אתה בטוח שאתה רוצה למחוק את $contactName?';
  }

  @override
  String get removeWalletAction => 'הסר ארנק';

  @override
  String get removeWalletBiometricsMessage => 'אישור הסרת ארנק';

  @override
  String get removeWalletDetail =>
      'אזהרה 🛑\nהסרת הארנק יגרום למחיקת הביטוי הסודי וכל המידע והנתונים הקשורים \nלארנק מהמכשיר הזה.\nאם הביטוי הסודי לא מגובה / שמור בנפרד איתכם, אתם תאבדו את הגישה לארנק והכספים שלכם!';

  @override
  String get removeWalletPinMessage => 'הזן קוד להסרת הארנק';

  @override
  String get removeWalletReassurance =>
      'כל עוד הביטוי הסודי שלכם מגובה / שמור בנפרד איתכם אז אין לכם על מה לדאוג ';

  @override
  String get requireAPasswordToOpenHeader => 'האם לדרוש סיסמה לפתיחת הארנק?';

  @override
  String get restartSetupButton => 'הפעל מחדש את ההכנה';

  @override
  String get scanQrCode => 'סרוק ברקוד';

  @override
  String get scanQrCodeError => 'ניתוח קוד ה-QR נכשל';

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
      'המסך הבא יראה את הביטוי הסודי שלכם. זה ביטוי שמאפשר לכם גישה לכספים שלכם.\nמאוד חשוב שתשמרו את הביטוי במקום בטוח בנפרד למכשיר ושלא תשתפו אותו עם אנשים אחרים!';

  @override
  String get secretInfoHeader => 'בטיחות קודמת לכול!';

  @override
  String get secretPhrase => 'ביטוי סודי';

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
      'אם תאבדו את המכשיר או תורידו את האפליקציה מהמכשיר אתם תצטרכו להשתמש בביטוי הסודי כדי לגשת לכספים שלכם! ';

  @override
  String get securityHeader => 'אבטחה';

  @override
  String get securitySettingsBiometrics =>
      'Authenticate to Access Security Settings';

  @override
  String get securitySettingsPin => 'Enter PIN to Access Security Settings';

  @override
  String get seed => 'סיד';

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
  String get seedInvalid => 'ה\"סיד\" אינו תקין';

  @override
  String get nodeUnreachable =>
      'Can\'t reach your node. Balances may be out of date.';

  @override
  String get nodeUnreachableRetry => 'Retry';

  @override
  String get send => 'שלח';

  @override
  String get sendConfirm => 'שלח';

  @override
  String get sendError => 'קרתה תקלה. נסה שוב מאוחר יותר';

  @override
  String get sendNote => 'הערה';

  @override
  String get sendToAddressTitle => 'אל';

  @override
  String get sendTxProgressDescription => 'אנא המתינו בעת שליחת העסקה';

  @override
  String get sendTxProgressTitle => 'העסקה נשלחת';

  @override
  String get sending => 'שלח';

  @override
  String get sent => 'נשלח';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'הגדר סיסמה';

  @override
  String get setPasswordSuccess => 'סיסמת הארנק הוגדרה';

  @override
  String get setWalletPassword => 'הגדר סיסמת הארנק';

  @override
  String get settingsHeader => 'הגדרות';

  @override
  String get settingsTransfer => 'טען מארנק נייר';

  @override
  String get setupFailedMessage => 'משהו השתבש';

  @override
  String get shareHoosatMobile => 'שתף את כספיום';

  @override
  String get shareHoosatMobileSubject => 'תראו כמה מגניב כספיום';

  @override
  String get shareHoosatMobileText =>
      'תראו את כספיום - ארנק כספא לנייד.\nאתר - mobile.hoosat.fi';

  @override
  String get somethingWentWrong => 'משהו השתבש';

  @override
  String get systemDefault => 'ברירת מחדל';

  @override
  String get tapToHide => 'הקש להחביא';

  @override
  String get tapToReveal => 'הקש להראות';

  @override
  String get themeDark => 'מצב תצוגה כהה';

  @override
  String get themeHeader => 'ערכת נושא';

  @override
  String get themeLight => 'מצב תצוגה בהיר';

  @override
  String get toggleTheme => 'Switch theme';

  @override
  String get thisWallet => '#ארנק זה';

  @override
  String get to => 'מ-';

  @override
  String get toAddress => 'לכתובת';

  @override
  String get tooManyFailedAttempts => 'יותר מדי נסיונות כושלים לשחרור הנעילה.';

  @override
  String get totalValue => 'ערך כולל ';

  @override
  String get transactionId => 'מספר עסקה';

  @override
  String get transactionsUppercase => 'עסקאות';

  @override
  String get transfer => 'העבר';

  @override
  String get transferClose => 'לחץ בכל מקום בכדי לסגור את החלון.';

  @override
  String transferComplete(String amount) {
    return '$amount כספא הועברו לארנק כספיום בהצלחה.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'ארנק עם מאזן של $amount כספא אותר.';
  }

  @override
  String get transferConfirmInfoSecond => 'לחץ על אשר בכדי להעביר את הסכום.\n';

  @override
  String get transferConfirmInfoThird => 'העברה יכולה לקחת מספר שניות';

  @override
  String get transferError => 'חלה תקלה במהלך ההעברה. בבקשה נסה מאוחר יותר.';

  @override
  String get transferHeader => 'העבר כספים';

  @override
  String transferIntro(String button) {
    return 'התהליך יעביר את הסכום שברשותך מארנק הנייר לארנק כספיום\n\nלחץ על כפתור ה-\"$button\" כדי להתחיל.';
  }

  @override
  String get transferLoading => 'מעביר';

  @override
  String get transferManualHint => 'אנא הזן את ה\"סיד\" למטה';

  @override
  String get transferNoFunds => 'ה\"סיד\" אינו מכיל שום כספא';

  @override
  String get transferQrScanError => 'הברקוד אינו מכיל \"סיד\" תקין';

  @override
  String get transferQrScanHint => 'סרוק \"סיד\" של \nכספא או מפתח פרטי';

  @override
  String get unconfirmed => 'לא מאושר';

  @override
  String get notAccepted => 'לא התקבל';

  @override
  String get accepted => 'התקבל';

  @override
  String get unknown => 'לא ידוע';

  @override
  String get unlock => 'שחרר מנעילה';

  @override
  String get unlockBiometrics => 'התאמתו כדי לשחרר ארנק מנעילה';

  @override
  String get unlockPin => 'הזן קוד על מנת לשחרר ארנק מנעילה';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'הצג כתובת';

  @override
  String get viewTransaction => 'הצג עסקה';

  @override
  String get walletAddresses => 'כתובות הארנקים';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'שם הארנק';

  @override
  String get walletNameDescription => 'הזן שם לארנק שלך';

  @override
  String get walletNameHint => 'שם הארנק';

  @override
  String get walletSetupAddressDiscovery => 'מריץ גילוי כתובות';

  @override
  String get walletSetupMessage => 'הכנת ארנק';

  @override
  String get walletsTitle => 'ארנקים';

  @override
  String get warning => 'אזהרה';

  @override
  String welcomeMessage(String version) {
    return 'ברוכים הבאים!\n\nזו גרסה $version של כספיום - ארנק כספא לנייד';
  }

  @override
  String get welcomeText =>
      'ברוך הבא לכספיום. כדי להתחיל, ניתן ליצור ארנק חדש או לייבא אחד קיים.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString דקות',
      one: '1 דקה',
    );
    return 'אחרי $_temp0';
  }

  @override
  String get yes => 'כן';

  @override
  String get yesButton => 'כן';

  @override
  String get yesUppercase => 'כן';

  @override
  String get nodeNotSyncedException => 'הצומת אינה בסנכרון מלא';

  @override
  String get nodeNoUTXOIndexException => 'בצומת אין אינדקס UTXO';

  @override
  String get nodeSecureConnection => 'חיבור מאובטח';

  @override
  String get hoosatUriInvalid => 'URI של כספא לא חוקי';

  @override
  String get compoundUtxos => 'עסקאות מורכבות';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'יש לך הרבה פלטים לא-מוצאים קטנים (UTXO). איחוד ימזג אותם לפחות UTXO גדולים יותר כך שהעברות עתידיות יהיו מהירות יותר ואולי עם עמלות נמוכות יותר. פעולה זו יוצרת עסקה אחת או יותר ומחייבת עמלות רשת.';

  @override
  String get compoundUtxosDescription => 'שלב מספר UTXOs לאחד';

  @override
  String get compoundUtxosConfirmation => 'עסקאות מורכבות?';

  @override
  String get compoundingUtxos => 'עסקאות מורכבות';

  @override
  String get compoundingMessage => 'בבקשה תחכה...';

  @override
  String get compoundSuccess => 'הרכבה הוצלחה';

  @override
  String get compoundFailure => 'נכשל בהרכבת העסקאות';

  @override
  String get compoundTooFewUtxos => 'נדרשים לפחות שני UTXOs';

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
  String get balance => 'יתרה';

  @override
  String get maxSend => 'מקסימום שליחה';

  @override
  String get compoundUppercased => 'תרכובת';

  @override
  String get closeUppercased => 'סגור';

  @override
  String get scanMoreAddresses => 'סרוק לקבלת כתובות נוספות';

  @override
  String get addressDiscovery => 'גילוי כתובות';

  @override
  String get scanningTitle => 'סורק';

  @override
  String get scanningDescription => 'סורק בשביל כתובות חדשות...';

  @override
  String get scanMore => 'סרוק עוד';

  @override
  String get scanFailedMessage => 'סריקה נכשלה, בבקשה נסה/י מאוחר יותר';

  @override
  String get indexHeader => 'אינדקס';

  @override
  String get currentIndex => 'נוכחי';

  @override
  String get scannedIndex => 'נסרק';

  @override
  String get newIndex => 'חדש';

  @override
  String get addressFilterDialogTitle => 'סנן כתובות';

  @override
  String get addressFilterDialogOptionAllAddresses => 'הצג את כל הכתובות';

  @override
  String get addressFilterDialogOptionNonZeroBalances => 'הצג כתובות עם יתרה ';

  @override
  String get importOption24WordsTitle => 'יבוא ביטוי סודי של 24 מילים';

  @override
  String get importOption24WordsDescription => 'תואם עם Cli Wallet ו- Ledger';

  @override
  String get importOption12WordsTitle => 'ייבוא ​​ביטוי סודי של 12 מילים';

  @override
  String get importOption12WordsDescription => 'תואם עם ארנק Web ו-KDX';

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
  String get importOptionKpubTitle => 'ייבוא ארנק צפייה בלבד';

  @override
  String get importOptionKpubDescription =>
      'עקוב אחר היתרה והעסקאות של ארנק באמצעות מפתח ציבורי מורחב';

  @override
  String get importKpub => 'ייבוא ארנק צפייה בלבד';

  @override
  String get importKpubHint => 'אנא הזן את המפתח הציבורי המורחב שלך.';

  @override
  String get importKpubClipboardError =>
      'תוכן ההתעקה אינו מפתח ציבורי מורחב חוקי';

  @override
  String get importKpubQrCodeError => 'קוד QR אינו מכיל מפתח ציבורי מורחב תקין';

  @override
  String get importKpubInvalidMessage =>
      'אנא בדוק שהמפתח הציבורי המורחב שלך הוזן כראוי!';

  @override
  String get receiveAddressListEmpty => 'רשימת כתובות קבלה ריקה';

  @override
  String get changeAddressListEmpty => 'רשימת הכתובות לשינוי ריקה';

  @override
  String get hintAddressListEmpty =>
      'בדוק את מסנן הכתובות מהפינה השמאלית העליונה';

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
