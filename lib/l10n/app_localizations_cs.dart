// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get account => 'Účet';

  @override
  String get accounts => 'Účty';

  @override
  String get ackBackedUp =>
      'Jste si jisti, že jste zálohovali svou tajnou frázi?';

  @override
  String get add => 'Přidat';

  @override
  String get addAccount => 'Přidat účet';

  @override
  String get addContact => 'Přidat kontakt';

  @override
  String get addNode => 'Přidat Uzel';

  @override
  String get addNodeFailed => 'Přidání Hoosat Uzlu selhalo';

  @override
  String addNodeFailedMessage(String error) {
    return 'Selhání: $error';
  }

  @override
  String get addNodeSuccess => 'Uzel Úspěšně Přidán';

  @override
  String get addingNodeMessage => 'Počkejte prosím, spojuji se s uzlem';

  @override
  String get addingNodeTitle => 'Přidávám Uzel';

  @override
  String get address => 'Adresa';

  @override
  String get addressCopied => 'Adresa zkopírována';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'Zadejte adresu';

  @override
  String get addressMising => 'Prosím zadejte adresu';

  @override
  String get addressShare => 'Sdílet adresu';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Rozšířené';

  @override
  String get amount => 'Částka';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Částka $amount $coin';
  }

  @override
  String get amountMissing => 'Prosím zadejte částku';

  @override
  String get amountZero => 'Částka nemůže být nula';

  @override
  String get areYouSure => 'Jste si jistí?';

  @override
  String get authBiometricMessage => 'Pro přidání Peněženky Ověřte';

  @override
  String get authMethod => 'Metoda ověření';

  @override
  String get authPinMessage => 'Pro přidání Peněženky zadejte PIN';

  @override
  String get autoLockHeader => 'Automaticky zamknout';

  @override
  String get available => 'Dostupný';

  @override
  String get back => 'Zpět';

  @override
  String get backupConfirmButton => 'Zálohoval jsem to';

  @override
  String get backupSecretPhrase => 'Zálohovat tajnou frázi';

  @override
  String get missingSecretPhrase => 'Chybí tajná fráze';

  @override
  String get biometricsMethod => 'Biometrie';

  @override
  String get blockExplorer => 'Průzkumník bloků';

  @override
  String get cancel => 'Zrušit';

  @override
  String get change => 'Změnit';

  @override
  String get changeAddress => 'Změnit Adresu';

  @override
  String get changeAddressCopied => 'Změna Adresy Zkopírována';

  @override
  String get changeIndex => 'Index Změny';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Změnit $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Zkontrolujte prosím přístupy kamery';

  @override
  String get clipboardEmpty => 'Schránka je prázdná';

  @override
  String get close => 'Zavřít';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get confirmPasswordHint => 'Potvrďte heslo';

  @override
  String confirmations(String confirmations) {
    return '$confirmations potvrzení';
  }

  @override
  String get confirmed => 'potvrzeno';

  @override
  String get confirmedMaturing => 'potvrzeno · zraje';

  @override
  String get confirming => 'potvrzuji';

  @override
  String contactAdded(String contactName) {
    return '$contactName přidán do kontaktů.';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address adresa zkopírována';
  }

  @override
  String get contactExists => 'Kontakt Již Existuje.';

  @override
  String get contactHeader => 'Kontakt';

  @override
  String get contactInvalid => 'Neplatné Jméno Kontaktu';

  @override
  String get contactNameHint => 'Zadejte jméno @';

  @override
  String get contactNameMissing => 'Zadejte nové jméno pro tento kontakt';

  @override
  String contactRemoved(String contactName) {
    return '$contactName byl úspěšně odstraněn z kontaktů!';
  }

  @override
  String get contactsHeader => 'Kontakty';

  @override
  String get contactsImportErr => 'Import kontaktů se nezdařil';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Úspěšně importovány $noContacts kontakty ';
  }

  @override
  String get copied => 'Zkopírováno';

  @override
  String get copy => 'Kopírovat';

  @override
  String get copyAddress => 'Kopírovat adresu';

  @override
  String get copyErrorButton => 'Chyba Kopírování';

  @override
  String get createAPasswordHeader => 'Vytvořte si heslo.';

  @override
  String get createPasswordFirstParagraph =>
      'Můžete si vytvořit heslo a lépe tak zabezpečit svou peněženku';

  @override
  String get createPasswordHint => 'Vytvořit heslo';

  @override
  String get createPasswordSecondParagraph =>
      'Heslo je volitelné a vaše peněženka bude bez ohledu na to chráněna vaším PIN kódem nebo biometrickými údaji.';

  @override
  String get createPasswordSheetHeader => 'Vytvořit';

  @override
  String get currency => 'Měna';

  @override
  String get currencyPoweredBy => 'Poháněno serverem CoinGecko';

  @override
  String get defaultAccountName => 'Adresa 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Přijmout $addressIndex';
  }

  @override
  String get defaultWalletName => 'Má Peněženka';

  @override
  String get disablePasswordSheetHeader => 'Znemožnit';

  @override
  String get disablePasswordSuccess => 'Heslo bylo úspěšně znemožněno';

  @override
  String get disableWalletPassword => 'Znemožnit heslo peněženky';

  @override
  String get doContinue => 'Pokračovat';

  @override
  String get donate => 'Darovat';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Znovu Neukazovat';

  @override
  String get emptyCardIntroUtxos =>
      'Toto je záložka UTXO. Všechna UTXO ve Vaší peněžence se objeví zde';

  @override
  String get emptyResult => 'Výsledek Prázdný';

  @override
  String get emptyWalletName => 'Název Peněženky nemůže být prázdný';

  @override
  String get encryptionFailedError =>
      'Nastavení hesla k peněžence se nezdařilo';

  @override
  String get enterAddress => 'Zadejte Adresu';

  @override
  String get enterAmount => 'Zadejte Částku';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Zadejte Poznámku';

  @override
  String get enterPasswordHint => 'Zadejte vaše heslo';

  @override
  String get errorMessageCopied => 'Kód chyby zkopírován do schránky';

  @override
  String get exampleCardIntro =>
      'Toto je záložka transakcí. Jakmile pošleš nebo obdržíš HTN, ukáže se to zde:';

  @override
  String get export => 'Exportovat';

  @override
  String get fee => 'Poplatek';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Poplatek $amount $coin';
  }

  @override
  String get feeTitle => 'POPLATEK';

  @override
  String get fetchingTransactions => 'Přivádím Transakce';

  @override
  String get fingerprintSeedBackup => 'Ověřte se pro zálohu Tajné Fráze.';

  @override
  String get goBackButton => 'Zpět';

  @override
  String get gotItButton => 'Rozumím!';

  @override
  String get import => 'Importovat';

  @override
  String get importSecretPhrase => 'Importovat tajnou frázi';

  @override
  String get importSecretPhraseHint =>
      'Níže prosím zadejte svoji 24-slovní tajnou frázi. ';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'Importovat pěněženku';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'Ihned';

  @override
  String get insufficientBalance => 'Nedostatečný zůstatek';

  @override
  String get insufficientBalanceDetails =>
      'Nemáte dostatek HTN pro provedení této transakce';

  @override
  String get invalidAddress => 'Zadaná adresa je neplatná';

  @override
  String get invalidAmount => 'Neplatná Částka';

  @override
  String get invalidChecksumMessage =>
      'Zkontrolujte prosím, zda je Vaše Tajná Fráze \nzadána správně!';

  @override
  String get invalidKpubMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get invalidDestinationAddress => 'Neplataná Doručovací Adresa';

  @override
  String get invalidPassword => 'Neplatné Heslo';

  @override
  String get hoosatDevFund => 'Vývojářský Fond Kaspy';

  @override
  String get hoosatMobile => 'Peněženka Hoosat Mobile';

  @override
  String get language => 'Jazyk';

  @override
  String get loadingTransactions => 'Nahrávám Transakce...';

  @override
  String get lockAppSetting => 'Ověřit při Spuštění';

  @override
  String get locked => 'Zamčeno';

  @override
  String get loggingOutMessage => 'Odhlašuji...';

  @override
  String get logout => 'Odhlásit';

  @override
  String get logoutDialogContent =>
      'Opravdu se chcete odhlásit z této peněženky?';

  @override
  String get logoutOrSwitchWallet => 'Odhlásit / Přepnout Peněženku';

  @override
  String get manage => 'Spravovat';

  @override
  String get manualEntry => 'Ruční zadání';

  @override
  String get networkHeader => 'Síť';

  @override
  String get newAddress => 'Nová Adresa';

  @override
  String get newWallet => 'Nová Peněženka';

  @override
  String get nextButton => 'Další';

  @override
  String get no => 'Ne';

  @override
  String get noContactsExport => 'Neexistují žádné kontakty k exportu.';

  @override
  String get noContactsImport => 'Žádné nové kontakty k importu.';

  @override
  String get noQrCodeFound => 'Žádný QR kód nenalezen';

  @override
  String get noSkipButton => 'Ne, přeskočit';

  @override
  String get noUppercase => 'NO';

  @override
  String get nodeAddress => 'Hoosat Uzel';

  @override
  String get nodeDeleteMessage => 'Jste si jisti, že to chcete smazat?';

  @override
  String get nodeDeleteTitle => 'Smazat nastavení Hoosat Uzlu?';

  @override
  String get nodeNameEmpty => 'Název Uzlu nemůže být prázdný';

  @override
  String get nodeNameHint => 'Přidat Název Uzlu';

  @override
  String get nodeUrlHint => 'Přidat URL Uzlu';

  @override
  String get nodeUrlInvalid => 'Neplatné URL Uzlu';

  @override
  String get nodesSheetTitle => 'Hoosat Uzly';

  @override
  String get off => 'Vypnout';

  @override
  String get on => 'Zapnout';

  @override
  String get paperWallet => 'Papírová Peněženka';

  @override
  String get passwordBlank => 'Heslo nemůže být prázdné';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Už nebudete potřebovat heslo pro otevření Peněženky.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Toto heslo bude vyžadováno k otevření Peněženky.';

  @override
  String get passwordsDontMatch => 'Hesla se neshodují';

  @override
  String get pasteMnemonicError => 'Zkopírovaný obsah není platná tajná fráze';

  @override
  String get pending => 'čekající';

  @override
  String get pinConfirmError => 'Piny se neshodují';

  @override
  String get pinConfirmTitle => 'Potvrdit Váš pin';

  @override
  String get pinCreateTitle => 'Vytvořte si 6-místný pin';

  @override
  String get pinEnterTitle => 'Zadejte pin';

  @override
  String get pinInvalid => 'Zadaný PIN je neplatný';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup => 'Zadejte PIN pro Zálohu Tajné Fráze';

  @override
  String get preferences => 'Předvolby';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get qrInvalidAddress => 'QR kód neobsahuje platnou cílovou adresu';

  @override
  String get qrInvalidSeed =>
      'QR kód neobsahuje platné jádro ani soukromý klíč';

  @override
  String get qrMnemonicError => 'QR neobsahuje platnou tajnou frázi';

  @override
  String get receive => 'Přijmout';

  @override
  String get receiveAddress => 'Příjmová Adresa';

  @override
  String get receiveAddressCopied => 'Příjmová Adresa Zkopírována';

  @override
  String get receiveIndex => 'Příjmový Index';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Přijmout $addressIndex';
  }

  @override
  String get received => 'Přijato';

  @override
  String get removeContact => 'Odstranit kontakt';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Opravdu chcete odstranit $contactName?';
  }

  @override
  String get removeWalletAction => 'Odstranit Peněženku';

  @override
  String get removeWalletBiometricsMessage =>
      'Ověřte se pro odstranění Peněženky';

  @override
  String get removeWalletDetail =>
      'Odstranění této peněženky odstraní tajnou frázi a všechna na peněženku vázaná data z tohoto zařízení. Pokud jste si nezálohovali tajnou frázi, už se nikdy ke svým prostředkům nedostanete.';

  @override
  String get removeWalletPinMessage => 'Zadat PIN pro Odstranění Peněženky';

  @override
  String get removeWalletReassurance =>
      'Pokud jste si zálohovaly tajnou frázi, nemusíte se ničeho obávat.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Vyžadovat heslo k otevření této peněženky?';

  @override
  String get restartSetupButton => 'Restartovat Nastavení?';

  @override
  String get scanQrCode => 'Naskenovat QR kód';

  @override
  String get scanQrCodeError => 'Selhání rozebrání qr kódu';

  @override
  String get scanFromImage => 'Skenovat z obrázku';

  @override
  String get toggleFlash => 'Zapnout/vypnout svítilnu';

  @override
  String get riskDisclosureHeader => 'Než začnete';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet je nekustodiální peněženka. Vaše tajná fráze a soukromé klíče se vytvářejí a ukládají pouze v tomto zařízení – nikdy je nevidíme, neukládáme je na žádný server a nemůžeme je pro vás obnovit.';

  @override
  String get riskDisclosureWarning =>
      'Pokud ztratíte tajnou frázi, neexistuje obnovení hesla ani tým podpory, který by vám vrátil prostředky. Za její bezpečné uložení odpovídáte výhradně vy.';

  @override
  String get riskDisclosureAccept => 'Rozumím, pokračovat';

  @override
  String get secretInfo =>
      'Na následující obrazovce uvidíte svoji tajnou frázi. Jedná se o heslo pro přístup k vašim finančním prostředkům. Je klíčové, abyste jej zálohovali a nikdy s nikým nesdíleli.';

  @override
  String get secretInfoHeader => 'Bezpečnost především!';

  @override
  String get secretPhrase => 'Tajná fráze';

  @override
  String get verifyBackupTitle => 'Ověřte zálohu';

  @override
  String get verifyBackupInstruction =>
      'Pro každou pozici vyberte správné slovo, abyste potvrdili, že jste si tajnou frázi uložili.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Jaké je slovo č. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'To není úplně správně. Zkontrolujte zálohu a zkuste to znovu.';

  @override
  String get secretPhrase12Words => '12 slov';

  @override
  String get secretPhrase24Words => '24 slov';

  @override
  String get secretWarning =>
      'Pokud ztratíte zařízení nebo odinstalujete aplikaci, budete potřebovat tajnou frázi nebo jádro, abyste mohli získat zpět své prostředky!';

  @override
  String get securityHeader => 'Zabezpečení';

  @override
  String get securitySettingsBiometrics =>
      'Ověřte se pro přístup k nastavení zabezpečení';

  @override
  String get securitySettingsPin =>
      'Zadejte PIN pro přístup k nastavení zabezpečení';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Podepsat zprávu';

  @override
  String get signMessageCopySignature => 'Kopírovat podpis';

  @override
  String get signMessageDescription =>
      'Podepište zprávu jednou z adres své peněženky';

  @override
  String get signMessageHint => 'Zadejte zprávu k podpisu';

  @override
  String get signMessageSignatureCopied => 'Podpis zkopírován';

  @override
  String get signMessageSigned => 'Zpráva podepsána';

  @override
  String get signMessageTooLong => 'Zpráva je příliš dlouhá';

  @override
  String get seedInvalid => 'Jádro je Neplatné';

  @override
  String get nodeUnreachable =>
      'Nelze se spojit s vaším uzlem. Zůstatky mohou být zastaralé.';

  @override
  String get nodeUnreachableRetry => 'Zkusit znovu';

  @override
  String get send => 'Poslat';

  @override
  String get sendConfirm => 'Poslat';

  @override
  String get sendError => 'Došlo k chybě. Zkuste to znovu.';

  @override
  String get sendNote => 'POZNÁMKA';

  @override
  String get sendToAddressTitle => 'Kam';

  @override
  String get sendTxProgressDescription =>
      'Prosím počkejte, než se transakce odešle';

  @override
  String get sendTxProgressTitle => 'Odesílám Transakci';

  @override
  String get sending => 'Poslat';

  @override
  String get sent => 'Odesláno';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Nastavit heslo';

  @override
  String get setPasswordSuccess => 'Heslo bylo úspěšně nastaveno';

  @override
  String get setWalletPassword => 'Nastavit heslo peněženky';

  @override
  String get settingsHeader => 'Nastavení';

  @override
  String get settingsTransfer => 'Načíst z Papírové Peněženky';

  @override
  String get setupFailedMessage => 'Něco se pokazilo';

  @override
  String get shareHoosatMobile => 'Sdílet Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Vyzkoušet Peněženku Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Vyzkoušejte Hoosat Mobile - mobilní peněženka pro Kaspu. Web - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Něco se pokazilo';

  @override
  String get systemDefault => 'Výchozí systému';

  @override
  String get tapToHide => 'Klepnutím skryjete';

  @override
  String get tapToReveal => 'Klikněte pro odhalení';

  @override
  String get themeDark => 'Tmavý Motiv';

  @override
  String get themeHeader => 'Motiv';

  @override
  String get themeLight => 'Světlý Motiv';

  @override
  String get toggleTheme => 'Přepnout motiv';

  @override
  String get thisWallet => '#Tato Peněženka';

  @override
  String get to => 'Kam';

  @override
  String get toAddress => 'Na Adresu';

  @override
  String get tooManyFailedAttempts =>
      'Příliš mnoho neúspěšných pokusů o odemknutí.';

  @override
  String get totalValue => 'Celková Hodnota';

  @override
  String get transactionId => 'ID Transakce';

  @override
  String get transactionsUppercase => 'TRANSAKCE';

  @override
  String get transfer => 'Převést';

  @override
  String get transferClose => 'Klepnutím kamkoli zavřete okno.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN úspěšně převedeno do vaší peněženky Hoosat Mobile. \n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Byla nalezena peněženka se zůstatkem $amount HTN. ';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Klepněte pro potvrzení převedení prostředků.\n';

  @override
  String get transferConfirmInfoThird =>
      'Dokončení přenosu může trvat několik sekund.';

  @override
  String get transferError =>
      'Během přenosu došlo k chybě. Prosím zkuste to znovu později.';

  @override
  String get transferHeader => 'Převést Prostředky';

  @override
  String transferIntro(String button) {
    return 'Tento proces přenese prostředky z papírové peněženky do vaší peněženky Hoosat Mobile. \n\n Začněte klepnutím na tlačítko \"$button\".';
  }

  @override
  String get transferLoading => 'Probíhá Přenos';

  @override
  String get transferManualHint => 'Zadejte jádro níže.';

  @override
  String get transferNoFunds => 'Toto jádro na sobě nemá žádné HTN ';

  @override
  String get transferQrScanError => 'Tento QR kód neobsahuje platné jádro.';

  @override
  String get transferQrScanHint =>
      'Naskenujte Hoosat\njádro nebo soukromý klíč ';

  @override
  String get unconfirmed => 'nepotvrzená';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'Neznámá';

  @override
  String get unlock => 'Odemknout';

  @override
  String get unlockBiometrics => 'Ověřte a Odemkněte Hoosat Mobile';

  @override
  String get unlockPin => 'Zadejte PIN pro odemčení Peněženky';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Zobrazit Adresu';

  @override
  String get viewTransaction => 'Zobrazit Transakci';

  @override
  String get walletAddresses => 'Adresy Peněženky';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Název Peněženky';

  @override
  String get walletNameDescription => 'Zadejte název své peněženky';

  @override
  String get walletNameHint => 'Název Peněženky';

  @override
  String get walletSetupAddressDiscovery => 'Probíhá Odhalování Adres ';

  @override
  String get walletSetupMessage => 'Nastavuji Peněženku';

  @override
  String get walletsTitle => 'Peněženky';

  @override
  String get warning => 'Varování';

  @override
  String welcomeMessage(String version) {
    return 'Vítejte!\n\nToto je verze $version Hoosat Mobile Peněženky - mobilní peněženky pro Kaspu';
  }

  @override
  String get welcomeText =>
      'Vítejte v Hoosat Mobile. Nejprve můžete vytvořit novou peněženku nebo importovat stávající.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutách',
      one: '1 minutě',
    );
    return 'Po $_temp0';
  }

  @override
  String get yes => 'Ano';

  @override
  String get yesButton => 'Ano';

  @override
  String get yesUppercase => 'ANO';

  @override
  String get nodeNotSyncedException => 'Uzel není synchronizován';

  @override
  String get nodeNoUTXOIndexException => 'Uzel nemá UTXO index';

  @override
  String get nodeSecureConnection => 'Bezpečné spojení';

  @override
  String get hoosatUriInvalid => 'Invalid Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Máte mnoho malých nevyužitých výstupů (UTXO). Konsolidace je sloučí do menšího počtu větších UTXO, takže budoucí platby budou rychlejší a mohou vyžadovat nižší poplatky. Tím vznikne jedna nebo více transakcí a budou účtovány síťové poplatky.';

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
  String get fundsStillConfirmingTitle => 'Prostředky se stále potvrzují';

  @override
  String get fundsStillConfirmingBody =>
      'Část prostředků na tomto účtu byla přijata příliš nedávno na to, aby šla odeslat – síť nejprve vyžaduje krátkou dobu zrání, obvykle několik minut. Můžete počkat a zkusit to znovu, nebo odeslat z jiného účtu, který má dozrálé prostředky.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Přepnout účet';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Shromáždit na Hlavním';

  @override
  String get moveToMainDescription =>
      'Převést zůstatek všech ostatních adres na vaši hlavní adresu';

  @override
  String get moveToMainConfirmation => 'Přesunout vše na Hlavní?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Tímto přesunete $amount $symbol z $count dalších adres na svou hlavní adresu. Vytvoří se jedna nebo více transakcí a účtují se síťové poplatky.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Zůstatek všech adres je již na Hlavním';

  @override
  String get movingToMain => 'Shromažďování na Hlavním';

  @override
  String get moveToMainSuccess => 'Přesun na Hlavní byl úspěšný';

  @override
  String get moveToMainFailure => 'Přesun na Hlavní se nezdařil';

  @override
  String get moveToMainUppercased => 'PŘESUNOUT';

  @override
  String get manageAccounts => 'Účty';

  @override
  String get manageAccountsDescription =>
      'Přidávejte pojmenované adresy a spravujte je';

  @override
  String get mainAccountLabel => 'Hlavní';

  @override
  String get archiveAction => 'Archivovat';

  @override
  String get restoreAction => 'Obnovit';

  @override
  String get archivedAccountsHeader => 'Archivované';

  @override
  String get noAdditionalAccountsYet => 'Zatím žádné další účty';

  @override
  String get renameAccount => 'Přejmenovat účet';

  @override
  String get accountLabelHint => 'Název účtu';

  @override
  String get saveUppercased => 'ULOŽIT';

  @override
  String get addUppercased => 'PŘIDAT';

  @override
  String get sendFromLabel => 'Z';

  @override
  String get sendFromAny => 'Libovolný';

  @override
  String get home => 'Domů';

  @override
  String get activity => 'Aktivita';

  @override
  String get totalBalance => 'Celkový zůstatek';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'K utracení nyní $spendable · Ještě přichází $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Mince, které ještě přicházejí, jsou vaše a brzy půjdou utratit.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Mince, které ještě přicházejí, půjde utratit za $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'K utracení nyní $amount. Zbytek půjde utratit za $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'K utracení nyní $amount. Zbytek ještě přichází.';
  }

  @override
  String get txTagWaiting => 'čeká na přijetí';

  @override
  String get txTagStatusUnknown => 'stav neznámý';

  @override
  String get txTagNotAccepted => 'nepřijato';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'potvrzování $n / $total';
  }

  @override
  String get submittedTo => 'Odesláno na';

  @override
  String get testConnection => 'Otestovat připojení';

  @override
  String get accountsOtherWalletHeader =>
      'Uloženo z jiné peněženky (pouze zobrazení)';

  @override
  String get accountsOtherWalletNote =>
      'Tato peněženka je nemůže utratit, proto se nezapočítávají do jejího součtu. Otevřete peněženku, ke které patří, abyste je mohli použít.';

  @override
  String get noActivityTitle => 'Zatím žádná aktivita';

  @override
  String get txTypeSent => 'Odesláno';

  @override
  String get txTypeReceived => 'Přijato';

  @override
  String get txTypeThisWallet => 'V rámci peněženky';

  @override
  String get txTypeMerged => 'Sloučené mince';

  @override
  String get noActivityMessage =>
      'Když odešlete nebo přijmete HTN, objeví se to zde.';

  @override
  String get seeAll => 'Zobrazit vše';

  @override
  String get show => 'Zobrazit';

  @override
  String get myAccounts => 'Moje účty';

  @override
  String homeGreeting(String walletName) {
    return 'Ahoj, $walletName';
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
  String get importOptionStandardWalletTitle =>
      'Importovat standardní peněženku';

  @override
  String get importOptionStandardWalletDescription =>
      'Peněženky s 12 nebo 24 slovy a standardním odvozením, s volitelnou frází BIP39';

  @override
  String get importOptionLegacyWalletTitle => 'Importovat starší peněženku';

  @override
  String get importOptionLegacyWalletDescription =>
      'Peněženky s 12 slovy a starším odvozením, kompatibilní se starým Web Wallet a KDX';

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
  String get changeAddressModeTitle => 'Chování adresy pro drobné';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Každá adresa si ponechá svůj zůstatek a drobné zůstanou na místě';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Pokaždé se použije nová adresa (soukromě, zůstatek se rozptýlí)';

  @override
  String get changeAddressModeDialogTitle => 'Chování adresy pro drobné';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Ponechat zůstatky na každé adrese';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Soukromé';

  @override
  String get requestPasswordHeader => 'Žádat o heslo';

  @override
  String get requestPasswordAtLaunch => 'Při spuštění';

  @override
  String get requestPasswordWhenLocked => 'Při zamknutí';

  @override
  String get requestPasswordWhenSigning => 'Při podepisování';

  @override
  String get importWalletAdvancedOptions => 'Pokročilé možnosti';

  @override
  String get bip39Passphrase => 'Fráze BIP39';

  @override
  String get bip39PassphraseWarning =>
      'POZNÁMKA: Toto není heslo peněženky – různé fráze BIP39 otevírají různé peněženky.';

  @override
  String get bip39PassphraseEnter => 'Zadejte frázi';

  @override
  String get bip39PassphraseConfirm => 'Potvrďte frázi';

  @override
  String get bip39PassphraseMismatch => 'Fráze se neshodují!';

  @override
  String get bip39PassphraseNote => 'Peněženka s frází BIP39.';

  @override
  String get feePriorityHint => 'Zadejte prioritní poplatek';

  @override
  String get feeBaseUppercase => 'ZÁKLADNÍ POPLATEK';

  @override
  String get feePriorityUppsercase => 'PRIORITNÍ POPLATEK';

  @override
  String get feeUpdateAddressError => 'Cílovou adresu se nepodařilo rozpoznat';

  @override
  String get feeUpdateRebuildError => 'Transakci se nepodařilo znovu sestavit';

  @override
  String get feeUpdateRebuildError2 =>
      'Transakci se nepodařilo znovu sestavit s novým poplatkem';

  @override
  String get feeUpdateError => 'Poplatek se nepodařilo aktualizovat';

  @override
  String get feeUpdate => 'Aktualizovat poplatek';

  @override
  String get feeUpdateTitle => 'Aktualizace poplatku';

  @override
  String get feeSheetRecommendedPriority => 'Doporučené prioritní poplatky';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Nový prioritní poplatek musí být alespoň $amount $symbol';
  }

  @override
  String get txPending => 'ČEKÁ';

  @override
  String get txPendingMessage => 'Tato transakce čeká';

  @override
  String get txPendingTitle => 'Čekající transakce';

  @override
  String get txPendingContent => 'V mempoolu jsou čekající transakce.';

  @override
  String get txPendingActionUpdateFee => 'Aktualizovat poplatek transakce';

  @override
  String get txPendingActionRbf => 'Nahradit poplatkem (RBF)';

  @override
  String get txInMempool => 'v mempoolu';

  @override
  String get utxoSelectionTitle => 'Vybrat UTXO';

  @override
  String get utxoSelectionHint => 'Vyberte více UTXO';
}
