// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get account => 'Konto';

  @override
  String get accounts => 'Konti';

  @override
  String get ackBackedUp =>
      'Er du sikker på, at du har sikkerhedskopieret din hemmelige sætning?';

  @override
  String get add => 'Tilføj';

  @override
  String get addAccount => 'Tilføj konto';

  @override
  String get addContact => 'Tilføj Kontakt';

  @override
  String get addNode => 'Tilføj Node';

  @override
  String get addNodeFailed => 'Kunne ikke tilføje Hoosat node';

  @override
  String addNodeFailedMessage(String error) {
    return 'Mislykkedes: $error';
  }

  @override
  String get addNodeSuccess => 'Node tilføjet';

  @override
  String get addingNodeMessage => 'Vent venligst, mens node kontaktes';

  @override
  String get addingNodeTitle => 'Tilføjer Node';

  @override
  String get address => 'Adresse';

  @override
  String get addressCopied => 'Adresse Kopieret';

  @override
  String get addressCopiedFailed => 'Adressen kunne ikke kopieres';

  @override
  String get addressHint => 'Indtast Adresse';

  @override
  String get addressMising => 'Indtast Venligst en Adresse';

  @override
  String get addressShare => 'Del Adresse';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Avanceret';

  @override
  String get amount => 'Beløb';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Beløb $amount $coin';
  }

  @override
  String get amountMissing => 'Indtast venligst et beløb';

  @override
  String get amountZero => 'Beløbet kan ikke være nul';

  @override
  String get areYouSure => 'Er du sikker?';

  @override
  String get authBiometricMessage => 'Godkend for at tilføje pung';

  @override
  String get authMethod => 'Godkendelsesmetode';

  @override
  String get authPinMessage => 'Indtast PIN-koden for at tilføje pung';

  @override
  String get autoLockHeader => 'Lås automatisk';

  @override
  String get available => 'Tilgængelig';

  @override
  String get back => 'Tilbage';

  @override
  String get backupConfirmButton => 'Jeg har lavet en sikkerhedskopi';

  @override
  String get backupSecretPhrase => 'Sikkerhedskopier hemmelig sætning';

  @override
  String get missingSecretPhrase => 'Hemmelig sætning mangler';

  @override
  String get biometricsMethod => 'Biometri';

  @override
  String get blockExplorer => 'Bloker Explorer';

  @override
  String get cancel => 'Annuller';

  @override
  String get change => 'Ændre';

  @override
  String get changeAddress => 'Ændre Adresse';

  @override
  String get changeAddressCopied => 'Skift adresse kopieret';

  @override
  String get changeIndex => 'Ændre index';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Ændre $addressIndex\n ';
  }

  @override
  String get checkCameraPermission => 'Tjek venligst kameratilladelser';

  @override
  String get clipboardEmpty => 'Udklipsholderen er tom';

  @override
  String get close => 'Luk';

  @override
  String get confirm => 'Bekræft';

  @override
  String get confirmPasswordHint => 'Bekræft adgangskode';

  @override
  String confirmations(String confirmations) {
    return '$confirmations bekræftelser';
  }

  @override
  String get confirmed => 'Bekræftet';

  @override
  String get confirmedMaturing => 'bekræftet · modnes';

  @override
  String get confirming => 'Bekræfter';

  @override
  String contactAdded(String contactName) {
    return '$contactName er blevet føjet til kontakter.';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address addresse kopieret\n ';
  }

  @override
  String get contactExists => 'Kontakt eksisterer allerede';

  @override
  String get contactHeader => 'Kontakt';

  @override
  String get contactInvalid => 'Ugyldigt kontaktnavn';

  @override
  String get contactNameHint => 'Indtast et navn @';

  @override
  String get contactNameMissing => 'Vælg et navn til denne kontakt';

  @override
  String contactRemoved(String contactName) {
    return '$contactName er blevet fjernet fra kontakter!';
  }

  @override
  String get contactsHeader => 'Kontakter';

  @override
  String get contactsImportErr => 'Kunne ikke importere kontakter';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'kontakter er $noContacts importeret med succes.';
  }

  @override
  String get copied => 'Kopieret';

  @override
  String get copy => 'Kopier';

  @override
  String get copyAddress => 'Kopiér adresse';

  @override
  String get copyErrorButton => 'Kopieringsfejl';

  @override
  String get createAPasswordHeader => 'Opret en adgangskode.';

  @override
  String get createPasswordFirstParagraph =>
      'Du kan oprette en adgangskode for at tilføje ekstra sikkerhed til din pung.';

  @override
  String get createPasswordHint => 'Opret en adgangskode';

  @override
  String get createPasswordSecondParagraph =>
      'Adgangskoden er valgfri, din pung er beskyttet med din PIN-kode eller biometri alligevel.';

  @override
  String get createPasswordSheetHeader => 'Opret';

  @override
  String get currency => 'Valuta';

  @override
  String get currencyPoweredBy => 'Drevet af CoinGecko';

  @override
  String get defaultAccountName => 'Adresse 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Modtag $addressIndex';
  }

  @override
  String get defaultWalletName => 'Min Pung';

  @override
  String get disablePasswordSheetHeader => 'Deaktiver';

  @override
  String get disablePasswordSuccess => 'Adgangskoden er deaktiveret';

  @override
  String get disableWalletPassword => 'Deaktiver pungens adgangskode';

  @override
  String get doContinue => 'Fortsæt';

  @override
  String get donate => 'Donér';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'Vis ikke igen';

  @override
  String get emptyCardIntroUtxos =>
      'Dette er UTXO fanen. Alle UTXO\'er i din pung vises her';

  @override
  String get emptyResult => 'Tomt resultat';

  @override
  String get emptyWalletName => 'Pungens navn må ikke være tomt';

  @override
  String get encryptionFailedError => 'Kunne ikke ændre pungens adgangskode';

  @override
  String get enterAddress => 'Indtast adresse';

  @override
  String get enterAmount => 'Indtast beløb';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Indtast Node';

  @override
  String get enterPasswordHint => 'Indtast dit kodeord';

  @override
  String get errorMessageCopied => 'Fejlmeddelelse kopieret til udklipsholder';

  @override
  String get exampleCardIntro =>
      'Dette er fanen transaktioner. Når du sender eller modtager en transaktion, vises den her.';

  @override
  String get export => 'Exporter';

  @override
  String get fee => 'Gebyr';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Gebyr $amount $coin\n ';
  }

  @override
  String get feeTitle => 'GEBYR';

  @override
  String get fetchingTransactions => 'Henter transaktioner';

  @override
  String get fingerprintSeedBackup =>
      'Verificer for at sikkerhedskopiere Seed.';

  @override
  String get goBackButton => 'Gå tilbage';

  @override
  String get gotItButton => 'Jeg har forstået!';

  @override
  String get import => 'Importere';

  @override
  String get importSecretPhrase => 'Importer hemmelig sætning';

  @override
  String get importSecretPhraseHint =>
      'Indtast venligst din hemmelige 24-ords sætning nedenfor. Hvert ord skal være adskilt af et mellemrum.';

  @override
  String get importSecretPhraseHintCombo =>
      'Indtast venligst din hemmelige sætning på 12 eller 24 ord nedenfor.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Indtast venligst din hemmelige sætning på 12 ord nedenfor.';

  @override
  String get importWallet => 'Importer tegnebog';

  @override
  String get importWalletDescription => 'Vælg venligst en mulighed nedenfor.';

  @override
  String get instantly => 'Straks';

  @override
  String get insufficientBalance => 'Saldo er utilstrækkelig';

  @override
  String get insufficientBalanceDetails =>
      'Du har ikke nok HTN til denne transaktion';

  @override
  String get invalidAddress => 'Den indtastede adresse er ugyldig';

  @override
  String get invalidAmount => 'Ugyldigt Beløb';

  @override
  String get invalidChecksumMessage =>
      'Tjek venligst, at din hemmelige sætning\ner indtastet korrekt!';

  @override
  String get invalidKpubMessage =>
      'Tjek venligst, at din udvidede offentlige nøgle er indtastet korrekt!';

  @override
  String get invalidDestinationAddress => 'Ugyldig modtager adresse';

  @override
  String get invalidPassword => 'Ugyldig adgangskode';

  @override
  String get hoosatDevFund => 'Hoosat Dev Fund';

  @override
  String get hoosatMobile => 'Hoosat Mobile Pung';

  @override
  String get language => 'Sprog';

  @override
  String get loadingTransactions => 'Indlæser transaktioner...';

  @override
  String get lockAppSetting => 'Verificer ved opstart';

  @override
  String get locked => 'Låst';

  @override
  String get loggingOutMessage => 'Logger ud...';

  @override
  String get logout => 'Log ud';

  @override
  String get logoutDialogContent =>
      'Er du sikker på, at du vil logge ud fra denne pung?';

  @override
  String get logoutOrSwitchWallet => 'Log ud / Skift Pung';

  @override
  String get manage => 'Administrer';

  @override
  String get manualEntry => 'Manuel indtastning';

  @override
  String get networkHeader => 'Netværk';

  @override
  String get newAddress => 'Ny Adresse';

  @override
  String get newWallet => 'Ny Pung';

  @override
  String get nextButton => 'Næste';

  @override
  String get no => 'Nej';

  @override
  String get noContactsExport => 'Der er ingen kontakter at eksportere.';

  @override
  String get noContactsImport => 'Ingen kontakter at importere.';

  @override
  String get noQrCodeFound => 'Ingen QR kode fundet';

  @override
  String get noSkipButton => 'Nej, spring over';

  @override
  String get noUppercase => 'NEJ';

  @override
  String get nodeAddress => 'Hoosat Node';

  @override
  String get nodeDeleteMessage => 'Er du sikker på at du vil slette?';

  @override
  String get nodeDeleteTitle => 'Slet Hoosat Node Opsætning?';

  @override
  String get nodeNameEmpty => 'Node navn kan ikke være tomt';

  @override
  String get nodeNameHint => 'Indtast Node Navn';

  @override
  String get nodeUrlHint => 'Indtast Node URL';

  @override
  String get nodeUrlInvalid => 'Ugyldig node URL';

  @override
  String get nodesSheetTitle => 'Hoosat Noder';

  @override
  String get off => 'Deaktivér';

  @override
  String get on => 'Aktivér';

  @override
  String get paperWallet => 'Papir Pung';

  @override
  String get passwordBlank => 'Adgangskoden kan ikke være tom';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Du har ikke længere brug for en adgangskode for at åbne denne pung.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Denne adgangskode vil blive påkrævet for at åbne denne pung.';

  @override
  String get passwordsDontMatch => 'Adgangskoderne matcher ikke';

  @override
  String get pasteMnemonicError =>
      'Udklipsholder indhold er ikke en gyldig hemmelig sætning';

  @override
  String get pending => 'afventer';

  @override
  String get pinConfirmError => 'PIN-koderne stemmer ikke overens';

  @override
  String get pinConfirmTitle => 'Bekræft din PIN-kode';

  @override
  String get pinCreateTitle => 'Opret en 6-cifret PIN-kode';

  @override
  String get pinEnterTitle => 'Indtast PIN-kode';

  @override
  String get pinInvalid => 'Den indtastede PIN-kode er ugyldig';

  @override
  String get pinMethod => 'PIN-kode';

  @override
  String get pinSeedBackup => 'Indtast PIN-kode for at sikkerhedskopiere Seed';

  @override
  String get preferences => 'Præferencer';

  @override
  String get privacyPolicy => 'Fortrolighedspolitik';

  @override
  String get qrInvalidAddress => 'QR-koden indeholder ikke en gyldig adresse';

  @override
  String get qrInvalidSeed =>
      'QR-koden indeholder ikke et gyldigt Seed eller privat nøgle';

  @override
  String get qrMnemonicError =>
      'QR-koden indeholder ikke en gyldig Tilknytningskode';

  @override
  String get receive => 'Modtag';

  @override
  String get receiveAddress => 'Modtager Adresse';

  @override
  String get receiveAddressCopied => 'Modtager adresse kopieret';

  @override
  String get receiveIndex => 'Modtager index';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Modtag $addressIndex\n ';
  }

  @override
  String get received => 'Modtaget';

  @override
  String get removeContact => 'Fjern kontakt';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Er du sikker på, at du vil slette $contactName?';
  }

  @override
  String get removeWalletAction => 'Fjern Pung';

  @override
  String get removeWalletBiometricsMessage => 'Godkend for at fjerne Pung';

  @override
  String get removeWalletDetail =>
      'Fjernelse af denne pung vil fjerne den hemmelige sætning og alle pungrelaterede data fra denne enhed. Hvis den hemmelige sætning ikke er sikkerhedskopieret, vil du aldrig kunne få adgang til dine penge igen.';

  @override
  String get removeWalletPinMessage => 'Indtast PIN for at Fjerne Pung';

  @override
  String get removeWalletReassurance =>
      'Så længe du har sikkerhedskopieret den hemmelige sætning, har du intet at bekymre dig om.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Kræv en adgangskode for at åbne denne pung?';

  @override
  String get restartSetupButton => 'Genstart opsætning';

  @override
  String get scanQrCode => 'Scan QR-kode';

  @override
  String get scanQrCodeError => 'Kunne ikke parse qr-koden';

  @override
  String get scanFromImage => 'Scan fra billede';

  @override
  String get toggleFlash => 'Tænd/sluk lommelygte';

  @override
  String get riskDisclosureHeader => 'Før du begynder';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet er en ikke-opbevarende (non-custodial) pung. Din hemmelige sætning og dine private nøgler oprettes og gemmes kun på denne enhed – vi ser dem aldrig, gemmer dem ikke på nogen server og kan ikke gendanne dem for dig.';

  @override
  String get riskDisclosureWarning =>
      'Hvis du mister din hemmelige sætning, findes der ingen nulstilling af adgangskode og intet supportteam, der kan få dine midler tilbage. Du er alene ansvarlig for at holde den sikker.';

  @override
  String get riskDisclosureAccept => 'Jeg forstår, fortsæt';

  @override
  String get secretInfo =>
      'På den næste skærm vil du se din hemmelige sætning, som er en adgangskode til dine midler. Det er afgørende, at du sikkerhedskopierer den og aldrig deler den med nogen.';

  @override
  String get secretInfoHeader => 'Sikkerhed frem for alt!';

  @override
  String get secretPhrase => 'Hemmelig Sætning';

  @override
  String get verifyBackupTitle => 'Bekræft din sikkerhedskopi';

  @override
  String get verifyBackupInstruction =>
      'Vælg det rigtige ord for hver position for at bekræfte, at du har gemt din hemmelige sætning.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Hvad er ord nr. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Det er ikke helt rigtigt. Tjek din sikkerhedskopi, og prøv igen.';

  @override
  String get secretPhrase12Words => '12 ord';

  @override
  String get secretPhrase24Words => '24 ord';

  @override
  String get secretWarning =>
      'Hvis du mister din enhed eller afinstallerer appen, skal du bruge din hemmelige sætning for at gendanne dine midler!';

  @override
  String get securityHeader => 'Sikkerhed';

  @override
  String get securitySettingsBiometrics =>
      'Godkend for at få adgang til sikkerhedsindstillinger';

  @override
  String get securitySettingsPin =>
      'Indtast PIN-kode for at få adgang til sikkerhedsindstillinger';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Signér besked';

  @override
  String get signMessageCopySignature => 'Kopiér signatur';

  @override
  String get signMessageDescription =>
      'Signér en besked med en af adresserne i din pung';

  @override
  String get signMessageHint => 'Indtast en besked, der skal signeres';

  @override
  String get signMessageSignatureCopied => 'Signatur kopieret';

  @override
  String get signMessageSigned => 'Beskeden er signeret';

  @override
  String get signMessageTooLong => 'Beskeden er for lang';

  @override
  String get seedInvalid => 'Seed er ugyldigt';

  @override
  String get nodeUnreachable =>
      'Kan ikke nå din node. Saldi kan være forældede.';

  @override
  String get nodeUnreachableRetry => 'Prøv igen';

  @override
  String get send => 'Send';

  @override
  String get sendConfirm => 'Send';

  @override
  String get sendError => 'Der opstod en fejl. Prøv igen senere.';

  @override
  String get sendNote => 'NOTE';

  @override
  String get sendToAddressTitle => 'Til';

  @override
  String get sendTxProgressDescription =>
      'Vent venligst, mens transaktionen sendes';

  @override
  String get sendTxProgressTitle => 'Sender transaktion';

  @override
  String get sending => 'Sender';

  @override
  String get sent => 'Sendt';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Skift adgangskode';

  @override
  String get setPasswordSuccess => 'Adgangskoden er ændret';

  @override
  String get setWalletPassword => 'Angiv Pungens adgangskode';

  @override
  String get settingsHeader => 'Indstillinger';

  @override
  String get settingsTransfer => 'Hent fra Papir Pung';

  @override
  String get setupFailedMessage => 'Noget gik galt';

  @override
  String get shareHoosatMobile => 'Del Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Tjek Hoosat Mobile Pung';

  @override
  String get shareHoosatMobileText =>
      'Tjek Hoosat Mobile - Hoosat Mobil Pung.\nHjemmeside - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Noget gik galt';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get tapToHide => 'Tryk for at skjule';

  @override
  String get tapToReveal => 'Tryk for at vise';

  @override
  String get themeDark => 'Mørkt Tema';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Lyst Tema';

  @override
  String get toggleTheme => 'Skift tema';

  @override
  String get thisWallet => '#Denne Pung';

  @override
  String get to => 'Til';

  @override
  String get toAddress => 'Til Adresse';

  @override
  String get tooManyFailedAttempts => 'For mange oplåsningsforsøg mislykkedes.';

  @override
  String get totalValue => 'Total værdi';

  @override
  String get transactionId => 'Transaktions ID';

  @override
  String get transactionsUppercase => 'TRANSAKTIONER';

  @override
  String get transfer => 'Overførsel';

  @override
  String get transferClose => 'Tryk et vilkårligt sted for at lukke vinduet.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN blev overført til din Hoosat Mobile Pung.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'En Pung med en saldo på $amount HTN er blevet registreret.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Tryk på Bekræft for at overføre midlerne.\n';

  @override
  String get transferConfirmInfoThird =>
      'Overførslen kan tage adskillige sekunder at gennemføre.';

  @override
  String get transferError =>
      'Der opstod en fejl under overførslen. Prøv igen senere.';

  @override
  String get transferHeader => 'Overfør midler';

  @override
  String transferIntro(String button) {
    return 'Denne proces overfører midler fra en papir pung til din Hoosat Mobile pung.\n\nTryk på \"$button\" knappen for at begynde.';
  }

  @override
  String get transferLoading => 'Overfører';

  @override
  String get transferManualHint => 'Indtast Seed nedenfor.';

  @override
  String get transferNoFunds => 'Der er ingen HTN i dette Seed.';

  @override
  String get transferQrScanError =>
      'Denne QR-kode indeholder ikke et gyldigt Seed.';

  @override
  String get transferQrScanHint => 'Scan et Hoosat \nSeed eller privat nøgle';

  @override
  String get unconfirmed => 'ubekræftet';

  @override
  String get notAccepted => 'Ikke accepteret';

  @override
  String get accepted => 'Accepteret';

  @override
  String get unknown => 'Ukendt';

  @override
  String get unlock => 'Lås op';

  @override
  String get unlockBiometrics => 'Verificer for at låse pungen op';

  @override
  String get unlockPin => 'Indtast PIN-koden for at låse Natirum op';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Se Adresse';

  @override
  String get viewTransaction => 'Se Transaktion';

  @override
  String get walletAddresses => 'Pung Adresser';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Pung navn';

  @override
  String get walletNameDescription => 'Indtast et navn til din pung';

  @override
  String get walletNameHint => 'Pung Navn';

  @override
  String get walletSetupAddressDiscovery => 'Kører adresseopdagelse';

  @override
  String get walletSetupMessage => 'Opsætning af pung';

  @override
  String get walletsTitle => 'Punge';

  @override
  String get warning => 'Advarsel';

  @override
  String welcomeMessage(String version) {
    return 'Velkommen!\n\nDette er version $version af Hoosat Mobile - mobilpungen til Hoosat';
  }

  @override
  String get welcomeText =>
      'Velkommen til Hoosat Mobile. For at fortsætte kan du oprette en ny pung eller importere en eksisterende.';

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
    return 'Efter $_temp0\n ';
  }

  @override
  String get yes => 'Ja';

  @override
  String get yesButton => 'Ja';

  @override
  String get yesUppercase => 'JA';

  @override
  String get nodeNotSyncedException => 'Node er ikke synkroniseret';

  @override
  String get nodeNoUTXOIndexException => 'Node har ikke UTXO-indeks';

  @override
  String get nodeSecureConnection => 'Sikker forbindelse';

  @override
  String get hoosatUriInvalid => 'Ugyldig Hoosat URI';

  @override
  String get compoundUtxos => 'Sammensatte transaktioner';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Du har mange små ubrugte outputs (UTXO\'er). Konsolidering vil samle dem til færre, større UTXO\'er, så fremtidige betalinger bliver hurtigere og muligvis med lavere gebyrer. Dette opretter en eller flere transaktioner og medfører netværksgebyrer.';

  @override
  String get compoundUtxosDescription => 'Kombiner flere UTXO\'er til én';

  @override
  String get compoundUtxosConfirmation => 'Sammensatte transaktioner?';

  @override
  String get compoundingUtxos => 'Sammensatte transaktioner';

  @override
  String get compoundingMessage => 'Vent venligst...';

  @override
  String get compoundSuccess => 'Forbindelse vellykket';

  @override
  String get compoundFailure =>
      'Det lykkedes ikke at sammensætte transaktioner';

  @override
  String get fundsStillConfirmingTitle => 'Midlerne bekræftes stadig';

  @override
  String get fundsStillConfirmingBody =>
      'Nogle af midlerne på denne konto blev modtaget for nylig til at kunne sendes endnu – netværket kræver først en kort modningstid, normalt nogle få minutter. Du kan vente og prøve igen eller sende fra en anden konto med modne midler.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Skift konto';

  @override
  String get compoundTooFewUtxos => 'Der kræves mindst to UTXO\'er';

  @override
  String get moveToMain => 'Saml på Hoved';

  @override
  String get moveToMainDescription =>
      'Flyt saldoen fra alle andre adresser til din hovedadresse';

  @override
  String get moveToMainConfirmation => 'Flyt alt til Hoved?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Dette flytter $amount $symbol fra $count andre adresse(r) til din hovedadresse. Der oprettes en eller flere transaktioner, og der opkræves netværksgebyrer.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Saldoen på alle adresser ligger allerede på Hoved';

  @override
  String get movingToMain => 'Samler på Hoved';

  @override
  String get moveToMainSuccess => 'Flytning til Hoved lykkedes';

  @override
  String get moveToMainFailure => 'Kunne ikke flytte til Hoved';

  @override
  String get moveToMainUppercased => 'FLYT';

  @override
  String get manageAccounts => 'Konti';

  @override
  String get manageAccountsDescription =>
      'Tilføj og administrer navngivne adresser';

  @override
  String get mainAccountLabel => 'Hoved';

  @override
  String get archiveAction => 'Arkivér';

  @override
  String get restoreAction => 'Gendan';

  @override
  String get archivedAccountsHeader => 'Arkiveret';

  @override
  String get noAdditionalAccountsYet => 'Ingen yderligere konti endnu';

  @override
  String get renameAccount => 'Omdøb konto';

  @override
  String get accountLabelHint => 'Kontonavn';

  @override
  String get saveUppercased => 'GEM';

  @override
  String get addUppercased => 'TILFØJ';

  @override
  String get sendFromLabel => 'Fra';

  @override
  String get sendFromAny => 'Enhver';

  @override
  String get home => 'Hjem';

  @override
  String get activity => 'Aktivitet';

  @override
  String get totalBalance => 'Samlet saldo';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Kan bruges nu $spendable · Stadig på vej $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Mønter, der stadig er på vej, er dine og kan snart bruges.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'De mønter, der stadig er på vej, kan bruges om $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Kan bruges nu $amount. Resten kan bruges om $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Kan bruges nu $amount. Resten er stadig på vej.';
  }

  @override
  String get txTagWaiting => 'afventer accept';

  @override
  String get txTagStatusUnknown => 'status ukendt';

  @override
  String get txTagNotAccepted => 'ikke accepteret';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'bekræfter $n / $total';
  }

  @override
  String get submittedTo => 'Indsendt til';

  @override
  String get testConnection => 'Test forbindelse';

  @override
  String get accountsOtherWalletHeader =>
      'Gemt fra en anden pung (kun visning)';

  @override
  String get accountsOtherWalletNote =>
      'Denne pung kan ikke bruge dem, så de tæller ikke med i dens total. Åbn den pung, de tilhører, for at bruge dem.';

  @override
  String get noActivityTitle => 'Ingen aktivitet endnu';

  @override
  String get txTypeSent => 'Sendt';

  @override
  String get txTypeReceived => 'Modtaget';

  @override
  String get txTypeThisWallet => 'Inden for pungen';

  @override
  String get txTypeMerged => 'Sammenlagte mønter';

  @override
  String get noActivityMessage =>
      'Når du sender eller modtager HTN, vises det her.';

  @override
  String get seeAll => 'Se alle';

  @override
  String get show => 'Vis';

  @override
  String get myAccounts => 'Mine konti';

  @override
  String homeGreeting(String walletName) {
    return 'Hej, $walletName';
  }

  @override
  String get balance => 'Balance';

  @override
  String get maxSend => 'Max Send';

  @override
  String get compoundUppercased => 'FORBINDELSE';

  @override
  String get closeUppercased => 'LUK';

  @override
  String get scanMoreAddresses => 'Scan for flere adresser';

  @override
  String get addressDiscovery => 'Adresseopdagelse';

  @override
  String get scanningTitle => 'Scanner';

  @override
  String get scanningDescription => 'Scanner efter nye adresser...';

  @override
  String get scanMore => 'SCAN FLERE';

  @override
  String get scanFailedMessage =>
      'Scanning mislykkedes. Prøv venligst igen senere';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Nuværende';

  @override
  String get scannedIndex => 'Scannet';

  @override
  String get newIndex => 'Ny';

  @override
  String get addressFilterDialogTitle => 'Adresse Filter';

  @override
  String get addressFilterDialogOptionAllAddresses => 'Se alle adresser';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Se adresser med balance';

  @override
  String get importOption24WordsTitle => 'Importer 24 ord hemmelig sætning';

  @override
  String get importOption24WordsDescription =>
      'Kompatibel med Cli Wallet og Ledger';

  @override
  String get importOption12WordsTitle => 'Importer 12 ord hemmelig sætning';

  @override
  String get importOption12WordsDescription =>
      'Kompatibel med Web Wallet og KDX';

  @override
  String get importOptionStandardWalletTitle => 'Importér standardpung';

  @override
  String get importOptionStandardWalletDescription =>
      'Punge med 12 eller 24 ord og standardafledning, med valgfri BIP39-adgangssætning';

  @override
  String get importOptionLegacyWalletTitle => 'Importér ældre pung';

  @override
  String get importOptionLegacyWalletDescription =>
      'Punge med 12 ord og ældre afledning, kompatible med den gamle Web Wallet og KDX';

  @override
  String get importOptionKpubTitle => 'Importer se-kun pung';

  @override
  String get importOptionKpubDescription =>
      'Overvåg saldoen og transaktionerne i en pung ved hjælp af en udvidet offentlig nøgle';

  @override
  String get importKpub => 'Importer se-kun pung';

  @override
  String get importKpubHint =>
      'Indtast venligst din udvidede offentlige nøgle.';

  @override
  String get importKpubClipboardError =>
      'Udklipsholderindhold er ikke en gyldig udvidet offentlig nøgle';

  @override
  String get importKpubQrCodeError =>
      'QR-koden indeholder ikke en gyldig udvidet offentlig nøgle';

  @override
  String get importKpubInvalidMessage =>
      'Tjek venligst, at din udvidede offentlige nøgle er indtastet korrekt!';

  @override
  String get receiveAddressListEmpty => 'Modtagelsesadresselisten er tom';

  @override
  String get changeAddressListEmpty => 'Skift adresseliste er tom';

  @override
  String get hintAddressListEmpty =>
      'Tjek adressefilteret fra øverste højre hjørne';

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
  String get changeAddressModeTitle => 'Adfærd for byttepengeadresse';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Hver adresse beholder sin egen saldo, og byttepengene bliver liggende';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Der bruges en ny adresse hver gang (privat, saldoen spredes)';

  @override
  String get changeAddressModeDialogTitle => 'Adfærd for byttepengeadresse';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Behold saldi på hver adresse';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privat';

  @override
  String get requestPasswordHeader => 'Bed om adgangskode';

  @override
  String get requestPasswordAtLaunch => 'Ved start';

  @override
  String get requestPasswordWhenLocked => 'Når låst';

  @override
  String get requestPasswordWhenSigning => 'Ved signering';

  @override
  String get importWalletAdvancedOptions => 'Avancerede indstillinger';

  @override
  String get bip39Passphrase => 'BIP39-adgangssætning';

  @override
  String get bip39PassphraseWarning =>
      'BEMÆRK: Dette er ikke en pungadgangskode; forskellige BIP39-adgangssætninger åbner forskellige punge.';

  @override
  String get bip39PassphraseEnter => 'Indtast adgangssætning';

  @override
  String get bip39PassphraseConfirm => 'Bekræft adgangssætning';

  @override
  String get bip39PassphraseMismatch =>
      'Adgangssætningerne stemmer ikke overens!';

  @override
  String get bip39PassphraseNote => 'Pung med BIP39-adgangssætning.';

  @override
  String get feePriorityHint => 'Indtast prioritetsgebyr';

  @override
  String get feeBaseUppercase => 'BASISGEBYR';

  @override
  String get feePriorityUppsercase => 'PRIORITETSGEBYR';

  @override
  String get feeUpdateAddressError =>
      'Kunne ikke genkende destinationsadressen';

  @override
  String get feeUpdateRebuildError => 'Kunne ikke genopbygge transaktionen';

  @override
  String get feeUpdateRebuildError2 =>
      'Kunne ikke genopbygge transaktionen med det nye gebyr';

  @override
  String get feeUpdateError => 'Kunne ikke opdatere gebyret';

  @override
  String get feeUpdate => 'Opdatér gebyr';

  @override
  String get feeUpdateTitle => 'Opdaterer gebyr';

  @override
  String get feeSheetRecommendedPriority => 'Anbefalede prioritetsgebyrer';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Det nye prioritetsgebyr skal være mindst $amount $symbol';
  }

  @override
  String get txPending => 'AFVENTER';

  @override
  String get txPendingMessage => 'Denne transaktion afventer';

  @override
  String get txPendingTitle => 'Afventende transaktion';

  @override
  String get txPendingContent => 'Der er afventende transaktioner i mempool.';

  @override
  String get txPendingActionUpdateFee => 'Opdatér transaktionsgebyr';

  @override
  String get txPendingActionRbf => 'Erstat med gebyr (RBF)';

  @override
  String get txInMempool => 'i mempool';

  @override
  String get utxoSelectionTitle => 'Vælg UTXO\'er';

  @override
  String get utxoSelectionHint => 'Vælg flere UTXO\'er';
}
