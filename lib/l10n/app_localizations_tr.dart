// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get account => 'Hesap';

  @override
  String get accounts => 'Hesaplar';

  @override
  String get ackBackedUp => 'Gizli cümlenizi yedeklediğinizden emin misiniz?';

  @override
  String get add => 'Ekle';

  @override
  String get addAccount => 'Hesap Ekle';

  @override
  String get addContact => 'Kişi Ekle';

  @override
  String get addNode => 'Node Ekle';

  @override
  String get addNodeFailed => 'Hoosat node\'u ekleme işlemi başarısız';

  @override
  String addNodeFailedMessage(String error) {
    return 'Başarısız: $error';
  }

  @override
  String get addNodeSuccess => 'Node Başarıyla Eklendi';

  @override
  String get addingNodeMessage =>
      'Node ile iletişim kurulurken lütfen bekleyin';

  @override
  String get addingNodeTitle => 'Node Ekleniyor';

  @override
  String get address => 'Adres';

  @override
  String get addressCopied => 'Adres Kopyalandı';

  @override
  String get addressCopiedFailed => 'Adres kopyalanamadı';

  @override
  String get addressHint => 'Adres Gir';

  @override
  String get addressMising => 'Lütfen Bir Adres Girin';

  @override
  String get addressShare => 'Adresi Paylaş';

  @override
  String get hoosatUriCopied => 'Hoosat URI Adresi Kopyalandı';

  @override
  String get hoosatUriCopyFailed => 'Hoosat URI adresi kopyalanamadı';

  @override
  String get advancedHeader => 'Gelişmiş';

  @override
  String get amount => 'Miktar';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Miktar $amount $coin';
  }

  @override
  String get amountMissing => 'Lütfen Bir Miktar Girin';

  @override
  String get amountZero => 'Miktar, sıfır olamaz';

  @override
  String get areYouSure => 'Emin misiniz?';

  @override
  String get authBiometricMessage =>
      'Cüzdan Eklemek için Kimliğinizi Doğrulayın';

  @override
  String get authMethod => 'Doğrulama Metodu';

  @override
  String get authPinMessage => 'Cüzdan Eklemek için PIN kodunu girin';

  @override
  String get autoLockHeader => 'Otomatik Kilitle';

  @override
  String get available => 'Mevcut';

  @override
  String get back => 'Geri';

  @override
  String get backupConfirmButton => 'Yedekledim';

  @override
  String get backupSecretPhrase => 'Gizli Cümleyi Yedekle';

  @override
  String get missingSecretPhrase => 'Gizli cümle eksik';

  @override
  String get biometricsMethod => 'Biyometrik';

  @override
  String get blockExplorer => 'Blok Tarayıcı';

  @override
  String get cancel => 'İptal';

  @override
  String get change => 'Para Üstü';

  @override
  String get changeAddress => 'Para Üstü Adresi';

  @override
  String get changeAddressCopied => 'Para üstü adresi kopyalandı';

  @override
  String get changeIndex => 'Para Üstü Dizini';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Para üstü $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Lütfen kamera izinlerini kontrol edin';

  @override
  String get clipboardEmpty => 'Pano boş';

  @override
  String get close => 'Kapat';

  @override
  String get confirm => 'Onayla';

  @override
  String get confirmPasswordHint => 'Şifreyi onayla';

  @override
  String confirmations(String confirmations) {
    return '$confirmations onay';
  }

  @override
  String get confirmed => 'onaylandı';

  @override
  String get confirmedMaturing => 'onaylandı · olgunlaşıyor';

  @override
  String get confirming => 'onaylanıyor';

  @override
  String contactAdded(String contactName) {
    return '$contactName rehbere eklendi!';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address adresi kopyalandı';
  }

  @override
  String get contactExists => 'Bu Kişi Zaten Mevcut';

  @override
  String get contactHeader => 'Kişi';

  @override
  String get contactInvalid => 'Geçersiz Kişi İsmi';

  @override
  String get contactNameHint => 'Bir İsim Girin @';

  @override
  String get contactNameMissing => 'Bu Kişi için bir isim seçin';

  @override
  String contactRemoved(String contactName) {
    return '$contactName rehberden silindi!';
  }

  @override
  String get contactsHeader => 'Rehber';

  @override
  String get contactsImportErr => 'Rehberi içe aktarmada sorun oluştu';

  @override
  String contactsImportSuccess(String noContacts) {
    return '$noContacts kişi başarıyla içe aktarıldı';
  }

  @override
  String get copied => 'Kopyalandı';

  @override
  String get copy => 'Kopyala';

  @override
  String get copyAddress => 'Adresi Kopyala';

  @override
  String get copyErrorButton => 'Kopyalama Hatası';

  @override
  String get createAPasswordHeader => 'Bir şifre oluşturun.';

  @override
  String get createPasswordFirstParagraph =>
      'Cüzdanınızı daha güvenli hale getirmek için bir şifre oluşturabilirsiniz.';

  @override
  String get createPasswordHint => 'Şifre oluştur';

  @override
  String get createPasswordSecondParagraph =>
      'Şifre isteğe bağlıdır. Şifre belirlemeseniz de cüzdanınız PIN kodu veya biyometrik doğrulama ile korunur.';

  @override
  String get createPasswordSheetHeader => 'Oluştur';

  @override
  String get currency => 'Para Birimi';

  @override
  String get currencyPoweredBy => 'CoinGecko tarafından desteklenmektedir';

  @override
  String get defaultAccountName => '1. Adres';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Al $addressIndex';
  }

  @override
  String get defaultWalletName => 'Cüzdanım';

  @override
  String get disablePasswordSheetHeader => 'Devre Dışı Bırak';

  @override
  String get disablePasswordSuccess => 'Şifre devre dışı bırakıldı';

  @override
  String get disableWalletPassword => 'Cüzdan Şifresini Devre Dışı Bırak';

  @override
  String get doContinue => 'Devam et';

  @override
  String get donate => 'Bağış Yap';

  @override
  String get donateTo => 'Bağış Yap:';

  @override
  String get dontShowAgain => 'Tekrar gösterme';

  @override
  String get emptyCardIntroUtxos =>
      'Burası UTXO sekmesi. Cüzdanınızdaki tüm UTXO işlemleri burada gösterilir.';

  @override
  String get emptyResult => 'Boş Sonuç';

  @override
  String get emptyWalletName => 'Cüzdan İsmi boş bırakılamaz';

  @override
  String get encryptionFailedError =>
      'Cüzdan şifresi oluşturma işlemi başarısız';

  @override
  String get enterAddress => 'Adres Girin';

  @override
  String get enterAmount => 'Miktar Girin';

  @override
  String get enterFiatValue => 'İtibari Para Değerini Gir';

  @override
  String get enterNote => 'Not Gir';

  @override
  String get enterPasswordHint => 'Şifrenizi girin';

  @override
  String get errorMessageCopied => 'Hata mesajı panoya kopyalandı';

  @override
  String get exampleCardIntro =>
      'Burası işlemler sekmesi. Gönderilen ya da alınan bir işlem olduğunda işlemler burada gösterilir.';

  @override
  String get export => 'Dışa Aktar';

  @override
  String get fee => 'Ücret';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Ücret $amount $coin';
  }

  @override
  String get feeTitle => 'ÜCRET';

  @override
  String get fetchingTransactions => 'İşlemler Çekiliyor';

  @override
  String get fingerprintSeedBackup =>
      'Gizli Cümleyi Yedeklemek için Kimliğinizi Doğrulayın';

  @override
  String get goBackButton => 'Geri Git';

  @override
  String get gotItButton => 'Anladım!';

  @override
  String get import => 'İçe Aktar';

  @override
  String get importSecretPhrase => 'Gizli Cümle Aktar';

  @override
  String get importSecretPhraseHint =>
      'Lütfen 24 kelimelik gizli cümlenizi aşağıya girin.';

  @override
  String get importSecretPhraseHintCombo =>
      'Lütfen 12 veya 24 kelimelik gizli cümlenizi aşağıya girin.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Lütfen 12 kelimelik gizli cümlenizi aşağıya girin.';

  @override
  String get importWallet => 'Cüzdanı İçe Aktar';

  @override
  String get importWalletDescription => 'Lütfen aşağıdaki bir seçeneği seçin.';

  @override
  String get instantly => 'Hemen';

  @override
  String get insufficientBalance => 'Yetersiz Bakiye';

  @override
  String get insufficientBalanceDetails =>
      'Bu işlem için elinizde yeterince HTN bulunmuyor';

  @override
  String get invalidAddress => 'Girilen adres geçerli değil';

  @override
  String get invalidAmount => 'Geçersiz Miktar';

  @override
  String get invalidChecksumMessage =>
      'Lütfen Gizli Cümlenizin doğru girildiğinden emin olun!';

  @override
  String get invalidKpubMessage =>
      'Lütfen genişletilmiş herkese açık anahtarınızın (public key) doğru girildiğinden emin olun!';

  @override
  String get invalidDestinationAddress => 'Hedef Adres Geçersiz';

  @override
  String get invalidPassword => 'Geçersiz Şifre';

  @override
  String get hoosatDevFund => 'Hoosat Geliştirici Fonu';

  @override
  String get hoosatMobile => 'Hoosat Mobile Wallet';

  @override
  String get language => 'Dil';

  @override
  String get loadingTransactions => 'İşlemler Yükleniyor...';

  @override
  String get lockAppSetting => 'Başlangıçta Kimlik Doğrula';

  @override
  String get locked => 'Kilitli';

  @override
  String get loggingOutMessage => 'Çıkış yapılıyor...';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get logoutDialogContent =>
      'Bu cüzdandan çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get logoutOrSwitchWallet => 'Çıkış Yap / Cüzdan Değiştir';

  @override
  String get manage => 'Yönet';

  @override
  String get manualEntry => 'Manuel Giriş';

  @override
  String get networkHeader => 'Ağ';

  @override
  String get newAddress => 'Yeni Adres';

  @override
  String get newWallet => 'Yeni Cüzdan';

  @override
  String get nextButton => 'İleri';

  @override
  String get no => 'Hayır';

  @override
  String get noContactsExport => 'Dışa aktarılabilecek bir kişi bulunamadı';

  @override
  String get noContactsImport => 'İçe aktarılacak yeni bir kişi bulunamadı';

  @override
  String get noQrCodeFound => 'QR kod bulunamadı';

  @override
  String get noSkipButton => 'Hayır, Atla';

  @override
  String get noUppercase => 'HAYIR';

  @override
  String get nodeAddress => 'Hoosat Node\'u';

  @override
  String get nodeDeleteMessage => 'Silmek istediğinizden emin misiniz?';

  @override
  String get nodeDeleteTitle => 'Hoosat Node Ayarları Silinsin mi?';

  @override
  String get nodeNameEmpty => 'Node adı boş bırakılamaz';

  @override
  String get nodeNameHint => 'Node İsmi Girin';

  @override
  String get nodeUrlHint => 'Node Bağlantısı Girin';

  @override
  String get nodeUrlInvalid => 'Geçersiz node bağlantısı';

  @override
  String get nodesSheetTitle => 'Hoosat Node\'ları';

  @override
  String get off => 'Kapalı';

  @override
  String get on => 'Açık';

  @override
  String get paperWallet => 'Kağıt Cüzdan';

  @override
  String get passwordBlank => 'Şifre alanı boş olamaz';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Bu cüzdanı açmak için bir şifreye ihtiyacınız olmayacak.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Bu şifre, bu cüzdanı açmak için gerekecek.';

  @override
  String get passwordsDontMatch => 'Şifreler eşleşmiyor';

  @override
  String get pasteMnemonicError =>
      'Panodaki içerik geçerli bir gizli cümle değil';

  @override
  String get pending => 'beklemede';

  @override
  String get pinConfirmError => 'PIN kodları uyuşmuyor';

  @override
  String get pinConfirmTitle => 'PIN kodunuzu onaylayın';

  @override
  String get pinCreateTitle => '6 haneli bir PIN kodu oluşturun';

  @override
  String get pinEnterTitle => 'PIN kodunu girin';

  @override
  String get pinInvalid => 'Geçersiz bir PIN kodu girdiniz';

  @override
  String get pinMethod => 'PIN Kodu';

  @override
  String get pinSeedBackup => 'Gizli Cümleyi Yedeklemek için PIN Kodunu Girin';

  @override
  String get preferences => 'Tercihler';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get qrInvalidAddress => 'QR kodu geçerli bir adres içermiyor';

  @override
  String get qrInvalidSeed =>
      'QR kodu geçerli bir anahtar cümle (seed) ya da özel anahtar içermiyor';

  @override
  String get qrMnemonicError => 'QR kodu geçerli bir gizli cümle içermiyor';

  @override
  String get receive => 'İste';

  @override
  String get receiveAddress => 'Alma Adresi';

  @override
  String get receiveAddressCopied => 'Alma adresi kopyalandı';

  @override
  String get receiveIndex => 'Alma Dizini';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Al $addressIndex';
  }

  @override
  String get received => 'Alındı';

  @override
  String get removeContact => 'Kişiyi Sil';

  @override
  String removeContactConfirmation(String contactName) {
    return '$contactName kişisini silmek istediğinizden emin misiniz?';
  }

  @override
  String get removeWalletAction => 'Cüzdanı Kaldır';

  @override
  String get removeWalletBiometricsMessage =>
      'Cüzdanı Kaldırmak için Kimliğinizi Doğrulayın';

  @override
  String get removeWalletDetail =>
      'Bu cüzdanı kaldırdığınızda Gizli Cümle ve bu cihazdaki cüzdanla ilgili tüm veriler silinir. Gizli Cümlenizi yedeklemediyseniz bu cüzdandaki varlıklarınıza bir daha asla erişemezsiniz.';

  @override
  String get removeWalletPinMessage =>
      'Cüzdanı Kaldırmak için PIN Kodunu Girin';

  @override
  String get removeWalletReassurance =>
      'Gizli Cümlenizi yedeklediğiniz sürece endişelenmeniz gereken hiçbir şey yoktur.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Bu cüzdan açılırken bir şifre sorulsun mu?';

  @override
  String get restartSetupButton => 'Kurulumu Yeniden Başlat';

  @override
  String get scanQrCode => 'QR Kodu Tara';

  @override
  String get scanQrCodeError => 'QR kodu okuma başarısız';

  @override
  String get scanFromImage => 'Görüntüden tara';

  @override
  String get toggleFlash => 'El fenerini aç/kapat';

  @override
  String get riskDisclosureHeader => 'Başlamadan önce';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet emanetsiz (non-custodial) bir cüzdandır. Gizli cümleniz ve özel anahtarlarınız yalnızca bu cihazda oluşturulur ve saklanır — onları asla görmeyiz, hiçbir sunucuda saklamayız ve sizin için kurtaramayız.';

  @override
  String get riskDisclosureWarning =>
      'Gizli cümlenizi kaybederseniz, parola sıfırlama yoktur ve fonlarınızı geri getirebilecek bir destek ekibi de yoktur. Onu güvende tutmaktan yalnızca siz sorumlusunuz.';

  @override
  String get riskDisclosureAccept => 'Anlıyorum, Devam Et';

  @override
  String get secretInfo =>
      'Bir sonraki ekranda gizli cümlenizi göreceksiniz. Gizli cümle, cüzdanınıza ve bakiyenize erişmenizi sağlayan bir çeşit şifredir. Gizli cümlenizi güvenli bir yerde yedeklemeniz ve kimseyle paylaşmamanız çok önemlidir.';

  @override
  String get secretInfoHeader => 'Önce Güvenlik!';

  @override
  String get secretPhrase => 'Gizli Cümle';

  @override
  String get verifyBackupTitle => 'Yedeğinizi doğrulayın';

  @override
  String get verifyBackupInstruction =>
      'Gizli cümlenizi kaydettiğinizi doğrulamak için her konum için doğru kelimeyi seçin.';

  @override
  String verifyBackupWordPrompt(int index) {
    return '$index. kelime nedir?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Pek doğru değil. Yedeğinizi kontrol edip tekrar deneyin.';

  @override
  String get secretPhrase12Words => '12 kelime';

  @override
  String get secretPhrase24Words => '24 kelime';

  @override
  String get secretWarning =>
      'Cihazınızı kaybederseniz ya da uygulamayı kaldırırsanız bakiyenize erişmek için gizli cümlenize ihtiyacınız olacak!';

  @override
  String get securityHeader => 'Güvenlik';

  @override
  String get securitySettingsBiometrics =>
      'Güvenlik ayarlarına erişmek için kimliğinizi doğrulayın';

  @override
  String get securitySettingsPin =>
      'Güvenlik ayarlarına erişmek için PIN girin';

  @override
  String get seed => 'Anahtar Cümle (Seed)';

  @override
  String get signMessage => 'Mesajı imzala';

  @override
  String get signMessageCopySignature => 'İmzayı kopyala';

  @override
  String get signMessageDescription =>
      'Cüzdan adreslerinizden biriyle bir mesaj imzalayın';

  @override
  String get signMessageHint => 'İmzalanacak bir mesaj girin';

  @override
  String get signMessageSignatureCopied => 'İmza kopyalandı';

  @override
  String get signMessageSigned => 'Mesaj imzalandı';

  @override
  String get signMessageTooLong => 'Mesaj çok uzun';

  @override
  String get seedInvalid => 'Anahtar cümle (seed) geçersiz';

  @override
  String get nodeUnreachable =>
      'Düğümünüze ulaşılamıyor. Bakiyeler güncel olmayabilir.';

  @override
  String get nodeUnreachableRetry => 'Tekrar dene';

  @override
  String get send => 'Gönder';

  @override
  String get sendConfirm => 'Gönder';

  @override
  String get sendError => 'Bir hata oluştu. Lütfen daha sonra tekrar deneyin.';

  @override
  String get sendNote => 'NOT';

  @override
  String get sendToAddressTitle => 'Kime';

  @override
  String get sendTxProgressDescription => 'İşlem gönderilirken lütfen bekleyin';

  @override
  String get sendTxProgressTitle => 'İşlem Gönderiliyor';

  @override
  String get sending => 'Gönder';

  @override
  String get sent => 'Gönderildi';

  @override
  String get sentTo => 'Şu adrese gönderildi:';

  @override
  String get setPassword => 'Şifre Belirle';

  @override
  String get setPasswordSuccess => 'Cüzdan şifresi belirlendi';

  @override
  String get setWalletPassword => 'Cüzdan Şifresi Belirle';

  @override
  String get settingsHeader => 'Ayarlar';

  @override
  String get settingsTransfer => 'Kağıt Cüzdandan Yükle';

  @override
  String get setupFailedMessage => 'Bir hata oluştu';

  @override
  String get shareHoosatMobile => 'Hoosat Mobile\'u Paylaş';

  @override
  String get shareHoosatMobileSubject => 'Hoosat Mobile Wallet\'a göz at';

  @override
  String get shareHoosatMobileText =>
      'Hoosat Mobile - Hoosat Mobil Cüzdana göz atın.\nWeb sitesi - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Bir hata oluştu';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get tapToHide => 'Gizlemek için dokunun';

  @override
  String get tapToReveal => 'Göstermek için dokunun';

  @override
  String get themeDark => 'Karanlık Tema';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Aydınlık Tema';

  @override
  String get toggleTheme => 'Temayı değiştir';

  @override
  String get thisWallet => '#Bu Cüzdan';

  @override
  String get to => 'Adres';

  @override
  String get toAddress => 'Hedef Adres';

  @override
  String get tooManyFailedAttempts =>
      'Çok fazla kilit açma denemesi başarız oldu.';

  @override
  String get totalValue => 'Toplam Değer';

  @override
  String get transactionId => 'İşlem ID\'si';

  @override
  String get transactionsUppercase => 'İŞLEMLER';

  @override
  String get transfer => 'Transfer Et';

  @override
  String get transferClose =>
      'Pencereyi kapatmak için herhangi bir yere dokunun.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN başarıyla Hoosat Mobile Cüzdanınıza transfer edildi.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return '$amount HTN bakiyesine sahip bir cüzdan tespit edildi.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Transfer işlemini başlatmak için onayla düğmesine dokunun.\n';

  @override
  String get transferConfirmInfoThird =>
      'Transfer işleminin tamamlanması birkaç saniye sürebilir.';

  @override
  String get transferError =>
      'Transfer esnasında bir problem oluştu. Lütfen daha sonra tekrar deneyin.';

  @override
  String get transferHeader => 'Bakiye Transferi';

  @override
  String transferIntro(String button) {
    return 'Bu işlem bir kağıt cüzdanda bulunan bakiyeyi Hoosat Mobile cüzdanınıza transfer edecek.\n\nBaşlamak için \"$button\" düğmesine dokunun.';
  }

  @override
  String get transferLoading => 'Transfer Ediliyor';

  @override
  String get transferManualHint =>
      'Lütfen anahtar cümlesini (seed) aşağıya girin.';

  @override
  String get transferNoFunds => 'Bu anahtar cümlesinde (seed) hiç HTN yok.';

  @override
  String get transferQrScanError =>
      'Bu QR kodu geçerli bir anahtar cümle (seed) içermiyor.';

  @override
  String get transferQrScanHint =>
      'Bir Hoosat anahtar\ncümlesi (seed) ya da özel anahtar tarayın';

  @override
  String get unconfirmed => 'onaylanmamış';

  @override
  String get notAccepted => 'kabul edilmedi';

  @override
  String get accepted => 'kabul edildi';

  @override
  String get unknown => 'bilinmiyor';

  @override
  String get unlock => 'Kilidi Aç';

  @override
  String get unlockBiometrics =>
      'Cüzdanın Kilidini Açmak için Kimliğinizi Doğrulayın';

  @override
  String get unlockPin => 'Cüzdanın Kilidini Açmak için PIN Kodunu Girin';

  @override
  String get utxosUppercase => 'UTXO\'lar';

  @override
  String get viewAddress => 'Adresi Göster';

  @override
  String get viewTransaction => 'İşlemi Göster';

  @override
  String get walletAddresses => 'Cüzdan Adresleri';

  @override
  String get walletAddress => 'Cüzdan Adresi';

  @override
  String get walletName => 'Cüzdan adı';

  @override
  String get walletNameDescription => 'Cüzdanınız için bir ad girin';

  @override
  String get walletNameHint => 'Cüzdan Adı';

  @override
  String get walletSetupAddressDiscovery => 'Adres Keşfi Çalıştırılıyor';

  @override
  String get walletSetupMessage => 'Cüzdan kuruluyor';

  @override
  String get walletsTitle => 'Cüzdanlar';

  @override
  String get warning => 'UYARI';

  @override
  String welcomeMessage(String version) {
    return 'Hoş geldiniz!\n\nBu, Hoosat mobil cüzdanı olan Hoosat Mobile\'un $version sürümü.';
  }

  @override
  String get welcomeText =>
      'Hoosat Mobile\'a hoş geldiniz. Başlamak için yeni bir cüzdan oluşturabilir veya var olan bir cüzdanı içe aktarabilirsiniz.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString dakika',
      one: '1 dakika',
    );
    return '$_temp0 sonra';
  }

  @override
  String get yes => 'Evet';

  @override
  String get yesButton => 'Evet';

  @override
  String get yesUppercase => 'EVET';

  @override
  String get nodeNotSyncedException => 'Node senkronize edilmedi';

  @override
  String get nodeNoUTXOIndexException => 'Node\'un UTXO dizini yok';

  @override
  String get nodeSecureConnection => 'Güvenli bağlantı';

  @override
  String get hoosatUriInvalid => 'Geçersiz Hoosat URI Adresi';

  @override
  String get compoundUtxos => 'İşlemleri birleştir';

  @override
  String get compoundRequired => 'Birleştirme Gerekli';

  @override
  String get compoundRequiredDescription =>
      'Birçok küçük harcanmamış çıktınız var. Birleştirme, bunları daha az sayıda ve daha büyük UTXO\'larda toplayarak gelecekteki gönderimlerin daha hızlı ve muhtemelen daha düşük ücretli olmasını sağlar. Bu işlem bir veya daha fazla işlem oluşturur ve ağ ücretleri doğurur.';

  @override
  String get compoundUtxosDescription =>
      'Birden çok UTXO\'yu tek bir UTXO\'da birleştir';

  @override
  String get compoundUtxosConfirmation => 'İşlemler birleştirilsin mi?';

  @override
  String get compoundingUtxos => 'İşlemler birleştiriliyor';

  @override
  String get compoundingMessage => 'Lütfen bekleyin...';

  @override
  String get compoundSuccess => 'Birleştirme işlemi başarılı';

  @override
  String get compoundFailure => 'İşlemler birleştirilemedi';

  @override
  String get fundsStillConfirmingTitle => 'Fonlar hâlâ onaylanıyor';

  @override
  String get fundsStillConfirmingBody =>
      'Bu hesaptaki bazı fonlar henüz gönderilemeyecek kadar yakın zamanda alındı — ağ önce kısa bir olgunlaşma süresi gerektirir, genellikle birkaç dakika. Bekleyip tekrar deneyebilir veya olgunlaşmış fonu olan başka bir hesaptan gönderebilirsiniz.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Hesap değiştir';

  @override
  String get compoundTooFewUtxos => 'En az iki UTXO gerekiyor';

  @override
  String get moveToMain => 'Ana hesapta topla';

  @override
  String get moveToMainDescription =>
      'Diğer tüm adreslerin bakiyesini ana adresinize aktarın';

  @override
  String get moveToMainConfirmation => 'Her şey Ana hesaba taşınsın mı?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Bu işlem, $count diğer adresten $amount $symbol tutarını ana adresinize taşır. Bir veya daha fazla işlem oluşturur ve ağ ücreti doğurur.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Tüm adreslerin bakiyesi zaten Ana hesapta';

  @override
  String get movingToMain => 'Ana hesapta toplanıyor';

  @override
  String get moveToMainSuccess => 'Ana hesaba taşıma başarılı';

  @override
  String get moveToMainFailure => 'Ana hesaba taşıma başarısız';

  @override
  String get moveToMainUppercased => 'Taşı';

  @override
  String get manageAccounts => 'Hesaplar';

  @override
  String get manageAccountsDescription =>
      'Adlandırılmış adresleri ekleyin ve yönetin';

  @override
  String get mainAccountLabel => 'Ana';

  @override
  String get archiveAction => 'Arşivle';

  @override
  String get restoreAction => 'Geri yükle';

  @override
  String get archivedAccountsHeader => 'Arşivlenenler';

  @override
  String get noAdditionalAccountsYet => 'Henüz ek hesap yok';

  @override
  String get renameAccount => 'Hesabı yeniden adlandır';

  @override
  String get accountLabelHint => 'Hesap adı';

  @override
  String get saveUppercased => 'Kaydet';

  @override
  String get addUppercased => 'Ekle';

  @override
  String get sendFromLabel => 'Kaynak';

  @override
  String get sendFromAny => 'Herhangi biri';

  @override
  String get home => 'Ana sayfa';

  @override
  String get activity => 'Etkinlik';

  @override
  String get totalBalance => 'Toplam bakiye';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Şimdi harcanabilir $spendable · Hâlâ gelen $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Hâlâ gelmekte olan paralar sizindir ve yakında harcanabilir.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Hâlâ gelmekte olan paralar $time sonra harcanabilir.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Şimdi harcanabilir $amount. Geri kalanı $time sonra harcanabilir.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Şimdi harcanabilir $amount. Geri kalanı hâlâ geliyor.';
  }

  @override
  String get txTagWaiting => 'kabul edilmesi bekleniyor';

  @override
  String get txTagStatusUnknown => 'durum bilinmiyor';

  @override
  String get txTagNotAccepted => 'kabul edilmedi';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'onaylanıyor $n / $total';
  }

  @override
  String get submittedTo => 'Gönderildiği yer';

  @override
  String get testConnection => 'Bağlantıyı test et';

  @override
  String get accountsOtherWalletHeader =>
      'Başka bir cüzdandan kaydedildi (yalnızca görüntüleme)';

  @override
  String get accountsOtherWalletNote =>
      'Bu cüzdan bunları harcayamaz, bu yüzden toplamına dahil edilmezler. Kullanmak için ait oldukları cüzdanı açın.';

  @override
  String get noActivityTitle => 'Henüz etkinlik yok';

  @override
  String get txTypeSent => 'Gönderildi';

  @override
  String get txTypeReceived => 'Alındı';

  @override
  String get txTypeThisWallet => 'Cüzdan içinde';

  @override
  String get txTypeMerged => 'Birleştirilen paralar';

  @override
  String get noActivityMessage =>
      'HTN gönderdiğinizde veya aldığınızda burada görünür.';

  @override
  String get seeAll => 'Tümünü gör';

  @override
  String get show => 'Göster';

  @override
  String get myAccounts => 'Hesaplarım';

  @override
  String homeGreeting(String walletName) {
    return 'Merhaba, $walletName';
  }

  @override
  String get balance => 'Bakiye';

  @override
  String get maxSend => 'Maks. Gönderim Miktarı';

  @override
  String get compoundUppercased => 'BİRLEŞTİR';

  @override
  String get closeUppercased => 'KAPAT';

  @override
  String get scanMoreAddresses => 'Daha Fazla Adresi Tara';

  @override
  String get addressDiscovery => 'Adres Keşfi';

  @override
  String get scanningTitle => 'Taranıyor';

  @override
  String get scanningDescription => 'Yeni adresler taranıyor...';

  @override
  String get scanMore => 'DAHA FAZLASINI TARA';

  @override
  String get scanFailedMessage =>
      'Tarama başarısız, lütfen daha sonra tekrar deneyin';

  @override
  String get indexHeader => 'Dizin';

  @override
  String get currentIndex => 'Mevcut';

  @override
  String get scannedIndex => 'Tarandı';

  @override
  String get newIndex => 'Yeni';

  @override
  String get addressFilterDialogTitle => 'Adres Filtresi';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Tüm Adresleri Göster';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Bakiyesi Olan Adresleri Göster';

  @override
  String get importOption24WordsTitle => '24 Kelimelik Gizli Cümleyi Aktar';

  @override
  String get importOption24WordsDescription =>
      'Cli Cüzdan ve Ledger ile uyumlu';

  @override
  String get importOption12WordsTitle => '12 Kelimelik Gizli Cümleyi Aktar';

  @override
  String get importOption12WordsDescription => 'Web Cüzdan ve KDX ile uyumlu';

  @override
  String get importOptionStandardWalletTitle => 'Standart cüzdanı içe aktar';

  @override
  String get importOptionStandardWalletDescription =>
      'İsteğe bağlı BIP39 parolalı, standart türetmeli 12 veya 24 kelimelik cüzdanlar';

  @override
  String get importOptionLegacyWalletTitle => 'Eski cüzdanı içe aktar';

  @override
  String get importOptionLegacyWalletDescription =>
      'Eski Web Wallet ve KDX ile uyumlu, eski türetmeli 12 kelimelik cüzdanlar';

  @override
  String get importOptionKpubTitle => 'Sadece İzlemek için Cüzdan Aktar';

  @override
  String get importOptionKpubDescription =>
      'Bir genişletilmiş herkese açık anahtar (public key) kullanarak bir cüzdanın bakiyesini ve işlemlerini gözlemleyin';

  @override
  String get importKpub => 'Sadece İzlemek için Cüzdan Aktar';

  @override
  String get importKpubHint =>
      'Lütfen genişletilmiş herkese açık anahtarınızı (public key) girin.';

  @override
  String get importKpubClipboardError =>
      'Panodaki içerik geçerli bir genişletilmiş herkese açık anahtar (public key) değil';

  @override
  String get importKpubQrCodeError =>
      'QR kodu geçerli bir genişletilmiş herkese açık anahtar (public key) içermiyor';

  @override
  String get importKpubInvalidMessage =>
      'Lütfen genişletilmiş herkese açık anahtarınızın (public key) doğru girildiğinden emin olun!';

  @override
  String get receiveAddressListEmpty => 'Alma adres listesi boş';

  @override
  String get changeAddressListEmpty => 'Para üstü adres listesi boş';

  @override
  String get hintAddressListEmpty =>
      'Sağ üst köşedeki adres filtresini kontrol edin';

  @override
  String get invalidSecretPhrase => 'Yanlış Gizli Cümle';

  @override
  String get invalidSecretPhraseDetails =>
      'Girdiğin Gizli Cümlenin sağlama toplamı geçersiz.';

  @override
  String get invalidSecretPhraseConfirmation => 'Ne yaptığımı biliyorum';

  @override
  String get contactSupport => 'Destek ile iletişime geç';

  @override
  String emailAction(String email) {
    return 'E-posta $email';
  }

  @override
  String get noteLabel => 'Not:';

  @override
  String get optionalLabel => '(İsteğe Bağlı)';

  @override
  String get buyHoosatSubtitle => 'Topper by Uphold aracılığıyla';

  @override
  String get buyHoosatTitle => 'Hoosat Satın Al';

  @override
  String get buyHoosatMessage => 'Hızlıca ve kolayca \$HTN satın alın.';

  @override
  String get buyHoosatMessageSecondary =>
      'Hizmet, Uphold\'un itibari parayı kripto paraya dönüştürme ürünü olan Topper tarafından sağlanıyor.';

  @override
  String get getStarted => 'Hemen Başlayın';

  @override
  String get aboutTopperTitle => 'Topper Hakkında';

  @override
  String get aboutTopperDescription =>
      'Topper by Uphold, kullanıcıların kredi/banka kartı kullanarak veya bir banka hesabıyla kripto para satın almalarına olanak tanıyan, kullanımı kolay bir itibari parayı kripto paraya dönüştürme ürünüdür.';

  @override
  String get moreInfo => 'Daha Fazla Bilgi';

  @override
  String get selectAddress => 'Adres Seç';

  @override
  String get kpubTitle => 'Genişletilmiş Herkese Açık Anahtar';

  @override
  String get kpubAuth => 'Genişletilmiş Herkese Açık Anahtarı Görüntüle';

  @override
  String get kpubDescription =>
      'Genişletilmiş herkese açık anahtar (public key), cüzdanınızı \'yalnızca izleme\' cüzdanı olarak içe aktarmak için kullanılabilir.';

  @override
  String get copyKpub => 'Kpub\'ı Kopyala';

  @override
  String get kpubCopied => 'Genişletilmiş Herkese Açık Anahtar Kopyalandı';

  @override
  String get kpubCopyFailed =>
      'Genişletilmiş Herkese Açık Anahtar kopyalanamadı';

  @override
  String walletAddressesCopied(String addressType) {
    return 'Cüzdan $addressType Adresleri Panoya Kopyalandı';
  }

  @override
  String walletAddressesCopyFailed(String addressType) {
    return 'Cüzdan $addressType Adresleri Kopyalanamadı';
  }

  @override
  String get txReport => 'İşlem Raporu';

  @override
  String get txReportSubtitle =>
      'İşlem geçmişini CSV dosyası olarak dışarı aktar';

  @override
  String get txReportDetails =>
      'Cüzdanın tüm işlem geçmişini içeren CSV formatında bir işlem raporu oluşturun.';

  @override
  String get txReportOptionIgnoreCompound => 'Birleştirme işlemlerini yok say';

  @override
  String get txReportOptionIgnoreSelfTxs =>
      'Kendine gönderdiğin işlemleri yok say';

  @override
  String get txReportOptionRefreshTxs => 'İşlemleri yenile';

  @override
  String get txReportGenerate => 'Oluştur';

  @override
  String get txReportStatusRefreshing => 'İşlemler yenileniyor';

  @override
  String get txReportStatusLoading => 'İşlemler yükleniyor';

  @override
  String get txReportStatusReady => 'İşlem raporu hazır!';

  @override
  String get txReportGetReport => 'Raporu Al';

  @override
  String get txReportDate => 'Tarih';

  @override
  String get txReportSentAmount => 'Gönderilen Miktar';

  @override
  String get txReportSentCurrency => 'Gönderilen Para Birimi';

  @override
  String get txReportReceivedAmount => 'Alınan Miktar';

  @override
  String get txReportReceivedCurrency => 'Alınan Para Birimi';

  @override
  String get txReportFeeAmount => 'Ücret Miktarı';

  @override
  String get txReportFeeCurrency => 'Ücret Para Birimi';

  @override
  String get txReportLabel => 'Etiket';

  @override
  String get txReportDescription => 'Açıklama';

  @override
  String get txReportTxHash => 'TxHash';

  @override
  String get txReportNote => 'Not';

  @override
  String get txReportLabelCost => 'maliyet';

  @override
  String get txReportFeeForCompound => 'Birleştirme İşlemi Ücreti';

  @override
  String get txReportFeeForSelfSend => 'Kendi adreslerine gönderme ücreti';

  @override
  String get txReportError => 'Rapor oluşturulurken bir hata meydana geldi';

  @override
  String txReportNoTxs(int numberOf) {
    return '$numberOf işlem bulundu.';
  }

  @override
  String txReportNoLoadedTxs(int loadedTxs, int totalTxs) {
    return '($loadedTxs / $totalTxs)';
  }

  @override
  String get txFilterDialogTitle => 'İşlem Filtresi';

  @override
  String get txFilterDialogOptionAllTxs => 'Tüm İşlemleri Göster';

  @override
  String get txFilterDialogOptionHideNotAcceptedCoinbase =>
      'Kabul Edilmeyen Coinbase İşlemlerini Gizle';

  @override
  String get changeAddressModeTitle => 'Para üstü adresi davranışı';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Her adres kendi bakiyesini tutar, para üstü aynı yerde kalır';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Her seferinde yeni bir adres kullanılır (gizli, bakiye dağılır)';

  @override
  String get changeAddressModeDialogTitle => 'Para üstü adresi davranışı';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Bakiyeleri her adreste tut';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Gizli';

  @override
  String get requestPasswordHeader => 'Parola iste';

  @override
  String get requestPasswordAtLaunch => 'Açılışta';

  @override
  String get requestPasswordWhenLocked => 'Kilitliyken';

  @override
  String get requestPasswordWhenSigning => 'İmzalarken';

  @override
  String get importWalletAdvancedOptions => 'Gelişmiş seçenekler';

  @override
  String get bip39Passphrase => 'BIP39 parolası';

  @override
  String get bip39PassphraseWarning =>
      'NOT: Bu bir cüzdan parolası değildir; farklı BIP39 parolaları farklı cüzdanları açar.';

  @override
  String get bip39PassphraseEnter => 'Parolayı girin';

  @override
  String get bip39PassphraseConfirm => 'Parolayı onaylayın';

  @override
  String get bip39PassphraseMismatch => 'Parolalar eşleşmiyor!';

  @override
  String get bip39PassphraseNote => 'BIP39 parolalı cüzdan.';

  @override
  String get feePriorityHint => 'Öncelik ücretini girin';

  @override
  String get feeBaseUppercase => 'TEMEL ÜCRET';

  @override
  String get feePriorityUppsercase => 'ÖNCELİK ÜCRETİ';

  @override
  String get feeUpdateAddressError => 'Hedef adres tanınamadı';

  @override
  String get feeUpdateRebuildError => 'İşlem yeniden oluşturulamadı';

  @override
  String get feeUpdateRebuildError2 =>
      'İşlem yeni ücretle yeniden oluşturulamadı';

  @override
  String get feeUpdateError => 'Ücret güncellenemedi';

  @override
  String get feeUpdate => 'Ücreti güncelle';

  @override
  String get feeUpdateTitle => 'Ücret güncelleniyor';

  @override
  String get feeSheetRecommendedPriority => 'Önerilen öncelik ücretleri';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Yeni öncelik ücreti en az $amount $symbol olmalıdır';
  }

  @override
  String get txPending => 'BEKLEMEDE';

  @override
  String get txPendingMessage => 'Bu işlem beklemede';

  @override
  String get txPendingTitle => 'Bekleyen işlem';

  @override
  String get txPendingContent => 'Mempool\'da bekleyen işlemler var.';

  @override
  String get txPendingActionUpdateFee => 'İşlem ücretini güncelle';

  @override
  String get txPendingActionRbf => 'Ücretle değiştir (RBF)';

  @override
  String get txInMempool => 'mempool\'da';

  @override
  String get utxoSelectionTitle => 'UTXO seç';

  @override
  String get utxoSelectionHint => 'Lütfen daha fazla UTXO seçin';
}
