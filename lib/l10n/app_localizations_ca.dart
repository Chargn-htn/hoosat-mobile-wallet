// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get account => 'Compte';

  @override
  String get accounts => 'Comptes';

  @override
  String get ackBackedUp =>
      'N\'estàs segur que has fet una còpia de seguretat de la teva frase secreta o llavor?';

  @override
  String get add => 'Afegir';

  @override
  String get addAccount => 'Afegir compte';

  @override
  String get addContact => 'Afegir contacte';

  @override
  String get addNode => 'Afegir node';

  @override
  String get addNodeFailed => 'Error al afegir node Hoosat';

  @override
  String addNodeFailedMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get addNodeSuccess => 'Node afegit amb èxit';

  @override
  String get addingNodeMessage =>
      'Si us plau, espera mentre es contacta amb el node';

  @override
  String get addingNodeTitle => 'Afegint node';

  @override
  String get address => 'Adreça';

  @override
  String get addressCopied => 'Adreça copiada';

  @override
  String get addressCopiedFailed => 'Failed to copy address';

  @override
  String get addressHint => 'Introduir adreça';

  @override
  String get addressMising => 'Si us plau, introdueix una adreça';

  @override
  String get addressShare => 'Compartir adreça';

  @override
  String get hoosatUriCopied => 'Hoosat URI Copied';

  @override
  String get hoosatUriCopyFailed => 'Failed to copy Hoosat URI';

  @override
  String get advancedHeader => 'Avançat';

  @override
  String get amount => 'Quantitat';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Quantitat $amount $coin';
  }

  @override
  String get amountMissing => 'Si us plau, introdueix una quantitat';

  @override
  String get amountZero => 'La quantitat no pot ser zero';

  @override
  String get areYouSure => 'N\'estàs segur/a?';

  @override
  String get authBiometricMessage => 'Autentica per afegir moneder';

  @override
  String get authMethod => 'Mètode d\'autenticació';

  @override
  String get authPinMessage => 'Introdueix PIN per afegir moneder';

  @override
  String get autoLockHeader => 'Bloqueig automàtic';

  @override
  String get available => 'Disponible';

  @override
  String get back => 'Enrere';

  @override
  String get backupConfirmButton => 'N\'he fet una còpia de seguretat';

  @override
  String get backupSecretPhrase => 'Copiar la frase secreta';

  @override
  String get missingSecretPhrase => 'Falta la frase secreta';

  @override
  String get biometricsMethod => 'Biometria';

  @override
  String get blockExplorer => 'Explorador de blocs';

  @override
  String get cancel => 'Cancel·lar';

  @override
  String get change => 'Canviar';

  @override
  String get changeAddress => 'Canviar adreça';

  @override
  String get changeAddressCopied => 'Canviar adreça copiada';

  @override
  String get changeIndex => 'Canviar Índex';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Canviar $addressIndex';
  }

  @override
  String get checkCameraPermission =>
      'Si us plau, revisa el permís a la càmera';

  @override
  String get clipboardEmpty => 'El porta-retalls està buit';

  @override
  String get close => 'Tancar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get confirmPasswordHint => 'Confirma la contrasenya';

  @override
  String confirmations(String confirmations) {
    return '$confirmations confirmacions';
  }

  @override
  String get confirmed => 'Confirmat';

  @override
  String get confirmedMaturing => 'confirmat · madurant';

  @override
  String get confirming => 'Confirmant';

  @override
  String contactAdded(String contactName) {
    return '$contactName s\'ha afegit als contactes.';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address adreça copiada';
  }

  @override
  String get contactExists => 'El contacte ja existeix';

  @override
  String get contactHeader => 'Contacte';

  @override
  String get contactInvalid => 'Nom de contacte invàlid';

  @override
  String get contactNameHint => 'Introdueix un nom @';

  @override
  String get contactNameMissing => 'Escull un nom per aquest contacte';

  @override
  String contactRemoved(String contactName) {
    return '$contactName s\'ha eliminat dels contactes!';
  }

  @override
  String get contactsHeader => 'Contactes';

  @override
  String get contactsImportErr => 'Error a l\'importar contactes';

  @override
  String contactsImportSuccess(String noContacts) {
    return '$noContacts contactes importats amb èxit.';
  }

  @override
  String get copied => 'Copiat';

  @override
  String get copy => 'Copia';

  @override
  String get copyAddress => 'Copiar adreça';

  @override
  String get copyErrorButton => 'Copiar error';

  @override
  String get createAPasswordHeader => 'Crea una contrasenya.';

  @override
  String get createPasswordFirstParagraph =>
      'Pots establir una contrasenya per afegir protecció addicional al teu moneder.';

  @override
  String get createPasswordHint => 'Crea una contrasenya';

  @override
  String get createPasswordSecondParagraph =>
      'La contrasenya és opcional, el teu moneder estarà protegit amb el PIN o les dades biomètriques.';

  @override
  String get createPasswordSheetHeader => 'Crear';

  @override
  String get currency => 'Moneda';

  @override
  String get currencyPoweredBy => 'Amb tecnologia de CoinGecko';

  @override
  String get defaultAccountName => 'Compte principal';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Compte $addressIndex';
  }

  @override
  String get defaultWalletName => 'El meu moneder';

  @override
  String get disablePasswordSheetHeader => 'Desactivar';

  @override
  String get disablePasswordSuccess => 'La contrasenya s\'ha desactivat';

  @override
  String get disableWalletPassword => 'Desactivar contrasenya del moneder';

  @override
  String get doContinue => 'Continuar';

  @override
  String get donate => 'Fer una donació';

  @override
  String get donateTo => 'Donate To';

  @override
  String get dontShowAgain => 'No mostris més';

  @override
  String get emptyCardIntroUtxos =>
      'Aquesta és la pestanya de UTXOs. Tots els UTXOs del teu moneder apareixeran aquí';

  @override
  String get emptyResult => 'Resultat buit';

  @override
  String get emptyWalletName => 'El nom del moneder no pot quedar buit';

  @override
  String get encryptionFailedError =>
      'Error a l\'establir la contrasenya del moneder';

  @override
  String get enterAddress => 'Introduir adreça';

  @override
  String get enterAmount => 'Introduir quantitat';

  @override
  String get enterFiatValue => 'Enter Fiat Value';

  @override
  String get enterNote => 'Inserir nota';

  @override
  String get enterPasswordHint => 'Introdueix la teva contrasenya';

  @override
  String get errorMessageCopied => 'Missatge d\'error copiat al porta-retalls';

  @override
  String get exampleCardIntro =>
      'Benvingut a Natrium. Un cop hagis rebut HTN, les transaccions apareixeran així:';

  @override
  String get export => 'Exportar';

  @override
  String get fee => 'Comissió';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Comissió $amount $coin';
  }

  @override
  String get feeTitle => 'COMISSIÓ';

  @override
  String get fetchingTransactions => 'Buscant Transaccions';

  @override
  String get fingerprintSeedBackup =>
      'Autentica\'t per copiar la llavor i la frase secreta.';

  @override
  String get goBackButton => 'Tornar';

  @override
  String get gotItButton => 'Ho entenc!';

  @override
  String get import => 'Importar';

  @override
  String get importSecretPhrase => 'Importar frase secreta';

  @override
  String get importSecretPhraseHint =>
      'Si us plau, introdueix la teva frase secreta de 24 paraules a sota. Cada paraula ha d\'estar separada per un espai.';

  @override
  String get importSecretPhraseHintCombo =>
      'Please enter your 12 or 24 word secret phrase below.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Please enter your 12 word secret phrase below.';

  @override
  String get importWallet => 'Importar el moneder';

  @override
  String get importWalletDescription => 'Please select an option below.';

  @override
  String get instantly => 'A l\'instant';

  @override
  String get insufficientBalance => 'Saldo insuficient';

  @override
  String get insufficientBalanceDetails =>
      'No tens suficient HTN per a aquesta transacció';

  @override
  String get invalidAddress => 'L\'adreça introduïda no és vàlida';

  @override
  String get invalidAmount => 'Quantitat incorrecta';

  @override
  String get invalidChecksumMessage =>
      'Si us plau, comprova que la teva Frase secreta\ns\'ha introduït correctament!';

  @override
  String get invalidKpubMessage =>
      'Please check that your extended public key is entered correctly!';

  @override
  String get invalidDestinationAddress => 'Adreça de destí incorrecta';

  @override
  String get invalidPassword => 'Contrasenya no vàlida';

  @override
  String get hoosatDevFund => 'Fons de Desenvolupadors Hoosat';

  @override
  String get hoosatMobile => 'Moneder Hoosat Mobile';

  @override
  String get language => 'Idioma';

  @override
  String get loadingTransactions => 'Carregant Transaccions...';

  @override
  String get lockAppSetting => 'Autenticar-se a l\'inici';

  @override
  String get locked => 'Bloquejat';

  @override
  String get loggingOutMessage => 'Sortint...';

  @override
  String get logout => 'Tancar la sessió';

  @override
  String get logoutDialogContent => 'Segur que vols sortir d\'aquest moneder?';

  @override
  String get logoutOrSwitchWallet => 'Sortir / Canviar de moneder';

  @override
  String get manage => 'Administrar';

  @override
  String get manualEntry => 'Introduir manualment';

  @override
  String get networkHeader => 'Xarxa';

  @override
  String get newAddress => 'Nova adreça';

  @override
  String get newWallet => 'Nou moneder';

  @override
  String get nextButton => 'Següent';

  @override
  String get no => 'No';

  @override
  String get noContactsExport => 'No hi ha contactes per exportar.';

  @override
  String get noContactsImport => 'No hi ha nous contactes per importar.';

  @override
  String get noQrCodeFound => 'No s\'ha trobat el QR';

  @override
  String get noSkipButton => 'No, ometre';

  @override
  String get noUppercase => 'NO';

  @override
  String get nodeAddress => 'Node Hoosat';

  @override
  String get nodeDeleteMessage => 'N\'estàs segur que vols esborrar-ho?';

  @override
  String get nodeDeleteTitle => 'Esborrar la configuració del Node Hoosat?';

  @override
  String get nodeNameEmpty => 'El Nom del Node no pot quedar buit';

  @override
  String get nodeNameHint => 'Introdueix Nom del Node';

  @override
  String get nodeUrlHint => 'Introdueix adreça URL del node';

  @override
  String get nodeUrlInvalid => 'Adreça URL del node incorrecta';

  @override
  String get nodesSheetTitle => 'Nodes Hoosat';

  @override
  String get off => 'Desactivades';

  @override
  String get on => 'Activades';

  @override
  String get paperWallet => 'Moneder de paper';

  @override
  String get passwordBlank => 'La contrasenya no pot estar buida';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Ja no requeriràs una contrasenya per obrir Natrium.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Es requerirà aquesta contrasenya per obrir Natrium.';

  @override
  String get passwordsDontMatch => 'Les contrasenyes no coincideixen';

  @override
  String get pasteMnemonicError =>
      'El contingut del porta-retalls no és una frase secreta correcta';

  @override
  String get pending => 'pendent';

  @override
  String get pinConfirmError => 'Els codis PIN no coincideixen';

  @override
  String get pinConfirmTitle => 'Confirma el teu PIN';

  @override
  String get pinCreateTitle => 'Crea un PIN de 6 dígits';

  @override
  String get pinEnterTitle => 'Introdueix el PIN';

  @override
  String get pinInvalid => 'PIN introduït invàlid';

  @override
  String get pinMethod => 'PIN';

  @override
  String get pinSeedBackup =>
      'Introdueix el PIN per copiar la llavor i la frase secreta';

  @override
  String get preferences => 'Preferències';

  @override
  String get privacyPolicy => 'Política de privadesa';

  @override
  String get qrInvalidAddress => 'El codi QR no conté un destí vàlid';

  @override
  String get qrInvalidSeed =>
      'El codi QR no conté una llavor o clau privada vàlida';

  @override
  String get qrMnemonicError => 'El codi QR no conté una frase secreta vàlida';

  @override
  String get receive => 'Rebre';

  @override
  String get receiveAddress => 'Rebre adreça';

  @override
  String get receiveAddressCopied => 'S\'ha copiat l\'adreça rebuda';

  @override
  String get receiveIndex => 'Rebre Índex';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Rebre $addressIndex';
  }

  @override
  String get received => 'Rebut';

  @override
  String get removeContact => 'Eliminar contacte';

  @override
  String removeContactConfirmation(String contactName) {
    return 'N\'estàs segur que vols eliminar a $contactName?';
  }

  @override
  String get removeWalletAction => 'Esborrar moneder';

  @override
  String get removeWalletBiometricsMessage => 'Autenticar per Esborrar moneder';

  @override
  String get removeWalletDetail =>
      'Al esborrar aquest moneder, s\'esborrarà la frase secreta i totes les dades relacionades amb aquest moneder en aquest dispositiu. Si no tens còpia de la frase secreta, mai més podràs accedir als teus fons.';

  @override
  String get removeWalletPinMessage => 'Introduir PIN per eliminar el moneder';

  @override
  String get removeWalletReassurance =>
      'Sempre que tinguis una còpia de la teva frase secreta, no tens per què preocupar-te';

  @override
  String get requireAPasswordToOpenHeader =>
      'Vols requerir una contrasenya per obrir Natrium?';

  @override
  String get restartSetupButton => 'Reiniciar configuració';

  @override
  String get scanQrCode => 'Escanejar codi QR';

  @override
  String get scanQrCodeError => 'Error al obtenir codi QR';

  @override
  String get scanFromImage => 'Escaneja des d\'una imatge';

  @override
  String get toggleFlash => 'Activa/desactiva la llanterna';

  @override
  String get riskDisclosureHeader => 'Abans de començar';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet és un moneder no custodial. La teva frase secreta i les teves claus privades es generen i s\'emmagatzemen només en aquest dispositiu: mai no les veiem, no les desem en cap servidor i no podem recuperar-les per tu.';

  @override
  String get riskDisclosureWarning =>
      'Si perds la teva frase secreta, no hi ha cap restabliment de contrasenya ni cap equip de suport que pugui recuperar els teus fons. Ets l\'únic responsable de mantenir-la segura.';

  @override
  String get riskDisclosureAccept => 'Ho entenc, continua';

  @override
  String get secretInfo =>
      'En la següent pantalla, veuràs una frase secreta. És una contrasenya per accedir als teus fons. És crucial que en facis una còpia de seguretat i no la comparteixis amb ningú.';

  @override
  String get secretInfoHeader => 'Seguretat abans que res!';

  @override
  String get secretPhrase => 'Frase secreta';

  @override
  String get verifyBackupTitle => 'Verifica la còpia de seguretat';

  @override
  String get verifyBackupInstruction =>
      'Selecciona la paraula correcta per a cada posició per confirmar que has desat la teva frase secreta.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Quina és la paraula núm. $index?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'No és del tot correcte. Revisa la còpia de seguretat i torna-ho a provar.';

  @override
  String get secretPhrase12Words => '12 paraules';

  @override
  String get secretPhrase24Words => '24 paraules';

  @override
  String get secretWarning =>
      'Si perds el teu dispositiu o desinstal·les l\'aplicació, necessitaràs la teva frase secreta o llavor per recuperar els teus fons!';

  @override
  String get securityHeader => 'Seguretat';

  @override
  String get securitySettingsBiometrics =>
      'Autentica\'t per accedir a la configuració de seguretat';

  @override
  String get securitySettingsPin =>
      'Introdueix el PIN per accedir a la configuració de seguretat';

  @override
  String get seed => 'Seed';

  @override
  String get signMessage => 'Signa el missatge';

  @override
  String get signMessageCopySignature => 'Copia la signatura';

  @override
  String get signMessageDescription =>
      'Signa un missatge amb una de les adreces del teu moneder';

  @override
  String get signMessageHint => 'Introdueix un missatge per signar';

  @override
  String get signMessageSignatureCopied => 'Signatura copiada';

  @override
  String get signMessageSigned => 'Missatge signat';

  @override
  String get signMessageTooLong => 'El missatge és massa llarg';

  @override
  String get seedInvalid => 'Llavor no vàlida';

  @override
  String get nodeUnreachable =>
      'No es pot connectar amb el teu node. Els saldos poden estar desactualitzats.';

  @override
  String get nodeUnreachableRetry => 'Torna-ho a provar';

  @override
  String get send => 'Enviar';

  @override
  String get sendConfirm => 'Enviar';

  @override
  String get sendError => 'S\'ha produït un error. Intenta-ho més tard.';

  @override
  String get sendNote => 'NOTA';

  @override
  String get sendToAddressTitle => 'A';

  @override
  String get sendTxProgressDescription =>
      'Si us plau, espera mentres la transacció s\'envia';

  @override
  String get sendTxProgressTitle => 'Enviant transacció';

  @override
  String get sending => 'Enviar';

  @override
  String get sent => 'Enviat';

  @override
  String get sentTo => 'Sent to';

  @override
  String get setPassword => 'Establir contrasenya';

  @override
  String get setPasswordSuccess => 'Contrasenya establerta amb èxit';

  @override
  String get setWalletPassword => 'Establir contrasenya del moneder';

  @override
  String get settingsHeader => 'Configuració';

  @override
  String get settingsTransfer => 'Carregar des d\'un moneder de paper';

  @override
  String get setupFailedMessage => 'Hi ha hagut un error';

  @override
  String get shareHoosatMobile => 'Compartir Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject => 'Veure el moneder de Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Mira Hoosat Mobile - Hoosat Moneder Mòbil.\nWeb - hoosatworld.net';

  @override
  String get somethingWentWrong => 'Hi ha hagut un error';

  @override
  String get systemDefault => 'Predeterminat del sistema';

  @override
  String get tapToHide => 'Prem per amagar';

  @override
  String get tapToReveal => 'Prem per mostrar';

  @override
  String get themeDark => 'Tema fosc';

  @override
  String get themeHeader => 'Tema';

  @override
  String get themeLight => 'Tema clar';

  @override
  String get toggleTheme => 'Canvia el tema';

  @override
  String get thisWallet => '#Aquest moneder';

  @override
  String get to => 'A';

  @override
  String get toAddress => 'A Adreça';

  @override
  String get tooManyFailedAttempts => 'Massa intents de desbloqueig fallits.';

  @override
  String get totalValue => 'Valor Total';

  @override
  String get transactionId => 'ID de la transacció';

  @override
  String get transactionsUppercase => 'TRANSACCIONS';

  @override
  String get transfer => 'Transferir';

  @override
  String get transferClose => 'Prem a qualsevol lloc per tancar la finestra.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN han estat transferits amb èxit al teu moneder Natrium.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'S\'ha detectat un moneder amb un saldo de $amount HTN.\n';
  }

  @override
  String get transferConfirmInfoSecond =>
      'La transferència pot tardar uns quants segons a completar-se.\n';

  @override
  String get transferConfirmInfoThird =>
      'La transferència pot tardar uns quants segons a completar-se.';

  @override
  String get transferError =>
      'S\'ha produït un error en la transferència. Si us plau, intenta-ho més tard.';

  @override
  String get transferHeader => 'Transferir fons';

  @override
  String transferIntro(String button) {
    return 'Aquest procés transferirà els fons des d\'un moneder de paper al teu moneder Natrium.\n\nPrem el botó \"$button\" per començar.';
  }

  @override
  String get transferLoading => 'Transferint';

  @override
  String get transferManualHint => 'Si us plau, introdueix la llavor a sota.';

  @override
  String get transferNoFunds => 'Aquesta llavor no conté cap HTN';

  @override
  String get transferQrScanError =>
      'Aquest codi QR no conté una llavor vàlida.';

  @override
  String get transferQrScanHint => 'Escaneja una llavor\no clau privada Hoosat';

  @override
  String get unconfirmed => 'sense confirmar';

  @override
  String get notAccepted => 'not accepted';

  @override
  String get accepted => 'accepted';

  @override
  String get unknown => 'desconegut';

  @override
  String get unlock => 'Desbloquejar';

  @override
  String get unlockBiometrics => 'Autentica\'t per desbloquejar Natrium';

  @override
  String get unlockPin => 'Introdueix el PIN per desbloquejar Natrium';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Veure Adreça';

  @override
  String get viewTransaction => 'Veure Transacció';

  @override
  String get walletAddresses => 'Adreces del moneder';

  @override
  String get walletAddress => 'Wallet Address';

  @override
  String get walletName => 'Nom del moneder';

  @override
  String get walletNameDescription => 'Introdueix un nom pel teu moneder';

  @override
  String get walletNameHint => 'Nom del moneder';

  @override
  String get walletSetupAddressDiscovery => 'Executant Descobriment d\'Adreces';

  @override
  String get walletSetupMessage => 'Configurant moneder';

  @override
  String get walletsTitle => 'Moneders';

  @override
  String get warning => 'Advertència';

  @override
  String welcomeMessage(String version) {
    return 'Benvingut/uda!\n\nAquesta és la versió $version de Hoosat Mobile - el moneder mòbil per Hoosat';
  }

  @override
  String get welcomeText =>
      'Benvingut a Natrium. Per començar, pots crear un nou moneder o importar-ne un d\'existent.';

  @override
  String xMinutes(int minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minuts',
      one: '1 minut',
    );
    return 'Després de $_temp0';
  }

  @override
  String get yes => 'Sí';

  @override
  String get yesButton => 'Sí';

  @override
  String get yesUppercase => 'SÍ';

  @override
  String get nodeNotSyncedException => 'El node no està sincronitzat';

  @override
  String get nodeNoUTXOIndexException => 'El node no té índex UTXO';

  @override
  String get nodeSecureConnection => 'Connexió segura';

  @override
  String get hoosatUriInvalid => 'Invalid Hoosat URI';

  @override
  String get compoundUtxos => 'Compound transactions';

  @override
  String get compoundRequired => 'Compound required';

  @override
  String get compoundRequiredDescription =>
      'Tens moltes sortides no gastades petites (UTXO). La consolidació les unirà en menys UTXO més grans perquè els enviaments futurs siguin més ràpids i possiblement amb comissions més baixes. Això crea una o més transaccions i comporta comissions de xarxa.';

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
  String get fundsStillConfirmingTitle => 'Els fons encara s\'estan confirmant';

  @override
  String get fundsStillConfirmingBody =>
      'Alguns fons d\'aquest compte es van rebre fa massa poc per enviar-los encara: la xarxa exigeix primer una breu espera de maduració, normalment uns minuts. Pots esperar i tornar-ho a provar, o enviar des d\'un altre compte que tingui fons madurs.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Canvia de compte';

  @override
  String get compoundTooFewUtxos => 'At least two UTXOs are required';

  @override
  String get moveToMain => 'Reuneix a Principal';

  @override
  String get moveToMainDescription =>
      'Trasllada el saldo de totes les altres adreces a la teva adreça principal';

  @override
  String get moveToMainConfirmation => 'Vols moure-ho tot a Principal?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Això mourà $amount $symbol de $count altra/es adreça/es a la teva adreça principal. Es crearan una o més transaccions i s\'aplicaran comissions de xarxa.';
  }

  @override
  String get moveToMainNothingToMove =>
      'El saldo de totes les adreces ja és a Principal';

  @override
  String get movingToMain => 'Reunint a Principal';

  @override
  String get moveToMainSuccess => 'Trasllat a Principal completat';

  @override
  String get moveToMainFailure => 'No s\'ha pogut traslladar a Principal';

  @override
  String get moveToMainUppercased => 'MOU';

  @override
  String get manageAccounts => 'Comptes';

  @override
  String get manageAccountsDescription => 'Afegeix i gestiona adreces amb nom';

  @override
  String get mainAccountLabel => 'Principal';

  @override
  String get archiveAction => 'Arxiva';

  @override
  String get restoreAction => 'Restaura';

  @override
  String get archivedAccountsHeader => 'Arxivats';

  @override
  String get noAdditionalAccountsYet => 'Encara no hi ha comptes addicionals';

  @override
  String get renameAccount => 'Canvia el nom del compte';

  @override
  String get accountLabelHint => 'Nom del compte';

  @override
  String get saveUppercased => 'DESA';

  @override
  String get addUppercased => 'AFEGEIX';

  @override
  String get sendFromLabel => 'Des de';

  @override
  String get sendFromAny => 'Qualsevol';

  @override
  String get home => 'Inici';

  @override
  String get activity => 'Activitat';

  @override
  String get totalBalance => 'Saldo total';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Disponible ara $spendable · Encara arribant $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Les monedes que encara arriben són teves i aviat es podran gastar.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Les monedes que encara arriben es podran gastar d\'aquí a $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Disponible ara $amount. La resta es podrà gastar d\'aquí a $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Disponible ara $amount. La resta encara està arribant.';
  }

  @override
  String get txTagWaiting => 'esperant ser acceptada';

  @override
  String get txTagStatusUnknown => 'estat desconegut';

  @override
  String get txTagNotAccepted => 'no acceptada';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'confirmant $n / $total';
  }

  @override
  String get submittedTo => 'Enviat a';

  @override
  String get testConnection => 'Prova la connexió';

  @override
  String get accountsOtherWalletHeader =>
      'Desats d\'un altre moneder (només visualització)';

  @override
  String get accountsOtherWalletNote =>
      'Aquest moneder no els pot gastar, per això no es compten al seu total. Obre el moneder al qual pertanyen per utilitzar-los.';

  @override
  String get noActivityTitle => 'Encara no hi ha activitat';

  @override
  String get txTypeSent => 'Enviat';

  @override
  String get txTypeReceived => 'Rebut';

  @override
  String get txTypeThisWallet => 'Dins del moneder';

  @override
  String get txTypeMerged => 'Monedes combinades';

  @override
  String get noActivityMessage => 'Quan enviïs o rebis HTN, apareixerà aquí.';

  @override
  String get seeAll => 'Mostra-ho tot';

  @override
  String get show => 'Mostra';

  @override
  String get myAccounts => 'Els meus comptes';

  @override
  String homeGreeting(String walletName) {
    return 'Hola, $walletName';
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
  String get importOptionStandardWalletTitle => 'Importa un moneder estàndard';

  @override
  String get importOptionStandardWalletDescription =>
      'Moneders de 12 o 24 paraules amb derivació estàndard i frase de pas BIP39 opcional';

  @override
  String get importOptionLegacyWalletTitle => 'Importa un moneder antic';

  @override
  String get importOptionLegacyWalletDescription =>
      'Moneders de 12 paraules amb derivació antiga, compatibles amb l\'antic Web Wallet i KDX';

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
  String get changeAddressModeTitle => 'Comportament de l\'adreça de canvi';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Cada adreça conserva el seu propi saldo i el canvi es queda al mateix lloc';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Cada vegada s\'utilitza una adreça nova (privat, el saldo es reparteix)';

  @override
  String get changeAddressModeDialogTitle =>
      'Comportament de l\'adreça de canvi';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Mantén els saldos a cada adreça';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privat';

  @override
  String get requestPasswordHeader => 'Sol·licita la contrasenya';

  @override
  String get requestPasswordAtLaunch => 'En iniciar';

  @override
  String get requestPasswordWhenLocked => 'Quan està bloquejat';

  @override
  String get requestPasswordWhenSigning => 'En signar';

  @override
  String get importWalletAdvancedOptions => 'Opcions avançades';

  @override
  String get bip39Passphrase => 'Frase de pas BIP39';

  @override
  String get bip39PassphraseWarning =>
      'NOTA: Això no és una contrasenya del moneder; diferents frases de pas BIP39 obren moneders diferents.';

  @override
  String get bip39PassphraseEnter => 'Introdueix la frase de pas';

  @override
  String get bip39PassphraseConfirm => 'Confirma la frase de pas';

  @override
  String get bip39PassphraseMismatch => 'Les frases de pas no coincideixen!';

  @override
  String get bip39PassphraseNote => 'Moneder amb frase de pas BIP39.';

  @override
  String get feePriorityHint => 'Introdueix la comissió de prioritat';

  @override
  String get feeBaseUppercase => 'COMISSIÓ BASE';

  @override
  String get feePriorityUppsercase => 'COMISSIÓ DE PRIORITAT';

  @override
  String get feeUpdateAddressError =>
      'No s\'ha pogut reconèixer l\'adreça de destinació';

  @override
  String get feeUpdateRebuildError =>
      'No s\'ha pogut reconstruir la transacció';

  @override
  String get feeUpdateRebuildError2 =>
      'No s\'ha pogut reconstruir la transacció amb la nova comissió';

  @override
  String get feeUpdateError => 'No s\'ha pogut actualitzar la comissió';

  @override
  String get feeUpdate => 'Actualitza la comissió';

  @override
  String get feeUpdateTitle => 'Actualitzant la comissió';

  @override
  String get feeSheetRecommendedPriority =>
      'Comissions de prioritat recomanades';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'La nova comissió de prioritat ha de ser com a mínim $amount $symbol';
  }

  @override
  String get txPending => 'PENDENT';

  @override
  String get txPendingMessage => 'Aquesta transacció està pendent';

  @override
  String get txPendingTitle => 'Transacció pendent';

  @override
  String get txPendingContent => 'Hi ha transaccions pendents al mempool.';

  @override
  String get txPendingActionUpdateFee =>
      'Actualitza la comissió de la transacció';

  @override
  String get txPendingActionRbf => 'Substitueix per comissió (RBF)';

  @override
  String get txInMempool => 'al mempool';

  @override
  String get utxoSelectionTitle => 'Selecciona UTXO';

  @override
  String get utxoSelectionHint => 'Selecciona més UTXO';
}
