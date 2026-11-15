// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get account => 'Tili';

  @override
  String get accounts => 'Tilit';

  @override
  String get ackBackedUp =>
      'Oletko varma että olet varmuuskopioinut turvasanasi?';

  @override
  String get add => 'Lisää';

  @override
  String get addAccount => 'Lisää tili';

  @override
  String get addContact => 'Lisää yhteystieto';

  @override
  String get addNode => 'Lisää solmu';

  @override
  String get addNodeFailed => 'Hoosat-solmun lisääminen epäonnistui';

  @override
  String addNodeFailedMessage(String error) {
    return 'Virhe: $error';
  }

  @override
  String get addNodeSuccess => 'Solmu lisätty onnistuneesti';

  @override
  String get addingNodeMessage => 'Odota kunnes yhteys solmuun luotu';

  @override
  String get addingNodeTitle => 'Lisätään solmua';

  @override
  String get address => 'Osoite';

  @override
  String get addressCopied => 'Osoite kopioitu';

  @override
  String get addressCopiedFailed => 'Osoitteen kopiointi epäonnistui';

  @override
  String get addressHint => 'Syötä osoite';

  @override
  String get addressMising => 'Syötä osoite';

  @override
  String get addressShare => 'Jaa osoite';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Edistynyt';

  @override
  String get amount => 'Määrä';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Määrä $amount $coin';
  }

  @override
  String get amountMissing => 'Syötä määrä';

  @override
  String get amountZero => 'Määrä ei voi olla nolla';

  @override
  String get areYouSure => 'Oletko varma?';

  @override
  String get authBiometricMessage => 'Tunnistaudu lisätäksesi lompakon';

  @override
  String get authMethod => 'Tunnistautumistapa';

  @override
  String get authPinMessage => 'Syötä PIN-koodi lisätäksesi lompakon';

  @override
  String get autoLockHeader => 'Lukitse automaattisesti';

  @override
  String get available => 'Saatavilla';

  @override
  String get back => 'Takaisin';

  @override
  String get backupConfirmButton => 'Olen varmuuskopioinut';

  @override
  String get backupSecretPhrase => 'Varmuuskopioi turvasanat';

  @override
  String get missingSecretPhrase => 'Turvasanat puuttuvat';

  @override
  String get biometricsMethod => 'Biometriikka';

  @override
  String get blockExplorer => 'Lohkoselain';

  @override
  String get cancel => 'Peruuta';

  @override
  String get change => 'Vaihtoraha';

  @override
  String get changeAddress => 'Vaihtorahaosoite';

  @override
  String get changeAddressCopied => 'Vaihtorahaosoite kopioitu';

  @override
  String get changeIndex => 'Vaihtorahaindeksi';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Vaihtoraha $addressIndex';
  }

  @override
  String get checkCameraPermission => 'Tarkista kameran käyttöoikeudet';

  @override
  String get clipboardEmpty => 'Leikepöytä on tyhjä';

  @override
  String get close => 'Sulje';

  @override
  String get confirm => 'Vahvista';

  @override
  String get confirmPasswordHint => 'Vahvista salasana';

  @override
  String confirmations(String confirmations) {
    return '$confirmations vahvistusta';
  }

  @override
  String get confirmed => 'Vahvistettu';

  @override
  String get confirmedMaturing => 'vahvistettu · kypsyy';

  @override
  String get confirming => 'Vahvistetaan';

  @override
  String contactAdded(String contactName) {
    return '$contactName on lisätty yhteystietoihin';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address osoite kopioitu';
  }

  @override
  String get contactExists => 'Yhteystieto on jo olemassa';

  @override
  String get contactHeader => 'Yhteystieto';

  @override
  String get contactInvalid => 'Virheellinen yhteystiedon nimi';

  @override
  String get contactNameHint => 'Lisää nimi @';

  @override
  String get contactNameMissing => 'Valitse tälle yhteystiedolle nimi';

  @override
  String contactRemoved(String contactName) {
    return '$contactName on poistettu yhteystiedoista!';
  }

  @override
  String get contactsHeader => 'Yhteystiedot';

  @override
  String get contactsImportErr => 'Yhteystietojen tuonti epäonnistui';

  @override
  String contactsImportSuccess(String noContacts) {
    return '$noContacts yhteystietoa tuotu onnistuneesti';
  }

  @override
  String get copied => 'Kopioitu';

  @override
  String get copy => 'Kopioi';

  @override
  String get copyAddress => 'Kopioi osoite';

  @override
  String get copyErrorButton => 'Kopiointivirhe';

  @override
  String get createAPasswordHeader => 'Luo salasana.';

  @override
  String get createPasswordFirstParagraph =>
      'Voit luoda salasanan lisätäksesi turvallisuutta lompakollesi.';

  @override
  String get createPasswordHint => 'Luo salasana';

  @override
  String get createPasswordSecondParagraph =>
      'Salasana ei ole pakollinen, ja lompakkosi suojataan PIN-koodilla tai biometriikalla joka tapauksessa.';

  @override
  String get createPasswordSheetHeader => 'Luo';

  @override
  String get currency => 'Valuutta';

  @override
  String get currencyPoweredBy => 'Palvelun tarjoaa CoinGecko';

  @override
  String get defaultAccountName => 'Osoite 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Vastaanotto $addressIndex';
  }

  @override
  String get defaultWalletName => 'Lompakkoni';

  @override
  String get disablePasswordSheetHeader => 'Kytke pois';

  @override
  String get disablePasswordSuccess => 'Salasana poistettu käytöstä';

  @override
  String get disableWalletPassword => 'Kytke pois lompakon salasana';

  @override
  String get doContinue => 'Jatka';

  @override
  String get donate => 'Lahjoita';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Älä näytä uudelleen';

  @override
  String get emptyCardIntroUtxos =>
      'Tämä on UTXO-välilehti. Kaikki lompakkosi UTXO:t näkyvät täällä';

  @override
  String get emptyResult => 'Tyhjä tulos';

  @override
  String get emptyWalletName => 'Lompakon nimi ei voi olla tyhjä';

  @override
  String get encryptionFailedError => 'Lompakon salasanan asetus epäonnistui';

  @override
  String get enterAddress => 'Syötä osoite';

  @override
  String get enterAmount => 'Syötä määrä';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Syötä viesti';

  @override
  String get enterPasswordHint => 'Syötä salasana';

  @override
  String get errorMessageCopied => 'Virheviesti kopioitu leikepöydälle';

  @override
  String get exampleCardIntro =>
      'Tämä on tapahtumien välilehti. Kun olet lähettänyt tai vastaanottanut tapahtumia, ne näkyvät täällä.';

  @override
  String get export => 'Vie';

  @override
  String get fee => 'Taksa';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Taksa $amount $coin';
  }

  @override
  String get feeTitle => 'TAKSA';

  @override
  String get fetchingTransactions => 'Haetaan tapahtumia';

  @override
  String get fingerprintSeedBackup =>
      'Tunnistaudu varmuuskopioidaksesi turvasanat';

  @override
  String get goBackButton => 'Takaisin';

  @override
  String get gotItButton => 'Selvä!';

  @override
  String get import => 'Tuo';

  @override
  String get importSecretPhrase => 'Tuo turvasanat';

  @override
  String get importSecretPhraseHint => 'Syötä 24 turvasanaa alle';

  @override
  String get importSecretPhraseHintCombo => 'Syötä 12 tai 24 turvasanaa alle.';

  @override
  String get importSecretPhraseHintLegacy => 'Syötä 12 turvasanaa alle.';

  @override
  String get importWallet => 'Tuo lompakko';

  @override
  String get importWalletDescription => 'Valitse yksi vaihtoehto alta.';

  @override
  String get instantly => 'Välittömästi';

  @override
  String get insufficientBalance => 'Riittämätön määrä';

  @override
  String get insufficientBalanceDetails =>
      'Sinulla ei ole tapahtuman vaatimaa HTN-määrää';

  @override
  String get invalidAddress => 'Syöttämäsi osoite on virheellinen';

  @override
  String get invalidAmount => 'Virheellinen määrä';

  @override
  String get invalidChecksumMessage =>
      'Tarkista että turvasanat\n ovat syötetty oikein!';

  @override
  String get invalidKpubMessage =>
      'Varmista että laajennettu julkinen avaimesi on syötetty oikein!';

  @override
  String get invalidDestinationAddress =>
      'Vastaanottajan osoite on virheellinen';

  @override
  String get invalidPassword => 'Virheellinen salasana';

  @override
  String get hoosatDevFund => 'Hoosatin kehitysvarat';

  @override
  String get hoosatMobile => 'Hoosat-lompakko';

  @override
  String get language => 'Kieli';

  @override
  String get loadingTransactions => 'Ladataan tapahtumia...';

  @override
  String get lockAppSetting => 'Tunnistaudu käynnistettäessä';

  @override
  String get locked => 'Lukittu';

  @override
  String get loggingOutMessage => 'Kirjaudutaan ulos...';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get logoutDialogContent =>
      'Oletko varma, että haluat kirjautua ulos tästä lompakosta?';

  @override
  String get logoutOrSwitchWallet => 'Kirjaudu ulos / Vaihda lompakkoa';

  @override
  String get manage => 'Hallinnoi';

  @override
  String get manualEntry => 'Manuaalinen kirjaus';

  @override
  String get networkHeader => 'Verkko';

  @override
  String get newAddress => 'Uusi osoite';

  @override
  String get newWallet => 'Uusi lompakko';

  @override
  String get nextButton => 'Seuraava';

  @override
  String get no => 'Ei';

  @override
  String get noContactsExport => 'Ei ole yhteystietoja, joita viedä';

  @override
  String get noContactsImport => 'Ei uusia yhteystietoja, joita tuoda';

  @override
  String get noQrCodeFound => 'QR-koodia ei löytynyt';

  @override
  String get noSkipButton => 'Ei, ohita';

  @override
  String get noUppercase => 'EI';

  @override
  String get nodeAddress => 'Hoosat-solmu';

  @override
  String get nodeDeleteMessage => 'Haluatko varmasti poistaa?';

  @override
  String get nodeDeleteTitle => 'Poista Hoosat-solmun asetukset?';

  @override
  String get nodeNameEmpty => 'Solmun nimi ei voi olla tyhjä';

  @override
  String get nodeNameHint => 'Syötä solmun nimi';

  @override
  String get nodeUrlHint => 'Syötä solmun URL-osoite';

  @override
  String get nodeUrlInvalid => 'Virheellinen solmun URL-osoite';

  @override
  String get nodesSheetTitle => 'Hoosat-solmut';

  @override
  String get off => 'Pois päältä';

  @override
  String get on => 'Päälle';

  @override
  String get paperWallet => 'Paperilompakko';

  @override
  String get passwordBlank => 'Salasana ei voi olla tyhjä';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Et tule tarvitsemaan salasanaa avataksesi tätä lompakkoa.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Tämä salasana vaaditaan tämän lompakon avaamiseen.';

  @override
  String get passwordsDontMatch => 'Salasanat eivät täsmää';

  @override
  String get pasteMnemonicError => 'Leikepöytä ei sisällä valideja turvasanoja';

  @override
  String get pending => 'odottaa';

  @override
  String get pinConfirmError => 'PIN-koodit eivät täsmää';

  @override
  String get pinConfirmTitle => 'Vahvista PIN-koodisi';

  @override
  String get pinCreateTitle => 'Luo 6-numeroinen PIN-koodi';

  @override
  String get pinEnterTitle => 'Syötä PIN-koodi';

  @override
  String get pinInvalid => 'Väärä PIN-koodi syötetty';

  @override
  String get pinMethod => 'PIN-koodi';

  @override
  String get pinSeedBackup => 'Syötä PIN-koodi varmuuskopioidaksesi turvasanat';

  @override
  String get preferences => 'Asetukset';

  @override
  String get privacyPolicy => 'Tietosuojatiedote';

  @override
  String get qrInvalidAddress => 'QR-koodi ei sisällä validia osoitetta';

  @override
  String get qrInvalidSeed =>
      'QR-koodi ei sisällä validia seediä tai yksityistä avainta';

  @override
  String get qrMnemonicError => 'QR-koodi ei sisällä valideja turvasanoja';

  @override
  String get receive => 'Vastaanota';

  @override
  String get receiveAddress => 'Vastaanotto-osoite';

  @override
  String get receiveAddressCopied => 'Vastaanotto-osoite kopioitu';

  @override
  String get receiveIndex => 'Vastaanottoindeksi';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Vastaanotto $addressIndex';
  }

  @override
  String get received => 'Vastaanotettu';

  @override
  String get removeContact => 'Poista yhteystieto';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Oletko varma että haluat poistaa $contactName?';
  }

  @override
  String get removeWalletAction => 'Poista lompakko';

  @override
  String get removeWalletBiometricsMessage =>
      'Tunnistaudu poistaaksesi lompakon';

  @override
  String get removeWalletDetail =>
      'Poistamalla tämän lompakon tästä laitteesta poistuvat myös turvasanat ja kaikki lompakon tiedot. Jos turvasanoja ei ole varmuuskopioitu, et tule koskaan pääsemään käsiksi varoihin uudestaan.';

  @override
  String get removeWalletPinMessage => 'Syötä PIN-koodi poistaaksesi lompakon';

  @override
  String get removeWalletReassurance =>
      'Kunhan olet varmuuskopioinut turvasanasi, ei sinulla ole mitään huolta.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Vaaditaanko salasana tämän lompakon avaamiseen?';

  @override
  String get restartSetupButton => 'Käynnistä alustus uudelleen';

  @override
  String get scanQrCode => 'Skannaa QR-koodi';

  @override
  String get scanQrCodeError => 'QR-koodin jäsentäminen epäonnistui';

  @override
  String get scanFromImage => 'Skannaa kuvasta';

  @override
  String get toggleFlash => 'Taskulamppu päälle/pois';

  @override
  String get riskDisclosureHeader => 'Ennen kuin aloitat';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet on omahallintoinen (non-custodial) lompakko. Turvasanasi ja yksityiset avaimesi luodaan ja tallennetaan vain tälle laitteelle – emme koskaan näe niitä, emme tallenna niitä millekään palvelimelle emmekä voi palauttaa niitä sinulle.';

  @override
  String get riskDisclosureWarning =>
      'Jos menetät turvasanasi, salasanan nollausta ei ole, eikä mikään tukitiimi voi saada varojasi takaisin. Olet yksin vastuussa niiden turvallisesta säilyttämisestä.';

  @override
  String get riskDisclosureAccept => 'Ymmärrän, jatka';

  @override
  String get secretInfo =>
      'Seuraavalla sivulla näet turvasanasi. Ne ovat salasanasi päästäksesi käsiksi varoihisi. On todella tärkeää, että varmuuskopioit ne etkä ikinä jaa niitä kenellekään.';

  @override
  String get secretInfoHeader => 'Turvallisuus ensin!';

  @override
  String get secretPhrase => 'Turvasanat';

  @override
  String get verifyBackupTitle => 'Vahvista varmuuskopio';

  @override
  String get verifyBackupInstruction =>
      'Valitse oikea sana jokaiseen kohtaan vahvistaaksesi, että olet tallentanut turvasanasi.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Mikä on sana #$index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Ei aivan oikein. Tarkista varmuuskopiosi ja yritä uudelleen.';

  @override
  String get secretPhrase12Words => '12 sanaa';

  @override
  String get secretPhrase24Words => '24 sanaa';

  @override
  String get secretWarning =>
      'Mikäli hävität laitteesi tai poistat sovelluksen, tarvitset turvasanasi palauttaaksesi varasi!';

  @override
  String get securityHeader => 'Turvallisuus';

  @override
  String get securitySettingsBiometrics =>
      'Tunnistaudu päästäksesi tietoturva-asetuksiin';

  @override
  String get securitySettingsPin =>
      'Syötä PIN-koodi päästäksesi tietoturva-asetuksiin';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Allekirjoita viesti';

  @override
  String get signMessageCopySignature => 'Kopioi allekirjoitus';

  @override
  String get signMessageDescription =>
      'Allekirjoita viesti jollakin lompakkosi osoitteista';

  @override
  String get signMessageHint => 'Kirjoita allekirjoitettava viesti';

  @override
  String get signMessageSignatureCopied => 'Allekirjoitus kopioitu';

  @override
  String get signMessageSigned => 'Viesti allekirjoitettu';

  @override
  String get signMessageTooLong => 'Viesti on liian pitkä';

  @override
  String get seedInvalid => 'Seed on virheellinen';

  @override
  String get nodeUnreachable =>
      'Solmuun ei saada yhteyttä. Saldot voivat olla vanhentuneita.';

  @override
  String get nodeUnreachableRetry => 'Yritä uudelleen';

  @override
  String get send => 'Lähetä';

  @override
  String get sendConfirm => 'Lähetä';

  @override
  String get sendError => 'Tapahtui virhe. Yritä uudelleen';

  @override
  String get sendNote => 'VIESTI';

  @override
  String get sendToAddressTitle => 'Vastaanottajalle';

  @override
  String get sendTxProgressDescription => 'Odota kunnes tapahtuma on lähetetty';

  @override
  String get sendTxProgressTitle => 'Lähetetään tapahtumaa';

  @override
  String get sending => 'Lähetä';

  @override
  String get sent => 'Lähetetty';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Aseta salasana';

  @override
  String get setPasswordSuccess => 'Lompakon salasana asetettu';

  @override
  String get setWalletPassword => 'Aseta lompakon salasana';

  @override
  String get settingsHeader => 'Asetukset';

  @override
  String get settingsTransfer => 'Lataa paperilompakosta';

  @override
  String get setupFailedMessage => 'Jokin meni pieleen';

  @override
  String get shareHoosatMobile => 'Jaa Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject =>
      'Käy tutustumassa Hoosat Mobile-lompakkoon';

  @override
  String get shareHoosatMobileText =>
      'Käy tutustumassa Hoosatiin — Hoosat-mobiililompakko.\nVerkkosivusto — hoosatworld.net';

  @override
  String get somethingWentWrong => 'Jokin meni pieleen';

  @override
  String get systemDefault => 'Järjestelmän oletusarvo';

  @override
  String get tapToHide => 'Piilota napauttamalla';

  @override
  String get tapToReveal => 'Tuo esiin napauttamalla';

  @override
  String get themeDark => 'Tumma teema';

  @override
  String get themeHeader => 'Teema';

  @override
  String get themeLight => 'Vaalea teema';

  @override
  String get toggleTheme => 'Vaihda teemaa';

  @override
  String get thisWallet => '#Tämä lompakko';

  @override
  String get to => 'Vastaanottajalle';

  @override
  String get toAddress => 'Osoitteeseen';

  @override
  String get tooManyFailedAttempts => 'Liian monta virheellistä avausyritystä.';

  @override
  String get totalValue => 'Kokonaisarvo';

  @override
  String get transactionId => 'Tapahtuma-ID';

  @override
  String get transactionsUppercase => 'TAPAHTUMAT';

  @override
  String get transfer => 'Siirrä';

  @override
  String get transferClose => 'Sulje ikkuna napauttamalla mihin tahansa.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN onnistuneesti siirretty Hoosat Mobile-lompakkoosi.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Lompakko, joka sisältää $amount HTN havaittu.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Hyväksy varojen siirto napauttamalla Vahvista.\n';

  @override
  String get transferConfirmInfoThird =>
      'Siirto saattaa kestää muutaman sekunnin.';

  @override
  String get transferError =>
      'Siirrossa tapahtui virhe. Yritä myöhemmin uudelleen.';

  @override
  String get transferHeader => 'Siirrä Varat';

  @override
  String transferIntro(String button) {
    return 'Tämä prosessi siirtää varat paperilompakosta Hoosat Mobile-lompakkoosi.\n\nNapauta painiketta \"$button\" aloittaaksesi.';
  }

  @override
  String get transferLoading => 'Siirretään';

  @override
  String get transferManualHint => 'Syötä seed alle.';

  @override
  String get transferNoFunds => 'Tämä seed ei pidä sisällään yhtään Hoosattia';

  @override
  String get transferQrScanError => 'Tämä QR-koodi ei sisällä validia seediä.';

  @override
  String get transferQrScanHint => 'Skannaa Hoosat \nseed tai yksityinen avain';

  @override
  String get unconfirmed => 'vahvistamaton';

  @override
  String get notAccepted => 'ei hyväksytty';

  @override
  String get accepted => 'hyväksytty';

  @override
  String get unknown => 'tuntematon';

  @override
  String get unlock => 'Avaa';

  @override
  String get unlockBiometrics => 'Tunnistaudu avataksesi lompakon';

  @override
  String get unlockPin => 'Syötä PIN-koodi avataksesi lompakon';

  @override
  String get utxosUppercase => 'UTXO:t';

  @override
  String get viewAddress => 'Tarkastele osoitetta';

  @override
  String get viewTransaction => 'Tarkastele tapahtumaa';

  @override
  String get walletAddresses => 'Lompakon osoitteet';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Lompakon nimi';

  @override
  String get walletNameDescription => 'Syötä nimi lompakollesi';

  @override
  String get walletNameHint => 'Lompakon nimi';

  @override
  String get walletSetupAddressDiscovery => 'Osoitehakemisto käynnissä';

  @override
  String get walletSetupMessage => 'Alustetaan lompakkoa';

  @override
  String get walletsTitle => 'Lompakot';

  @override
  String get warning => 'Varoitus';

  @override
  String welcomeMessage(String version) {
    return 'Tervetuloa!\n\nTämä on versio $version Hoosatista - Mobiililompakko Hoosat Networkille';
  }

  @override
  String get welcomeText =>
      'Tervetuloa Hoosatiin. Aloittaaksesi voit luoda uuden lompakon tai tuoda olemassa olevan.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minuutin',
      one: '1 minuutin',
    );
    return '$_temp0 jälkeen';
  }

  @override
  String get yes => 'Kyllä';

  @override
  String get yesButton => 'Kyllä';

  @override
  String get yesUppercase => 'KYLLÄ';

  @override
  String get nodeNotSyncedException => 'Solmua ei ole synkronoitu';

  @override
  String get nodeNoUTXOIndexException => 'Solmulla ei ole UTXO-indeksiä';

  @override
  String get nodeSecureConnection => 'Salattu yhteys';

  @override
  String get hoosatUriInvalid => 'Virheellinen Hoosat-URI';

  @override
  String get compoundUtxos => 'Koosta tapahtumat';

  @override
  String get compoundRequired => 'Yhdistä pienet UTXO:t';

  @override
  String get compoundRequiredDescription =>
      'Sinulla on paljon pieniä käyttämättömiä lähtöjä (UTXO). Yhdistäminen kokoaa ne harvemmiksi ja suuremmiksi UTXO:iksi, jolloin tulevat siirrot ovat nopeampia ja mahdollisesti halvempia. Tämä luo yhden tai useamman transaktion ja aiheuttaa verkkomaksuja.';

  @override
  String get compoundUtxosDescription => 'Yhdistä monet UTXO:t yhdeksi';

  @override
  String get compoundUtxosConfirmation => 'Koostetaanko tapahtumat?';

  @override
  String get compoundingUtxos => 'Koostetaan tapahtumat';

  @override
  String get compoundingMessage => 'Odota...';

  @override
  String get compoundSuccess => 'Koostaminen onnistui';

  @override
  String get compoundFailure => 'Tapahtumien koostaminen epäonnistui';

  @override
  String get fundsStillConfirmingTitle => 'Varat vielä vahvistumassa';

  @override
  String get fundsStillConfirmingBody =>
      'Osa tämän tilin varoista vastaanotettiin liian äskettäin lähetettäväksi – verkko vaatii ensin lyhyen kypsymisajan, yleensä muutaman minuutin. Voit odottaa ja yrittää uudelleen tai lähettää toiselta tililtä, jolla on kypsyneitä varoja.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Vaihda tiliä';

  @override
  String get compoundTooFewUtxos => 'Vaaditaan vähintään kaksi UTXO:ta';

  @override
  String get moveToMain => 'Kerää päätilille';

  @override
  String get moveToMainDescription =>
      'Siirrä kaikkien muiden osoitteiden saldot päätilisi osoitteeseen';

  @override
  String get moveToMainConfirmation => 'Siirretäänkö kaikki päätilille?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Tämä siirtää $amount $symbol $count muusta osoitteesta päätilisi osoitteeseen. Tämä luo yhden tai useamman tapahtuman ja aiheuttaa verkkomaksuja.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Kaikkien osoitteiden saldo on jo päätilillä';

  @override
  String get movingToMain => 'Kerätään päätilille';

  @override
  String get moveToMainSuccess => 'Siirto päätilille onnistui';

  @override
  String get moveToMainFailure => 'Siirto päätilille epäonnistui';

  @override
  String get moveToMainUppercased => 'SIIRRÄ';

  @override
  String get manageAccounts => 'Tilit';

  @override
  String get manageAccountsDescription =>
      'Lisää ja hallitse nimettyjä osoitteita';

  @override
  String get mainAccountLabel => 'Päätili';

  @override
  String get archiveAction => 'Arkistoi';

  @override
  String get restoreAction => 'Palauta';

  @override
  String get archivedAccountsHeader => 'Arkistoidut';

  @override
  String get noAdditionalAccountsYet => 'Ei vielä lisätilejä';

  @override
  String get renameAccount => 'Nimeä tili uudelleen';

  @override
  String get accountLabelHint => 'Tilin nimi';

  @override
  String get saveUppercased => 'TALLENNA';

  @override
  String get addUppercased => 'LISÄÄ';

  @override
  String get sendFromLabel => 'Mistä';

  @override
  String get sendFromAny => 'Mikä tahansa';

  @override
  String get home => 'Koti';

  @override
  String get activity => 'Tapahtumat';

  @override
  String get totalBalance => 'Kokonaissaldo';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Käytettävissä nyt $spendable · Vielä saapumassa $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Vielä saapuvat kolikot ovat sinun, ja ne voi käyttää pian.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Vielä saapuvat kolikot voi käyttää $time kuluttua.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Käytettävissä nyt $amount. Loput voi käyttää $time kuluttua.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Käytettävissä nyt $amount. Loput ovat vielä saapumassa.';
  }

  @override
  String get txTagWaiting => 'odottaa hyväksymistä';

  @override
  String get txTagStatusUnknown => 'tila tuntematon';

  @override
  String get txTagNotAccepted => 'ei hyväksytty';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'vahvistetaan $n / $total';
  }

  @override
  String get submittedTo => 'Lähetetty kohteeseen';

  @override
  String get testConnection => 'Testaa yhteys';

  @override
  String get accountsOtherWalletHeader =>
      'Tallennettu toisesta lompakosta (vain katselu)';

  @override
  String get accountsOtherWalletNote =>
      'Tämä lompakko ei voi käyttää näitä, joten niitä ei lasketa sen kokonaissaldoon. Avaa lompakko, johon ne kuuluvat, käyttääksesi niitä.';

  @override
  String get noActivityTitle => 'Ei vielä tapahtumia';

  @override
  String get txTypeSent => 'Lähetetty';

  @override
  String get txTypeReceived => 'Vastaanotettu';

  @override
  String get txTypeThisWallet => 'Lompakon sisällä';

  @override
  String get txTypeMerged => 'Yhdistetyt kolikot';

  @override
  String get noActivityMessage =>
      'Kun lähetät tai vastaanotat HTN:ää, se näkyy täällä.';

  @override
  String get seeAll => 'Näytä kaikki';

  @override
  String get show => 'Näytä';

  @override
  String get myAccounts => 'Omat tilini';

  @override
  String homeGreeting(String walletName) {
    return 'Hei, $walletName';
  }

  @override
  String get balance => 'Saldo';

  @override
  String get maxSend => 'Maksimilähetys';

  @override
  String get compoundUppercased => 'KOOSTA';

  @override
  String get closeUppercased => 'SULJE';

  @override
  String get scanMoreAddresses => 'Skannaa lisää osoitteita';

  @override
  String get addressDiscovery => 'Osoitteiden löytäminen';

  @override
  String get scanningTitle => 'Skannataan';

  @override
  String get scanningDescription => 'Skannataan uusia osoitteita...';

  @override
  String get scanMore => 'SKANNAA LISÄÄ';

  @override
  String get scanFailedMessage =>
      'Skannaus epäonnistui, yritä uudelleen myöhemmin';

  @override
  String get indexHeader => 'Indeksi';

  @override
  String get currentIndex => 'Nykyinen';

  @override
  String get scannedIndex => 'Skannattu';

  @override
  String get newIndex => 'Uusi';

  @override
  String get addressFilterDialogTitle => 'Osoitteen suodatus';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Näytä kaikki osoitteet';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Näytä osoitteet, joissa saldoa';

  @override
  String get importOption24WordsTitle => 'Tuo 24 turvasanaa';

  @override
  String get importOption24WordsDescription =>
      'Yhteensopiva Cli-lompakon ja Ledgerin kanssa';

  @override
  String get importOption12WordsTitle => 'Tuo 12 turvasanaa';

  @override
  String get importOption12WordsDescription =>
      'Yhteensopiva Web-lompakon ja KDX:n kanssa';

  @override
  String get importOptionStandardWalletTitle => 'Tuo tavallinen lompakko';

  @override
  String get importOptionStandardWalletDescription =>
      'Tavallisella johdolla luodut 12 tai 24 sanan lompakot, valinnaisella BIP39-salasanalauseella';

  @override
  String get importOptionLegacyWalletTitle => 'Tuo vanha lompakko';

  @override
  String get importOptionLegacyWalletDescription =>
      'Vanhalla johdolla luodut 12 sanan lompakot, jotka ovat yhteensopivia vanhan Web Walletin ja KDX:n kanssa';

  @override
  String get importOptionKpubTitle => 'Tuo Watch-seurantalompakko';

  @override
  String get importOptionKpubDescription =>
      'Seuraa lompakon saldoa ja tapahtumia laajennetun julkisen avaimen avulla';

  @override
  String get importKpub => 'Tuo Watch-seurantalompakko';

  @override
  String get importKpubHint => 'Syötä laajennettu julkinen avaimesi.';

  @override
  String get importKpubClipboardError =>
      'Leikepyödän sisältö ei ole validi laajennettu julkinen avain';

  @override
  String get importKpubQrCodeError =>
      'QR-koodi ei sisällä validia laajennettua julkista avainta';

  @override
  String get importKpubInvalidMessage =>
      'Varmista, että syötit laajennetun julkisen avaimesi oikein!';

  @override
  String get receiveAddressListEmpty =>
      'Vastaanottajaosoitteiden lista on tyhjä';

  @override
  String get changeAddressListEmpty => 'Vaihtorahaosoitteiden lista on tyhjä';

  @override
  String get hintAddressListEmpty =>
      'Varmista osoitteiden suodatus oikeasta yläreunasta';

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
  String get changeAddressModeTitle => 'Vaihto-osoitteen toiminta';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Jokainen osoite pitää oman saldonsa, ja vaihtoraha pysyy paikallaan';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Joka kerta käytetään uutta osoitetta (yksityinen, saldo jakautuu)';

  @override
  String get changeAddressModeDialogTitle => 'Vaihto-osoitteen toiminta';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Pidä saldot kullakin osoitteella';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Yksityinen';

  @override
  String get requestPasswordHeader => 'Kysy salasana';

  @override
  String get requestPasswordAtLaunch => 'Käynnistettäessä';

  @override
  String get requestPasswordWhenLocked => 'Lukittuna';

  @override
  String get requestPasswordWhenSigning => 'Allekirjoitettaessa';

  @override
  String get importWalletAdvancedOptions => 'Lisäasetukset';

  @override
  String get bip39Passphrase => 'BIP39-salasanalause';

  @override
  String get bip39PassphraseWarning =>
      'HUOM: Tämä ei ole lompakon salasana. Eri BIP39-salasanalauseet avaavat eri lompakot.';

  @override
  String get bip39PassphraseEnter => 'Syötä salasanalause';

  @override
  String get bip39PassphraseConfirm => 'Vahvista salasanalause';

  @override
  String get bip39PassphraseMismatch => 'Salasanalauseet eivät täsmää!';

  @override
  String get bip39PassphraseNote => 'Lompakko BIP39-salasanalauseella.';

  @override
  String get feePriorityHint => 'Syötä prioriteettitaksa';

  @override
  String get feeBaseUppercase => 'PERUSTAKSA';

  @override
  String get feePriorityUppsercase => 'PRIORITEETTITAKSA';

  @override
  String get feeUpdateAddressError => 'Kohdeosoitetta ei tunnistettu';

  @override
  String get feeUpdateRebuildError =>
      'Tapahtuman uudelleenrakennus epäonnistui';

  @override
  String get feeUpdateRebuildError2 =>
      'Tapahtuman uudelleenrakennus uudella taksalla epäonnistui';

  @override
  String get feeUpdateError => 'Taksan päivitys epäonnistui';

  @override
  String get feeUpdate => 'Päivitä taksa';

  @override
  String get feeUpdateTitle => 'Päivitetään taksaa';

  @override
  String get feeSheetRecommendedPriority => 'Suositellut prioriteettitaksat';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Uuden prioriteettitaksan on oltava vähintään $amount $symbol';
  }

  @override
  String get txPending => 'ODOTTAA';

  @override
  String get txPendingMessage => 'Tämä tapahtuma odottaa';

  @override
  String get txPendingTitle => 'Odottava tapahtuma';

  @override
  String get txPendingContent => 'Mempoolissa on odottavia tapahtumia.';

  @override
  String get txPendingActionUpdateFee => 'Päivitä tapahtuman taksa';

  @override
  String get txPendingActionRbf => 'Korvaa taksalla (RBF)';

  @override
  String get txInMempool => 'mempoolissa';

  @override
  String get utxoSelectionTitle => 'Valitse UTXO:t';

  @override
  String get utxoSelectionHint => 'Valitse lisää UTXO:ita';
}
