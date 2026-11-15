// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get account => 'Akaun';

  @override
  String get accounts => 'Akaun';

  @override
  String get ackBackedUp =>
      'Adakah anda pasti bahawa anda telah menyandarkan frasa rahsia anda?';

  @override
  String get add => 'Tambah';

  @override
  String get addAccount => 'Tambah akaun';

  @override
  String get addContact => 'Tambah Kenalan';

  @override
  String get addNode => 'Tambah Node';

  @override
  String get addNodeFailed => 'Gagal menambah node Hoosat';

  @override
  String addNodeFailedMessage(String error) {
    return 'Gagal: $error';
  }

  @override
  String get addNodeSuccess => 'Node Berjaya Ditambah';

  @override
  String get addingNodeMessage => 'Sila tunggu semasa menghubungi node';

  @override
  String get addingNodeTitle => 'Menambah Node';

  @override
  String get address => 'Alamat';

  @override
  String get addressCopied => 'Alamat disalinkan';

  @override
  String get addressCopiedFailed => 'Gagal menyalin alamat';

  @override
  String get addressHint => 'Masukkan Alamat';

  @override
  String get addressMising => 'Sila masukkan destinasi';

  @override
  String get addressShare => 'Kongsikan Alamat';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Maju';

  @override
  String get amount => 'Jumlah';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Jumlah $amount $coin';
  }

  @override
  String get amountMissing => 'Sila masukkan jumlah';

  @override
  String get amountZero => 'Jumlah tidak boleh sifar';

  @override
  String get areYouSure => 'Adakah anda pasti?';

  @override
  String get authBiometricMessage => 'Sahkan untuk Tambah Dompet';

  @override
  String get authMethod => 'Kaedah Pengesahan';

  @override
  String get authPinMessage => 'Masukkan PIN untuk Tambah Dompet';

  @override
  String get autoLockHeader => 'Kunci secara automatik';

  @override
  String get available => 'Tersedia';

  @override
  String get back => 'Kembali';

  @override
  String get backupConfirmButton => 'Saya telah menyokongnya';

  @override
  String get backupSecretPhrase => 'Cadangkan Frasa Rahsia ';

  @override
  String get missingSecretPhrase => 'Frasa Rahsia tiada';

  @override
  String get biometricsMethod => 'Biometrik';

  @override
  String get blockExplorer => 'Blok Penjelajah';

  @override
  String get cancel => 'Batal';

  @override
  String get change => 'Ubah';

  @override
  String get changeAddress => 'Tukar alamat';

  @override
  String get changeAddressCopied => 'Tukar alamat disalin';

  @override
  String get changeIndex => 'Tukar Indeks';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Tukar $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Sila semak kebenaran kamera';

  @override
  String get clipboardEmpty => 'Papan klip kosong';

  @override
  String get close => 'Tutup';

  @override
  String get confirm => 'sahkan';

  @override
  String get confirmPasswordHint => 'Sahkan kata laluan';

  @override
  String confirmations(String confirmations) {
    return 'pengesahan $confirmations.';
  }

  @override
  String get confirmed => 'disahkan';

  @override
  String get confirmedMaturing => 'disahkan · sedang matang';

  @override
  String get confirming => 'mengesahkan';

  @override
  String contactAdded(String contactName) {
    return '$contactName telah ditambah sebagai kenalan!';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address alamat disalin';
  }

  @override
  String get contactExists => 'Kenalan telah wujud';

  @override
  String get contactHeader => 'Kenalan';

  @override
  String get contactInvalid => 'Nama Kenalan tidak sah';

  @override
  String get contactNameHint => 'Masukkan Nama @';

  @override
  String get contactNameMissing => 'Tidak ada kontak yang boleh diekspor';

  @override
  String contactRemoved(String contactName) {
    return '$contactName kenalan telah dihapuskan!';
  }

  @override
  String get contactsHeader => 'Kenalan';

  @override
  String get contactsImportErr => 'Gagal mengimpor kontak';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Berhasil mengimpor $noContacts kenalan';
  }

  @override
  String get copied => 'Disalin';

  @override
  String get copy => 'Menyalin';

  @override
  String get copyAddress => 'Salinkan alamat';

  @override
  String get copyErrorButton => 'Ralat Salin';

  @override
  String get createAPasswordHeader => 'Buat kata laluan.';

  @override
  String get createPasswordFirstParagraph =>
      'Anda boleh membuat kata laluan untuk menambah keselamatan tambahan pada dompet anda.';

  @override
  String get createPasswordHint => 'Buat kata laluan';

  @override
  String get createPasswordSecondParagraph =>
      'Kata laluan adalah pilihan, dan dompet anda akan dilindungi dengan PIN atau biometrik anda tanpa mengira.';

  @override
  String get createPasswordSheetHeader => 'Buat';

  @override
  String get currency => 'Mata wang';

  @override
  String get currencyPoweredBy => 'Dikuasakan oleh CoinGecko';

  @override
  String get defaultAccountName => 'Akaun Utama 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Terima $addressIndex';
  }

  @override
  String get defaultWalletName => 'Dompet saya';

  @override
  String get disablePasswordSheetHeader => 'Lumpuhkan';

  @override
  String get disablePasswordSuccess => 'Kata laluan telah dilumpuhkan';

  @override
  String get disableWalletPassword => 'Lumpuhkan Kata Laluan Dompet';

  @override
  String get doContinue => 'Teruskan';

  @override
  String get donate => 'Menderma';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Jangan tunjukkan lagi';

  @override
  String get emptyCardIntroUtxos =>
      'Ini ialah tab UTXOs. Semua UTXO dalam dompet anda akan dipaparkan di sini';

  @override
  String get emptyResult => 'Hasil Kosong';

  @override
  String get emptyWalletName => 'Nama Dompet tidak boleh kosong';

  @override
  String get encryptionFailedError => 'Gagal menetapkan kata laluan dompet';

  @override
  String get enterAddress => 'Masukan Alamat';

  @override
  String get enterAmount => 'Masukan Amaun';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Masukkan Nota';

  @override
  String get enterPasswordHint => 'Masukkan kata laluan anda';

  @override
  String get errorMessageCopied => 'Mesej ralat disalin ke papan keratan';

  @override
  String get exampleCardIntro =>
      'Ini ialah tab urus niaga. Sebaik sahaja anda menghantar atau menerima transaksi, transaksi itu akan dipaparkan di sini.';

  @override
  String get export => 'Eksport';

  @override
  String get fee => 'Bayaran';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Bayaran $amount $coin';
  }

  @override
  String get feeTitle => 'BAYARAN';

  @override
  String get fetchingTransactions => 'Mengambil Transaksi';

  @override
  String get fingerprintSeedBackup =>
      'Konfirm cap jari untuk menyandarkan benih dompet.';

  @override
  String get goBackButton => 'Pergi balik';

  @override
  String get gotItButton => 'Faham!';

  @override
  String get import => 'Import';

  @override
  String get importSecretPhrase => 'Import Frasa Rahsia';

  @override
  String get importSecretPhraseHint =>
      'Sila masukkan frasa rahsia 24 perkataan anda di bawah. ';

  @override
  String get importSecretPhraseHintCombo =>
      'Sila masukkan frasa rahsia 12 atau 24 perkataan anda di bawah.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Sila masukkan frasa rahsia 12 perkataan anda di bawah.';

  @override
  String get importWallet => 'Import Dompet';

  @override
  String get importWalletDescription => 'Sila pilih pilihan di bawah.';

  @override
  String get instantly => 'Seketika';

  @override
  String get insufficientBalance => 'Baki tak mencukupi';

  @override
  String get insufficientBalanceDetails =>
      'Anda tidak mempunyai HTN yang mencukupi untuk transaksi ini';

  @override
  String get invalidAddress => 'Alamat destinasi tidak sah';

  @override
  String get invalidAmount => 'Jumlah Tidak Sah';

  @override
  String get invalidChecksumMessage =>
      'Sila pastikan Frasa Rahsia anda\ntelah dimasukkan dengan betul!';

  @override
  String get invalidKpubMessage =>
      'Sila pastikan bahawa kunci awam lanjutan anda dimasukkan dengan betul!';

  @override
  String get invalidDestinationAddress => 'Alamat Destinasi Tidak Sah';

  @override
  String get invalidPassword => 'kata laluan tidak sah';

  @override
  String get hoosatDevFund => 'Dana Hoosat Dev';

  @override
  String get hoosatMobile => 'Dompet Hoosat Mobile';

  @override
  String get language => 'Bahasa';

  @override
  String get loadingTransactions => 'Memuatkan Transaksi...';

  @override
  String get lockAppSetting => 'Mengesahkan masa Pelancaran';

  @override
  String get locked => 'Terkunci';

  @override
  String get loggingOutMessage => 'Log keluar...';

  @override
  String get logout => 'Log Keluar';

  @override
  String get logoutDialogContent =>
      'Adakah anda pasti mahu log keluar daripada dompet ini?';

  @override
  String get logoutOrSwitchWallet => 'Log Keluar / Tukar Wallet';

  @override
  String get manage => 'Mengurus';

  @override
  String get manualEntry => 'Manual Kemasukan';

  @override
  String get networkHeader => 'Rangkaian';

  @override
  String get newAddress => 'Alamat Baru';

  @override
  String get newWallet => 'Dompet Baru';

  @override
  String get nextButton => 'Seterusnya';

  @override
  String get no => 'Tidak';

  @override
  String get noContactsExport => 'Tidak ada kontak yg boleh diekspor';

  @override
  String get noContactsImport => 'Tidak ada untuk impor';

  @override
  String get noQrCodeFound => 'Tiada kod QR ditemui';

  @override
  String get noSkipButton => 'Tidak, Langkau';

  @override
  String get noUppercase => 'TIDAK';

  @override
  String get nodeAddress => 'Node Hoosat';

  @override
  String get nodeDeleteMessage => 'Adakah anda pasti ingin memadam?';

  @override
  String get nodeDeleteTitle => 'Padamkan Konfigurasi Node Hoosat?';

  @override
  String get nodeNameEmpty => 'Nama node tidak boleh kosong';

  @override
  String get nodeNameHint => 'Masukkan Nama Node';

  @override
  String get nodeUrlHint => 'Masukkan URL Node';

  @override
  String get nodeUrlInvalid => 'URL node tidak sah';

  @override
  String get nodesSheetTitle => 'Node Hoosat';

  @override
  String get off => 'Mati';

  @override
  String get on => 'hidup';

  @override
  String get paperWallet => 'Dompet Kertas';

  @override
  String get passwordBlank => 'Kata laluan tidak boleh kosong';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Anda tidak memerlukan kata laluan untuk membuka dompet ini.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Kata laluan ini diperlukan untuk membuka dompet ini.';

  @override
  String get passwordsDontMatch => 'Kata laluan tidak sepadan';

  @override
  String get pasteMnemonicError =>
      'Kandungan papan klip bukanlah frasa rahsia yang sah';

  @override
  String get pending => 'belum selesai';

  @override
  String get pinConfirmError => 'Pin tiada sempadan';

  @override
  String get pinConfirmTitle => 'Mengesahkan PIN anda';

  @override
  String get pinCreateTitle => 'Mencipta PIN 6 digit anda';

  @override
  String get pinEnterTitle => 'Masukkan PIN';

  @override
  String get pinInvalid => 'Pin yang tak sah dimasukkan';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'Masukkan PIN untuk Menyandarkan Frasa Rahsia';

  @override
  String get preferences => 'Keutamaan';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get qrInvalidAddress => 'Kod QR tidak mengandungi destinasi yang sah';

  @override
  String get qrInvalidSeed =>
      'Kod QR tidak mengandungi kunci benih atau peribadi yang sah';

  @override
  String get qrMnemonicError =>
      'Kod QR tidak mengandungi frasa rahsia yang sah';

  @override
  String get receive => 'Terima';

  @override
  String get receiveAddress => 'Terima Alamat';

  @override
  String get receiveAddressCopied => 'Terima alamat yang disalin';

  @override
  String get receiveIndex => 'Terima Indeks';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Terima $addressIndex';
  }

  @override
  String get received => 'Diterima';

  @override
  String get removeContact => 'Padam Kenalan';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Anda akan menghapuskan $contactName?';
  }

  @override
  String get removeWalletAction => 'Alih keluar Wallet';

  @override
  String get removeWalletBiometricsMessage => 'Sahkan untuk Alih Keluar Wallet';

  @override
  String get removeWalletDetail =>
      'Mengalih keluar dompet ini akan mengalih keluar Frasa Rahsia dan semua data berkaitan dompet daripada peranti ini. ';

  @override
  String get removeWalletPinMessage => 'Masukkan PIN untuk Alih Keluar Wallet';

  @override
  String get removeWalletReassurance =>
      'Selagi anda telah menyandarkan Frasa Rahsia, anda tidak perlu risau.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Memerlukan kata laluan untuk membuka Hoosat Mobile?';

  @override
  String get restartSetupButton => 'Mulakan semula Persediaan';

  @override
  String get scanQrCode => 'Imbaskan Kod QR';

  @override
  String get scanQrCodeError => 'Gagal menghuraikan kod qr';

  @override
  String get scanFromImage => 'Imbas daripada imej';

  @override
  String get toggleFlash => 'Hidup/matikan lampu suluh';

  @override
  String get riskDisclosureHeader => 'Sebelum anda bermula';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet ialah dompet bukan jagaan (non-custodial). Frasa Rahsia dan kunci peribadi anda dijana dan disimpan pada peranti ini sahaja — kami tidak pernah melihatnya, tidak menyimpannya pada mana-mana pelayan dan tidak boleh memulihkannya untuk anda.';

  @override
  String get riskDisclosureWarning =>
      'Jika anda kehilangan Frasa Rahsia anda, tiada tetapan semula kata laluan dan tiada pasukan sokongan yang boleh mendapatkan semula dana anda. Anda sahaja yang bertanggungjawab menyimpannya dengan selamat.';

  @override
  String get riskDisclosureAccept => 'Saya faham, teruskan';

  @override
  String get secretInfo =>
      'Dalam skrin seterusnya, anda akan melihat frasa rahsia anda. ';

  @override
  String get secretInfoHeader => 'Utamakan keselamatan!';

  @override
  String get secretPhrase => 'Frasa Rahsia';

  @override
  String get verifyBackupTitle => 'Sahkan sandaran anda';

  @override
  String get verifyBackupInstruction =>
      'Pilih perkataan yang betul bagi setiap kedudukan untuk mengesahkan bahawa anda telah menyimpan Frasa Rahsia anda.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Apakah perkataan #$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Kurang tepat. Semak sandaran anda dan cuba lagi.';

  @override
  String get secretPhrase12Words => '12 perkataan';

  @override
  String get secretPhrase24Words => '24 perkataan';

  @override
  String get secretWarning =>
      'Jika anda kehilangan peranti anda atau memasang aplikasinya, anda perlu frasa atau benih rahsia anda untuk mendapatkan semula dana anda!';

  @override
  String get securityHeader => 'Keselamatan';

  @override
  String get securitySettingsBiometrics =>
      'Sahkan untuk mengakses tetapan keselamatan';

  @override
  String get securitySettingsPin =>
      'Masukkan PIN untuk mengakses tetapan keselamatan';

  @override
  String get seed => 'Benih';

  @override
  String get signMessage => 'Tandatangani mesej';

  @override
  String get signMessageCopySignature => 'Salin tandatangan';

  @override
  String get signMessageDescription =>
      'Tandatangani mesej dengan salah satu alamat dompet anda';

  @override
  String get signMessageHint => 'Masukkan mesej untuk ditandatangani';

  @override
  String get signMessageSignatureCopied => 'Tandatangan disalin';

  @override
  String get signMessageSigned => 'Mesej ditandatangani';

  @override
  String get signMessageTooLong => 'Mesej terlalu panjang';

  @override
  String get seedInvalid => 'Benih tidak sah';

  @override
  String get nodeUnreachable =>
      'Tidak dapat menghubungi nod anda. Baki mungkin sudah lapuk.';

  @override
  String get nodeUnreachableRetry => 'Cuba lagi';

  @override
  String get send => 'Hantar';

  @override
  String get sendConfirm => 'Hantar';

  @override
  String get sendError => 'Berlaku ralat. ';

  @override
  String get sendNote => 'CATATAN';

  @override
  String get sendToAddressTitle => 'Kepada';

  @override
  String get sendTxProgressDescription =>
      'Sila tunggu sementara transaksi dihantar';

  @override
  String get sendTxProgressTitle => 'Menghantar Transaksi';

  @override
  String get sending => 'Sedang dihantarkan';

  @override
  String get sent => 'Dihantar';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Tetapkan kata laluan';

  @override
  String get setPasswordSuccess =>
      'Kata laluan telah ditetapkan dengan kejayaannya';

  @override
  String get setWalletPassword => 'Tetapkan Kata Laluan Wallet';

  @override
  String get settingsHeader => 'Tetapan';

  @override
  String get settingsTransfer => 'Muatkan dari Dompet Kertas';

  @override
  String get setupFailedMessage => 'Sesuatu telah berlaku';

  @override
  String get shareHoosatMobile => 'Bahagian Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Lihat Hoosat Mobile Wallet';

  @override
  String get shareHoosatMobileText =>
      'Lihat Hoosat Mobile - Dompet Mobile Hoosat.\nLaman web - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Sesuatu telah berlaku';

  @override
  String get systemDefault => 'Lalai Sistem';

  @override
  String get tapToHide => 'Ketuk untuk menyaring';

  @override
  String get tapToReveal => 'Ketuk untuk mendedahkan';

  @override
  String get themeDark => 'Tema Gelap';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Tema Cahaya';

  @override
  String get toggleTheme => 'Tukar tema';

  @override
  String get thisWallet => '#Dompet Ini';

  @override
  String get to => 'Ke';

  @override
  String get toAddress => 'Untuk Alamat';

  @override
  String get tooManyFailedAttempts =>
      'Terlalu banyak percubaan membuka kunci gagal.';

  @override
  String get totalValue => 'Jumlah nilai';

  @override
  String get transactionId => 'ID Transaksi';

  @override
  String get transactionsUppercase => 'TRANSAKSI';

  @override
  String get transfer => 'Pemindahan';

  @override
  String get transferClose => 'Ketuk mana-mana sahaja untuk menutup rapat.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN berjaya dipindahkan ke Dompet Hoosat Mobile anda.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Dompet dengan baki $amount HTN telah dikesan.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Ketik Sahkan untuk memindahkan dana. \n';

  @override
  String get transferConfirmInfoThird =>
      'Pemindahan mungkin mengambil masa beberapa saat untuk disiapkan.';

  @override
  String get transferError => 'Ralat berlaku semasa pemindahan. ';

  @override
  String get transferHeader => 'Pemindahan Dana';

  @override
  String transferIntro(String button) {
    return 'Proses ini akan memindahkan dana daripada dompet kertas ke dompet Hoosat Mobile anda.\n\nKetik butang \"$button\" untuk bermula.';
  }

  @override
  String get transferLoading => 'Memindahkan';

  @override
  String get transferManualHint => 'Sila masukkan benih di bawah.';

  @override
  String get transferNoFunds =>
      'Benih ini tidak mempunyai sebarang HTN di atasnya';

  @override
  String get transferQrScanError =>
      'Kod QR ini tidak mengandungi benih yang sah.';

  @override
  String get transferQrScanHint =>
      'Imbas Hoosat\nbenih atau kunci persendirian';

  @override
  String get unconfirmed => 'tidak disahkan';

  @override
  String get notAccepted => 'tidak diterima';

  @override
  String get accepted => 'diterima';

  @override
  String get unknown => 'tidak diketahui';

  @override
  String get unlock => 'Buka kunci';

  @override
  String get unlockBiometrics => 'Sahkan untuk Membuka Kunci Dompet';

  @override
  String get unlockPin => 'Masukkan PIN untuk Membuka Hoosat Mobile';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Lihat Alamat';

  @override
  String get viewTransaction => 'Lihat Transaksi';

  @override
  String get walletAddresses => 'Alamat Dompet';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Nama dompet';

  @override
  String get walletNameDescription => 'Masukkan nama untuk dompet anda';

  @override
  String get walletNameHint => 'Nama Dompet';

  @override
  String get walletSetupAddressDiscovery => 'Menjalankan Penemuan Alamat';

  @override
  String get walletSetupMessage => 'Menyediakan dompet';

  @override
  String get walletsTitle => 'Dompet';

  @override
  String get warning => 'AMARAN';

  @override
  String welcomeMessage(String version) {
    return 'Selamat datang!\n\nIni ialah versi $version Hoosat Mobile - dompet mobile untuk Hoosat';
  }

  @override
  String get welcomeText =>
      'Selamat datang di Hoosat Mobile. Untuk bermula, anda boleh membuat dompet baharu atau mengimport dompet sedia ada.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minit',
      one: '1 minute',
    );
    return 'Selepas $_temp0';
  }

  @override
  String get yes => 'Ya';

  @override
  String get yesButton => 'ya';

  @override
  String get yesUppercase => 'YA';

  @override
  String get nodeNotSyncedException => 'Node tidak disegerakkan';

  @override
  String get nodeNoUTXOIndexException => 'Node tidak mempunyai indeks UTXO';

  @override
  String get nodeSecureConnection => 'Sambungan selamat';

  @override
  String get hoosatUriInvalid => 'URI Hoosat tidak sah';

  @override
  String get compoundUtxos => 'Gabungkan Transaksi ';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Anda mempunyai banyak output kecil yang belum digunakan (UTXO). Penggabungan akan menggabungkannya kepada bilangan UTXO yang lebih sedikit dan lebih besar supaya penghantaran akan datang lebih pantas dan mungkin dengan yuran lebih rendah. Ini mewujudkan satu atau lebih transaksi dan akan dikenakan yuran rangkaian.';

  @override
  String get compoundUtxosDescription =>
      'Gabungkan berbilang UTXO menjadi satu';

  @override
  String get compoundUtxosConfirmation => 'Kompaun Transaksi?';

  @override
  String get compoundingUtxos => 'Urus niaga pengkompaunan transaksi';

  @override
  String get compoundingMessage => 'Sila tunggu...';

  @override
  String get compoundSuccess => 'Kompaun berjaya';

  @override
  String get compoundFailure => 'Gagal untuk mengkompaun transaksi';

  @override
  String get fundsStillConfirmingTitle => 'Dana masih disahkan';

  @override
  String get fundsStillConfirmingBody =>
      'Sebahagian dana dalam akaun ini baru diterima dan belum boleh dihantar — rangkaian memerlukan tempoh pematangan yang singkat dahulu, biasanya beberapa minit. Anda boleh menunggu dan cuba lagi, atau menghantar daripada akaun lain yang mempunyai dana matang.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Tukar akaun';

  @override
  String get compoundTooFewUtxos => 'Sekurang-kurangnya dua UTXO diperlukan';

  @override
  String get moveToMain => 'Kumpulkan ke Utama';

  @override
  String get moveToMainDescription =>
      'Pindahkan baki semua alamat lain ke alamat utama anda';

  @override
  String get moveToMainConfirmation => 'Pindahkan semuanya ke Utama?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Ini akan memindahkan $amount $symbol daripada $count alamat lain ke alamat utama anda. Satu atau lebih transaksi akan dicipta dan bayaran rangkaian akan dikenakan.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Baki semua alamat sudah berada di Utama';

  @override
  String get movingToMain => 'Mengumpulkan ke Utama';

  @override
  String get moveToMainSuccess => 'Pemindahan ke Utama berjaya';

  @override
  String get moveToMainFailure => 'Gagal memindahkan ke Utama';

  @override
  String get moveToMainUppercased => 'PINDAH';

  @override
  String get manageAccounts => 'Akaun';

  @override
  String get manageAccountsDescription => 'Tambah dan urus alamat bernama';

  @override
  String get mainAccountLabel => 'Utama';

  @override
  String get archiveAction => 'Arkibkan';

  @override
  String get restoreAction => 'Pulihkan';

  @override
  String get archivedAccountsHeader => 'Diarkibkan';

  @override
  String get noAdditionalAccountsYet => 'Belum ada akaun tambahan';

  @override
  String get renameAccount => 'Namakan semula akaun';

  @override
  String get accountLabelHint => 'Nama akaun';

  @override
  String get saveUppercased => 'SIMPAN';

  @override
  String get addUppercased => 'TAMBAH';

  @override
  String get sendFromLabel => 'Daripada';

  @override
  String get sendFromAny => 'Mana-mana';

  @override
  String get home => 'Laman Utama';

  @override
  String get activity => 'Aktiviti';

  @override
  String get totalBalance => 'Jumlah baki';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Boleh dibelanjakan sekarang $spendable · Masih dalam perjalanan $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Syiling yang masih dalam perjalanan adalah milik anda dan akan dapat dibelanjakan tidak lama lagi.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Syiling yang masih dalam perjalanan boleh dibelanjakan dalam $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Boleh dibelanjakan sekarang $amount. Bakinya boleh dibelanjakan dalam $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Boleh dibelanjakan sekarang $amount. Bakinya masih dalam perjalanan.';
  }

  @override
  String get txTagWaiting => 'menunggu diterima';

  @override
  String get txTagStatusUnknown => 'status tidak diketahui';

  @override
  String get txTagNotAccepted => 'tidak diterima';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'mengesahkan $n / $total';
  }

  @override
  String get submittedTo => 'Dihantar kepada';

  @override
  String get testConnection => 'Uji sambungan';

  @override
  String get accountsOtherWalletHeader =>
      'Disimpan daripada dompet lain (lihat sahaja)';

  @override
  String get accountsOtherWalletNote =>
      'Dompet ini tidak dapat membelanjakannya, jadi ia tidak dikira dalam jumlahnya. Buka dompet tempat ia berada untuk menggunakannya.';

  @override
  String get noActivityTitle => 'Belum ada aktiviti';

  @override
  String get txTypeSent => 'Dihantar';

  @override
  String get txTypeReceived => 'Diterima';

  @override
  String get txTypeThisWallet => 'Dalam dompet';

  @override
  String get txTypeMerged => 'Syiling digabungkan';

  @override
  String get noActivityMessage =>
      'Apabila anda menghantar atau menerima HTN, ia akan dipaparkan di sini.';

  @override
  String get seeAll => 'Lihat semua';

  @override
  String get show => 'Tunjuk';

  @override
  String get myAccounts => 'Akaun saya';

  @override
  String homeGreeting(String walletName) {
    return 'Hai, $walletName';
  }

  @override
  String get balance => 'Saldo';

  @override
  String get maxSend => 'Maks Hantar';

  @override
  String get compoundUppercased => 'KOMPAUN';

  @override
  String get closeUppercased => 'TUTUP';

  @override
  String get scanMoreAddresses => 'Pindai Untuk Lebih Banyak Alamat';

  @override
  String get addressDiscovery => 'Menemukan Alamat';

  @override
  String get scanningTitle => 'Memindai';

  @override
  String get scanningDescription => 'Memindai alamat baharu...';

  @override
  String get scanMore => 'PINDAI LEBIH BANYAK';

  @override
  String get scanFailedMessage => 'Pemindaian Gagal, sila cuba lagi kemudian';

  @override
  String get indexHeader => 'Indeks';

  @override
  String get currentIndex => 'semasa';

  @override
  String get scannedIndex => 'Dipindai';

  @override
  String get newIndex => 'Baharu';

  @override
  String get addressFilterDialogTitle => 'Penapis Alamat';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Lihat Semua Alamat';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Lihat Alamat Dengan Saldo';

  @override
  String get importOption24WordsTitle => 'Import 24 Perkataan Frasa Rahsia ';

  @override
  String get importOption24WordsDescription =>
      'Serasi dengan Dompet Cli dan Ledger';

  @override
  String get importOption12WordsTitle => 'Import 12 Perkataan Frasa Rahsia';

  @override
  String get importOption12WordsDescription =>
      'Serasi dengan Dompet Web dan KDX';

  @override
  String get importOptionStandardWalletTitle => 'Import dompet standard';

  @override
  String get importOptionStandardWalletDescription =>
      'Dompet 12 atau 24 perkataan dengan terbitan standard dan frasa laluan BIP39 pilihan';

  @override
  String get importOptionLegacyWalletTitle => 'Import dompet lama';

  @override
  String get importOptionLegacyWalletDescription =>
      'Dompet 12 perkataan dengan terbitan lama, serasi dengan Web Wallet lama dan KDX';

  @override
  String get importOptionKpubTitle => 'Import Dompet Hanya Lihat Sahaja';

  @override
  String get importOptionKpubDescription =>
      'Pantau Saldo dan transaksi dompet menggunakan kunci awam lanjutan';

  @override
  String get importKpub => 'Import Dompet Hanya Lihat Sahaja';

  @override
  String get importKpubHint => 'Sila masukkan kunci awam lanjutan anda.';

  @override
  String get importKpubClipboardError =>
      'Konten papan klip bukan kunci awam lanjutan yang sah';

  @override
  String get importKpubQrCodeError =>
      'Kod QR tidak mengandungi kunci awam lanjutan yang sah';

  @override
  String get importKpubInvalidMessage =>
      'Sila pastikan bahawa kunci awam lanjutan anda dimasukkan dengan betul!';

  @override
  String get receiveAddressListEmpty => 'Senarai alamat terima telah kosong';

  @override
  String get changeAddressListEmpty => 'Senarai alamat tukar telah kosong';

  @override
  String get hintAddressListEmpty =>
      'Semak penapis alamat dari penjuru kanan sebelah atas';

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
  String get changeAddressModeTitle => 'Tingkah laku alamat wang baki';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Setiap alamat menyimpan bakinya sendiri, dan wang baki kekal di tempatnya';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Alamat baharu digunakan setiap kali (peribadi, baki tersebar)';

  @override
  String get changeAddressModeDialogTitle => 'Tingkah laku alamat wang baki';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Kekalkan baki pada setiap alamat';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Peribadi';

  @override
  String get requestPasswordHeader => 'Minta kata laluan';

  @override
  String get requestPasswordAtLaunch => 'Semasa dibuka';

  @override
  String get requestPasswordWhenLocked => 'Apabila dikunci';

  @override
  String get requestPasswordWhenSigning => 'Semasa menandatangani';

  @override
  String get importWalletAdvancedOptions => 'Pilihan lanjutan';

  @override
  String get bip39Passphrase => 'Frasa laluan BIP39';

  @override
  String get bip39PassphraseWarning =>
      'NOTA: Ini bukan kata laluan dompet; frasa laluan BIP39 yang berbeza membuka dompet yang berbeza.';

  @override
  String get bip39PassphraseEnter => 'Masukkan frasa laluan';

  @override
  String get bip39PassphraseConfirm => 'Sahkan frasa laluan';

  @override
  String get bip39PassphraseMismatch => 'Frasa laluan tidak sepadan!';

  @override
  String get bip39PassphraseNote => 'Dompet dengan frasa laluan BIP39.';

  @override
  String get feePriorityHint => 'Masukkan bayaran keutamaan';

  @override
  String get feeBaseUppercase => 'BAYARAN ASAS';

  @override
  String get feePriorityUppsercase => 'BAYARAN KEUTAMAAN';

  @override
  String get feeUpdateAddressError => 'Gagal mengenali alamat destinasi';

  @override
  String get feeUpdateRebuildError => 'Gagal membina semula transaksi';

  @override
  String get feeUpdateRebuildError2 =>
      'Gagal membina semula transaksi dengan bayaran baharu';

  @override
  String get feeUpdateError => 'Gagal mengemas kini bayaran';

  @override
  String get feeUpdate => 'Kemas kini bayaran';

  @override
  String get feeUpdateTitle => 'Mengemas kini bayaran';

  @override
  String get feeSheetRecommendedPriority => 'Bayaran keutamaan disyorkan';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Bayaran keutamaan baharu mestilah sekurang-kurangnya $amount $symbol';
  }

  @override
  String get txPending => 'BELUM SELESAI';

  @override
  String get txPendingMessage => 'Transaksi ini belum selesai';

  @override
  String get txPendingTitle => 'Transaksi belum selesai';

  @override
  String get txPendingContent =>
      'Terdapat transaksi belum selesai dalam mempool.';

  @override
  String get txPendingActionUpdateFee => 'Kemas kini bayaran transaksi';

  @override
  String get txPendingActionRbf => 'Ganti dengan bayaran (RBF)';

  @override
  String get txInMempool => 'dalam mempool';

  @override
  String get utxoSelectionTitle => 'Pilih UTXO';

  @override
  String get utxoSelectionHint => 'Sila pilih lebih banyak UTXO';
}
