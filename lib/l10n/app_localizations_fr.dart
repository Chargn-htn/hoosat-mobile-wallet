// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get account => 'Compte';

  @override
  String get accounts => 'Comptes';

  @override
  String get ackBackedUp =>
      'Êtes-vous sûr de bien avoir correctement sauvegardé votre phrase secrète ?';

  @override
  String get add => 'Ajouter';

  @override
  String get addAccount => 'Ajouter un compte';

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get addNode => 'Ajouter un nœud';

  @override
  String get addNodeFailed => 'Échec de l\'ajout du nœud Hoosat';

  @override
  String addNodeFailedMessage(String error) {
    return 'Erreur: $error';
  }

  @override
  String get addNodeSuccess => 'Nœud ajouté avec succès';

  @override
  String get addingNodeMessage =>
      'Veuillez patienter pendant que le nœud est contacté';

  @override
  String get addingNodeTitle => 'Ajout du nœud en cours';

  @override
  String get address => 'Adresse';

  @override
  String get addressCopied => 'Adresse copiée';

  @override
  String get addressCopiedFailed => 'La copie de l\'adresse à échoué';

  @override
  String get addressHint => 'Entrez une adresse';

  @override
  String get addressMising => 'Veuillez entrer une adresse de destination';

  @override
  String get addressShare => 'Partager l\'adresse';

  @override
  String get hoosatUriCopied => 'URI Hoosat copiée';

  @override
  String get hoosatUriCopyFailed => 'Échec de la copie de l\'URI Hoosat';

  @override
  String get advancedHeader => 'Avancé';

  @override
  String get amount => 'Montant';

  @override
  String amountConfirm(String amount, String coin) {
    return 'Montant $amount $coin';
  }

  @override
  String get amountMissing => 'Veuillez entrer un montant';

  @override
  String get amountZero => 'Le montant ne peut pas être nul';

  @override
  String get areYouSure => 'Êtes-vous sûr ?';

  @override
  String get authBiometricMessage =>
      'Authentifiez-vous pour ajouter un portefeuille';

  @override
  String get authMethod => 'Méthode d’authentification';

  @override
  String get authPinMessage =>
      'Entrez votre code PIN pour ajouter un portefeuille';

  @override
  String get autoLockHeader => 'Verrouillage automatique';

  @override
  String get available => 'Disponible';

  @override
  String get back => 'Retour';

  @override
  String get backupConfirmButton => 'Je l\'ai sauvegardé';

  @override
  String get backupSecretPhrase => 'Sauvegarder la phrase secrète';

  @override
  String get missingSecretPhrase => 'Phrase secrète manquante';

  @override
  String get biometricsMethod => 'Biométrie';

  @override
  String get blockExplorer => 'Explorateur de blocs';

  @override
  String get cancel => 'Annuler';

  @override
  String get change => 'Changer';

  @override
  String get changeAddress => 'Adresse';

  @override
  String get changeAddressCopied => 'Adresse copiée';

  @override
  String get changeIndex => 'Changer l\'index';

  @override
  String changeIndexParam(String addressIndex) {
    return 'Changer $addressIndex';
  }

  @override
  String get checkCameraPermission =>
      'Merci de vérifier les permissions de l\'appareil photo';

  @override
  String get clipboardEmpty => 'Le presse-papier est vide';

  @override
  String get close => 'Fermer';

  @override
  String get confirm => 'Confirmer';

  @override
  String get confirmPasswordHint => 'Confirmer le mot de passe';

  @override
  String confirmations(String confirmations) {
    return '$confirmations confirmations';
  }

  @override
  String get confirmed => 'confirmé';

  @override
  String get confirmedMaturing => 'confirmé · en maturation';

  @override
  String get confirming => 'en cours de confirmation';

  @override
  String contactAdded(String contactName) {
    return '$contactName a été ajouté aux contacts !';
  }

  @override
  String contactAddressCopied(String address) {
    return '$address adresse copiée';
  }

  @override
  String get contactExists => 'Ce contact existe déjà';

  @override
  String get contactHeader => 'Contact';

  @override
  String get contactInvalid => 'Nom du contact erroné';

  @override
  String get contactNameHint => 'Entrez un nom @';

  @override
  String get contactNameMissing => 'Choisir un nom pour ce contact';

  @override
  String contactRemoved(String contactName) {
    return '$contactName a été supprimé de vos contacts !';
  }

  @override
  String get contactsHeader => 'Contacts';

  @override
  String get contactsImportErr => 'Échec de l\'importation des contacts';

  @override
  String contactsImportSuccess(String noContacts) {
    return 'Import de $noContacts contacts réussi';
  }

  @override
  String get copied => 'Copié';

  @override
  String get copy => 'Copier';

  @override
  String get copyAddress => 'Copier l’adresse';

  @override
  String get copyErrorButton => 'Erreur de copie';

  @override
  String get createAPasswordHeader => 'Créer un mot de passe.';

  @override
  String get createPasswordFirstParagraph =>
      'Vous pouvez créer un mot de passe pour améliorer la sécurité de votre portefeuille.';

  @override
  String get createPasswordHint => 'Créer un mot de passe';

  @override
  String get createPasswordSecondParagraph =>
      'Le mot de passe est optionnel, votre portefeuille sera néanmoins protégé par votre code PIN ou vos données biométriques.';

  @override
  String get createPasswordSheetHeader => 'Créer';

  @override
  String get currency => 'Devise';

  @override
  String get currencyPoweredBy => 'Propulsé par CoinGecko';

  @override
  String get defaultAccountName => 'Adresse 1';

  @override
  String defaultNewAccountName(int addressIndex) {
    return 'Adresse de réception $addressIndex';
  }

  @override
  String get defaultWalletName => 'Mon portefeuille';

  @override
  String get disablePasswordSheetHeader => 'Désactiver';

  @override
  String get disablePasswordSuccess => 'Mot de passe désactivé';

  @override
  String get disableWalletPassword =>
      'Désactiver le mot de passe du portefeuille';

  @override
  String get doContinue => 'Continuer';

  @override
  String get donate => 'Faire un don';

  @override
  String get donateTo => 'Faire un don à';

  @override
  String get dontShowAgain => 'Ne plus afficher';

  @override
  String get emptyCardIntroUtxos =>
      'Ceci est l\'onglet des UTXOs. Tous les UTXOs de votre portefeuille apparaîtront ici';

  @override
  String get emptyResult => 'Résultat vide';

  @override
  String get emptyWalletName => 'Le nom du portefeuille ne peut pas être vide';

  @override
  String get encryptionFailedError =>
      'La définition du mot de passe de portefeuille à échouée';

  @override
  String get enterAddress => 'Entrez l’adresse';

  @override
  String get enterAmount => 'Entrez le montant';

  @override
  String get enterFiatValue => 'Entrez la valeur Fiat';

  @override
  String get enterNote => 'Entrez une note';

  @override
  String get enterPasswordHint => 'Entrez votre mot de passe';

  @override
  String get errorMessageCopied =>
      'Le message d\'erreur à été copié dans le presse-papier';

  @override
  String get exampleCardIntro =>
      'Ceci est le volet de transactions. Lorsque vous recevrez ou enverrez des HTN, les transactions apparaîtront ici.';

  @override
  String get export => 'Exporter';

  @override
  String get fee => 'Frais';

  @override
  String feeConfirm(String amount, String coin) {
    return 'Frais $amount $coin';
  }

  @override
  String get feeTitle => 'FRAIS';

  @override
  String get fetchingTransactions => 'Récupération des transactions';

  @override
  String get fingerprintSeedBackup =>
      'Veuillez vous authentifier pour sauvegarder la phrase secrète.';

  @override
  String get goBackButton => 'Retour';

  @override
  String get gotItButton => 'J\'ai compris !';

  @override
  String get import => 'Importer';

  @override
  String get importSecretPhrase => 'Importer une phrase secrète';

  @override
  String get importSecretPhraseHint =>
      'Veuillez entrer votre phrase secrète de 24 mots ci-dessous.';

  @override
  String get importSecretPhraseHintCombo =>
      'Veuillez entrer votre phrase secrète de 12 ou 24 mots ci-dessous.';

  @override
  String get importSecretPhraseHintLegacy =>
      'Veuillez entrer votre passe phrase de 12 mots ci-dessous.';

  @override
  String get importWallet => 'Importer un portefeuille';

  @override
  String get importWalletDescription =>
      'Veuillez sélectionner une option ci-dessous.';

  @override
  String get instantly => 'Instantanément';

  @override
  String get insufficientBalance => 'Solde insuffisant';

  @override
  String get insufficientBalanceDetails =>
      'Vous n\'avez pas assez de HTN pour cette transaction';

  @override
  String get invalidAddress => 'L\'adresse saisie est invalide';

  @override
  String get invalidAmount => 'Montant invalide';

  @override
  String get invalidChecksumMessage =>
      'Merci de vérifier que votre phrase secrète\nest correcte !';

  @override
  String get invalidKpubMessage =>
      'Merci de vérifier que la clé publique étendue renseignée soit correcte!';

  @override
  String get invalidDestinationAddress => 'Adresse du destinataire invalide';

  @override
  String get invalidPassword => 'Mot de passe invalide';

  @override
  String get hoosatDevFund => 'Fond de développement Hoosat';

  @override
  String get hoosatMobile => 'Portefeuille Hoosat Mobile';

  @override
  String get language => 'Langue';

  @override
  String get loadingTransactions => 'Chargement des transactions...';

  @override
  String get lockAppSetting => 'S\'authentifier au démarrage';

  @override
  String get locked => 'Verrouillé';

  @override
  String get loggingOutMessage => 'Déconnexion...';

  @override
  String get logout => 'Déconnexion';

  @override
  String get logoutDialogContent =>
      'Êtes-vous sur de vouloir vous déconnecter de ce portefeuille ?';

  @override
  String get logoutOrSwitchWallet => 'Déconnecter / Changer de portefeuille';

  @override
  String get manage => 'Gérer';

  @override
  String get manualEntry => 'Saisie manuelle';

  @override
  String get networkHeader => 'Réseau';

  @override
  String get newAddress => 'Ajouter une nouvelle adresse';

  @override
  String get newWallet => 'Nouveau portefeuille';

  @override
  String get nextButton => 'Suivant';

  @override
  String get no => 'Non';

  @override
  String get noContactsExport => 'Il n’y a pas de contacts à exporter';

  @override
  String get noContactsImport => 'Aucun nouveau contact à importer';

  @override
  String get noQrCodeFound => 'QR Code introuvable';

  @override
  String get noSkipButton => 'Passer';

  @override
  String get noUppercase => 'NON';

  @override
  String get nodeAddress => 'Nœud Hoosat';

  @override
  String get nodeDeleteMessage => 'Êtes-vous sûr de vouloir supprimer ?';

  @override
  String get nodeDeleteTitle => 'Supprimer la configuration du nœud Hoosat ?';

  @override
  String get nodeNameEmpty => 'Le nom du nœud ne peux pas être vide';

  @override
  String get nodeNameHint => 'Entrez un nom de nœud';

  @override
  String get nodeUrlHint => 'Entrez une URL de nœud';

  @override
  String get nodeUrlInvalid => 'URL du nœud invalide';

  @override
  String get nodesSheetTitle => 'Nœuds Hoosat';

  @override
  String get off => 'Désactivé';

  @override
  String get on => 'Activé';

  @override
  String get paperWallet => 'Portefeuille papier';

  @override
  String get passwordBlank => 'Le mot de passe ne peut être vide';

  @override
  String get passwordNoLongerRequiredToOpenParagraph =>
      'Vous n\'aurez plus besoin de mot de passe pour ouvrir ce portefeuille.';

  @override
  String get passwordWillBeRequiredToOpenParagraph =>
      'Ce mot passe vous sera demandé pour ouvrir ce portefeuille.';

  @override
  String get passwordsDontMatch => 'Les mots de passe sont différents';

  @override
  String get pasteMnemonicError =>
      'Le contenu du presse-papier n\'est pas une phrase secrète valide';

  @override
  String get pending => 'En attente';

  @override
  String get pinConfirmError => 'Les PINs ne correspondent pas';

  @override
  String get pinConfirmTitle => 'Confirmer votre code PIN';

  @override
  String get pinCreateTitle => 'Créer un code PIN à 6 chiffres';

  @override
  String get pinEnterTitle => 'Entrez le code PIN';

  @override
  String get pinInvalid => 'Code PIN saisi invalide';

  @override
  String get pinMethod => 'Code PIN';

  @override
  String get pinSeedBackup =>
      'Entrez le code PIN pour voir votre phrase secrète';

  @override
  String get preferences => 'Préférences';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get qrInvalidAddress =>
      'Le QR code ne contient pas de d\'adresse valide';

  @override
  String get qrInvalidSeed =>
      'Le QR code ne contient pas de phrase secrète ou de clé privée valide ';

  @override
  String get qrMnemonicError =>
      'Le QR code ne contient pas de phrase secrète valide.';

  @override
  String get receive => 'Recevoir';

  @override
  String get receiveAddress => 'Adresse de réception';

  @override
  String get receiveAddressCopied => 'Adresse de réception copiée';

  @override
  String get receiveIndex => 'Adresse de réception';

  @override
  String receiveIndexParam(String addressIndex) {
    return 'Adresse de réception $addressIndex';
  }

  @override
  String get received => 'Reçu';

  @override
  String get removeContact => 'Supprimer le contact';

  @override
  String removeContactConfirmation(String contactName) {
    return 'Êtes vous sûr de vouloir supprimer $contactName?';
  }

  @override
  String get removeWalletAction => 'Supprimer le portefeuille';

  @override
  String get removeWalletBiometricsMessage =>
      'Veuillez vous authentifier pour supprimer le portefeuille';

  @override
  String get removeWalletDetail =>
      'La suppression de ce portefeuille supprimera la phrase secrète et toutes les données liées au portefeuille sur cet appareil. Si la phrase secrète n\'est pas sauvegardée, vous ne pourrez plus jamais accéder à vos fonds.';

  @override
  String get removeWalletPinMessage =>
      'Entrer votre PIN pour supprimer le portefeuille';

  @override
  String get removeWalletReassurance =>
      'Tant que vous avez sauvegardé la phrase secrète, vous n\'avez rien à craindre.';

  @override
  String get requireAPasswordToOpenHeader =>
      'Demander un mot de passe pour ouvrir ce portefeuille ?';

  @override
  String get restartSetupButton => 'Redémarrer la configuration';

  @override
  String get scanQrCode => 'Scanner le QR Code';

  @override
  String get scanQrCodeError => 'Échec de l\'analyse du QR Code';

  @override
  String get scanFromImage => 'Scanner depuis une image';

  @override
  String get toggleFlash => 'Activer/désactiver la lampe torche';

  @override
  String get riskDisclosureHeader => 'Avant de commencer';

  @override
  String get riskDisclosureBody =>
      'Hoosat Mobile Wallet est un portefeuille non custodial. Votre phrase secrète et vos clés privées sont générées et stockées uniquement sur cet appareil : nous ne les voyons jamais, ne les enregistrons sur aucun serveur et ne pouvons pas les récupérer pour vous.';

  @override
  String get riskDisclosureWarning =>
      'Si vous perdez votre phrase secrète, il n\'existe aucune réinitialisation de mot de passe ni équipe d\'assistance capable de récupérer vos fonds. Vous êtes seul responsable de sa sécurité.';

  @override
  String get riskDisclosureAccept => 'Je comprends, continuer';

  @override
  String get secretInfo =>
      'Dans l\'écran suivant, vous verrez votre phrase secrète. Il s\'agit d\'un mot de passe qui permet d\'accéder à vos fonds. Il est crucial que vous le sauvegardiez et que vous ne le partagiez jamais avec qui que ce soit.';

  @override
  String get secretInfoHeader => 'La sécurité avant tout !';

  @override
  String get secretPhrase => 'Phrase secrète';

  @override
  String get verifyBackupTitle => 'Vérifiez votre sauvegarde';

  @override
  String get verifyBackupInstruction =>
      'Sélectionnez le bon mot pour chaque position afin de confirmer que vous avez enregistré votre phrase secrète.';

  @override
  String verifyBackupWordPrompt(int index) {
    return 'Quel est le mot n° $index ?';
  }

  @override
  String get verifyBackupWrongAnswer =>
      'Ce n\'est pas tout à fait exact. Vérifiez votre sauvegarde et réessayez.';

  @override
  String get secretPhrase12Words => '12 mots';

  @override
  String get secretPhrase24Words => '24 mots';

  @override
  String get secretWarning =>
      'Si vous perdez votre appareil ou désinstallez l\'application, vous aurez besoin de votre phrase secrète pour restaurer votre portefeuille !';

  @override
  String get securityHeader => 'Sécurité';

  @override
  String get securitySettingsBiometrics =>
      'Authentifiez-vous pour accéder aux paramètres de sécurité';

  @override
  String get securitySettingsPin =>
      'Saisissez votre code PIN pour accéder aux paramètres de sécurité';

  @override
  String get seed => 'Phrase secrète';

  @override
  String get signMessage => 'Signer un message';

  @override
  String get signMessageCopySignature => 'Copier la signature';

  @override
  String get signMessageDescription =>
      'Signez un message avec l\'une des adresses de votre portefeuille';

  @override
  String get signMessageHint => 'Saisissez un message à signer';

  @override
  String get signMessageSignatureCopied => 'Signature copiée';

  @override
  String get signMessageSigned => 'Message signé';

  @override
  String get signMessageTooLong => 'Le message est trop long';

  @override
  String get seedInvalid => 'La phrase secrète est invalide';

  @override
  String get nodeUnreachable =>
      'Impossible de joindre votre nœud. Les soldes peuvent ne pas être à jour.';

  @override
  String get nodeUnreachableRetry => 'Réessayer';

  @override
  String get send => 'Envoyer';

  @override
  String get sendConfirm => 'Envoyer';

  @override
  String get sendError => 'Une erreur s\'est produite. Veuillez réessayer.';

  @override
  String get sendNote => 'NOTE';

  @override
  String get sendToAddressTitle => 'Vers';

  @override
  String get sendTxProgressDescription =>
      'Veuillez patienter pendant l\'envoi de la transaction';

  @override
  String get sendTxProgressTitle => 'Transaction en cours';

  @override
  String get sending => 'Envoyer';

  @override
  String get sent => 'Envoyé';

  @override
  String get sentTo => 'Envoyé à';

  @override
  String get setPassword => 'Définir le mot de passe';

  @override
  String get setPasswordSuccess => 'Mot de passe activé';

  @override
  String get setWalletPassword => 'Définir un mot de passe';

  @override
  String get settingsHeader => 'Réglages';

  @override
  String get settingsTransfer => 'Charger depuis un portefeuille papier';

  @override
  String get setupFailedMessage => 'Une erreur est survenue';

  @override
  String get shareHoosatMobile => 'Partager Hoosat Mobile';

  @override
  String get shareHoosatMobileSubject =>
      'Découvrez le portefeuille Hoosat Mobile';

  @override
  String get shareHoosatMobileText =>
      'Découvrez Hoosat Mobile - Le portefeuille mobile de Hoosat.\nHoosat.io';

  @override
  String get somethingWentWrong => 'Une erreur est survenue';

  @override
  String get systemDefault => 'Paramètres par défaut';

  @override
  String get tapToHide => 'Taper pour masquer';

  @override
  String get tapToReveal => 'Taper pour afficher';

  @override
  String get themeDark => 'Thème sombre';

  @override
  String get themeHeader => 'Thème';

  @override
  String get themeLight => 'Thème clair';

  @override
  String get toggleTheme => 'Changer de thème';

  @override
  String get thisWallet => '#Ce portefeuille';

  @override
  String get to => 'Vers';

  @override
  String get toAddress => 'Vers l\'adresse';

  @override
  String get tooManyFailedAttempts =>
      'Trop de tentatives de déverrouillage infructueuses.';

  @override
  String get totalValue => 'Valeur totale';

  @override
  String get transactionId => 'ID de transaction';

  @override
  String get transactionsUppercase => 'TRANSACTIONS';

  @override
  String get transfer => 'Transférer';

  @override
  String get transferClose => 'Appuyez n’importe où afin de fermer ce volet.';

  @override
  String transferComplete(String amount) {
    return '$amount HTN ont été transférés avec succès vers votre portefeuille Hoosat Mobile.\n';
  }

  @override
  String transferConfirmInfo(String amount) {
    return 'Un portefeuille avec un solde de $amount HTN a été détecté.';
  }

  @override
  String get transferConfirmInfoSecond =>
      'Appuyez sur confirmer pour transférer les fonds.\n';

  @override
  String get transferConfirmInfoThird =>
      'Le transfert peut prendre quelques secondes.';

  @override
  String get transferError =>
      'Une erreur s’est produite durant le transfert. Veuillez réessayer plus tard.';

  @override
  String get transferHeader => 'Transférer les fonds';

  @override
  String transferIntro(String button) {
    return 'Transférer le contenu d\'un portefeuille papier vers votre portefeuille Hoosat Mobile.\n\nAppuyer sur le bouton \"$button\" pour commencer.';
  }

  @override
  String get transferLoading => 'Transfert en cours';

  @override
  String get transferManualHint =>
      'Merci d\'entrer votre phrase secrète ci-dessous.';

  @override
  String get transferNoFunds => 'Cette phrase secrète ne contient pas de HTN';

  @override
  String get transferQrScanError =>
      'Ce QR code ne contient pas de phrase secrète valide.';

  @override
  String get transferQrScanHint =>
      'Scanner une phrase secrète\nou une clé privée Hoosat';

  @override
  String get unconfirmed => 'non confirmé';

  @override
  String get notAccepted => 'rejeté';

  @override
  String get accepted => 'accepté';

  @override
  String get unknown => 'inconnu';

  @override
  String get unlock => 'Déverrouiller';

  @override
  String get unlockBiometrics =>
      'Authentifiez-vous pour déverrouiller le portefeuille';

  @override
  String get unlockPin =>
      'Entrer votre code PIN pour déverrouiller le portefeuille';

  @override
  String get utxosUppercase => 'UTXOs';

  @override
  String get viewAddress => 'Voir les adresses';

  @override
  String get viewTransaction => 'Voir la transaction';

  @override
  String get walletAddresses => 'Adresses du portefeuille';

  @override
  String get walletAddress => 'Adresse du portefeuille';

  @override
  String get walletName => 'Nom du portefeuille';

  @override
  String get walletNameDescription => 'Entrez un nom pour votre portefeuille';

  @override
  String get walletNameHint => 'Nom du portefeuille';

  @override
  String get walletSetupAddressDiscovery => 'Découverte d\'adresses en cours';

  @override
  String get walletSetupMessage => 'Configuration du portefeuille';

  @override
  String get walletsTitle => 'Portefeuilles';

  @override
  String get warning => 'Attention';

  @override
  String welcomeMessage(String version) {
    return 'Bienvenue !\n\nVoici la version $version de Hoosat Mobile - le portefeuille mobile de Hoosat !';
  }

  @override
  String get welcomeText =>
      'Bienvenue dans Hoosat Mobile. Avant de continuer, veuillez créer un nouveau portefeuille ou en importer un déjà existant.';

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
    return 'Après $_temp0';
  }

  @override
  String get yes => 'Oui';

  @override
  String get yesButton => 'Oui';

  @override
  String get yesUppercase => 'OUI';

  @override
  String get nodeNotSyncedException => 'Le nœud n\'est pas synchronisé';

  @override
  String get nodeNoUTXOIndexException => 'Le nœud ne possède pas d\'index UTXO';

  @override
  String get nodeSecureConnection => 'Connexion sécurisée';

  @override
  String get hoosatUriInvalid => 'URI Hoosat invalide';

  @override
  String get compoundUtxos => 'Combiner les transactions';

  @override
  String get compoundRequired => 'Consolider les petits UTXO';

  @override
  String get compoundRequiredDescription =>
      'Vous avez de nombreux petits UTXO. La consolidation les regroupera en moins d’UTXO plus grands afin d’accélérer vos envois et, potentiellement, de réduire les frais. Cette opération crée une ou plusieurs transactions et entraînera des frais de réseau.';

  @override
  String get compoundUtxosDescription => 'Combiner plusieurs UTXOs en un seul';

  @override
  String get compoundUtxosConfirmation => 'Combiner les transactions ?';

  @override
  String get compoundingUtxos => 'Combinaison des transactions en cours';

  @override
  String get compoundingMessage => 'Veuillez patienter...';

  @override
  String get compoundSuccess => 'Combinaison réussie';

  @override
  String get compoundFailure => 'La combinaison des transactions à échoué';

  @override
  String get fundsStillConfirmingTitle =>
      'Fonds encore en cours de confirmation';

  @override
  String get fundsStillConfirmingBody =>
      'Une partie des fonds de ce compte a été reçue trop récemment pour être envoyée : le réseau impose d\'abord une courte attente de maturation, généralement quelques minutes. Vous pouvez attendre et réessayer, ou envoyer depuis un autre compte disposant de fonds arrivés à maturité.';

  @override
  String get fundsStillConfirmingSwitchAccount => 'Changer de compte';

  @override
  String get compoundTooFewUtxos => 'Un minimum de 2 UTXOs sont nécéssaires';

  @override
  String get moveToMain => 'Regrouper sur Principal';

  @override
  String get moveToMainDescription =>
      'Transférer le solde de toutes les autres adresses vers votre adresse principale';

  @override
  String get moveToMainConfirmation => 'Tout déplacer vers Principal ?';

  @override
  String moveToMainConfirmationDescription(
      String amount, String symbol, int count) {
    return 'Cela déplacera $amount $symbol depuis $count autre(s) adresse(s) vers votre adresse principale. Une ou plusieurs transactions seront créées, avec des frais de réseau.';
  }

  @override
  String get moveToMainNothingToMove =>
      'Le solde de toutes les adresses est déjà sur Principal';

  @override
  String get movingToMain => 'Regroupement sur Principal';

  @override
  String get moveToMainSuccess => 'Transfert vers Principal réussi';

  @override
  String get moveToMainFailure => 'Échec du transfert vers Principal';

  @override
  String get moveToMainUppercased => 'DÉPLACER';

  @override
  String get manageAccounts => 'Comptes';

  @override
  String get manageAccountsDescription =>
      'Ajoutez et gérez des adresses nommées';

  @override
  String get mainAccountLabel => 'Principal';

  @override
  String get archiveAction => 'Archiver';

  @override
  String get restoreAction => 'Restaurer';

  @override
  String get archivedAccountsHeader => 'Archivés';

  @override
  String get noAdditionalAccountsYet =>
      'Aucun compte supplémentaire pour l\'instant';

  @override
  String get renameAccount => 'Renommer le compte';

  @override
  String get accountLabelHint => 'Nom du compte';

  @override
  String get saveUppercased => 'ENREGISTRER';

  @override
  String get addUppercased => 'AJOUTER';

  @override
  String get sendFromLabel => 'De';

  @override
  String get sendFromAny => 'N\'importe lequel';

  @override
  String get home => 'Accueil';

  @override
  String get activity => 'Activité';

  @override
  String get totalBalance => 'Solde total';

  @override
  String homeSpendableNow(String spendable, String arriving, String symbol) {
    return 'Disponible maintenant $spendable · Encore en route $arriving $symbol';
  }

  @override
  String get homeArrivingSoon =>
      'Les pièces encore en route vous appartiennent et pourront bientôt être dépensées.';

  @override
  String homeArrivingReadyIn(String time) {
    return 'Les pièces encore en route pourront être dépensées dans $time.';
  }

  @override
  String sendSpendableRestIn(String amount, String time) {
    return 'Disponible maintenant $amount. Le reste pourra être dépensé dans $time.';
  }

  @override
  String sendSpendableRestArriving(String amount) {
    return 'Disponible maintenant $amount. Le reste est encore en route.';
  }

  @override
  String get txTagWaiting => 'en attente d\'acceptation';

  @override
  String get txTagStatusUnknown => 'statut inconnu';

  @override
  String get txTagNotAccepted => 'non acceptée';

  @override
  String txTagConfirmingOf(String n, String total) {
    return 'confirmation $n / $total';
  }

  @override
  String get submittedTo => 'Envoyé à';

  @override
  String get testConnection => 'Tester la connexion';

  @override
  String get accountsOtherWalletHeader =>
      'Enregistrés depuis un autre portefeuille (lecture seule)';

  @override
  String get accountsOtherWalletNote =>
      'Ce portefeuille ne peut pas les dépenser, ils ne sont donc pas comptés dans son total. Ouvrez le portefeuille auquel ils appartiennent pour les utiliser.';

  @override
  String get noActivityTitle => 'Aucune activité pour l\'instant';

  @override
  String get txTypeSent => 'Envoyé';

  @override
  String get txTypeReceived => 'Reçu';

  @override
  String get txTypeThisWallet => 'Au sein du portefeuille';

  @override
  String get txTypeMerged => 'Pièces fusionnées';

  @override
  String get noActivityMessage =>
      'Lorsque vous envoyez ou recevez des HTN, cela apparaît ici.';

  @override
  String get seeAll => 'Tout voir';

  @override
  String get show => 'Afficher';

  @override
  String get myAccounts => 'Mes comptes';

  @override
  String homeGreeting(String walletName) {
    return 'Salut, $walletName';
  }

  @override
  String get balance => 'Solde';

  @override
  String get maxSend => 'Envoyer le maximum';

  @override
  String get compoundUppercased => 'COMBINER';

  @override
  String get closeUppercased => 'FERMER';

  @override
  String get scanMoreAddresses => 'Scanner pour trouver plus d\'adresses';

  @override
  String get addressDiscovery => 'Découverte d\'adresses';

  @override
  String get scanningTitle => 'Scan en cours';

  @override
  String get scanningDescription => 'Scan de nouvelles adresses...';

  @override
  String get scanMore => 'SCANNER PLUS';

  @override
  String get scanFailedMessage =>
      'Scan échoué, merci d\'essayer à nouveau plus tard';

  @override
  String get indexHeader => 'Index';

  @override
  String get currentIndex => 'Actuel';

  @override
  String get scannedIndex => 'Scanné';

  @override
  String get newIndex => 'Nouveau';

  @override
  String get addressFilterDialogTitle => 'Filtrer l\'adresse';

  @override
  String get addressFilterDialogOptionAllAddresses =>
      'Voir toutes les adresses';

  @override
  String get addressFilterDialogOptionNonZeroBalances =>
      'Voir les adresses avec un solde';

  @override
  String get importOption24WordsTitle =>
      'Importer une phrase secrète de 24 mots';

  @override
  String get importOption24WordsDescription =>
      'Compatible avec le portefeuille CLI et Ledger';

  @override
  String get importOption12WordsTitle =>
      'Importer une phrase secrète de 12 mots';

  @override
  String get importOption12WordsDescription =>
      'Compatible avec le portefeuille web et KDX';

  @override
  String get importOptionStandardWalletTitle =>
      'Importer un portefeuille standard';

  @override
  String get importOptionStandardWalletDescription =>
      'Portefeuilles de 12 ou 24 mots à dérivation standard, avec phrase de passe BIP39 facultative';

  @override
  String get importOptionLegacyWalletTitle => 'Importer un ancien portefeuille';

  @override
  String get importOptionLegacyWalletDescription =>
      'Portefeuilles de 12 mots à dérivation héritée, compatibles avec l\'ancien Web Wallet et KDX';

  @override
  String get importOptionKpubTitle =>
      'Importer un portefeuille en lecture seule';

  @override
  String get importOptionKpubDescription =>
      'Surveille le solde et les transactions d\'un portefeuille à l\'aide de sa clé publique étendue';

  @override
  String get importKpub => 'Importer un portefeuille en lecture seule';

  @override
  String get importKpubHint => 'Veuillez entrer votre clé publique étendue.';

  @override
  String get importKpubClipboardError =>
      'Le presse papier ne contient pas une clé publique étendue valide';

  @override
  String get importKpubQrCodeError =>
      'Le QR code ne contient pas une clé publique étendue valide';

  @override
  String get importKpubInvalidMessage =>
      'Veuillez vérifier que votre clé publique étendue est correctement renseignée !';

  @override
  String get receiveAddressListEmpty => 'L\'adresse de réception est vide';

  @override
  String get changeAddressListEmpty => 'La liste d\'adresses est vide';

  @override
  String get hintAddressListEmpty =>
      'Vérifier le filtre d\'adresses dans le coin en haut à droite';

  @override
  String get invalidSecretPhrase => 'Phrase secrète invalide';

  @override
  String get invalidSecretPhraseDetails =>
      'Le checksum de la phrase secrète renseignée est invalide.';

  @override
  String get invalidSecretPhraseConfirmation => 'Je sais ce que je fais';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String emailAction(String email) {
    return 'Email $email';
  }

  @override
  String get noteLabel => 'Note:';

  @override
  String get optionalLabel => '(Optionnel)';

  @override
  String get buyHoosatSubtitle => 'Via Topper par Uphold';

  @override
  String get buyHoosatTitle => 'Acheter Hoosat';

  @override
  String get buyHoosatMessage => 'Acheter \$HTN rapidement et facilement.';

  @override
  String get buyHoosatMessageSecondary =>
      'Service fourni par Topper, l\'accès fiat-crypto de Uphold.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get aboutTopperTitle => 'À propos de Topper';

  @override
  String get aboutTopperDescription =>
      'Topper by Uphold est un moyen d\'accès fiat-crypto facile à utiliser qui permet aux utilisateurs d\'acheter des crypto-monnaies en utilisant une carte de crédit/débit ou avec un compte bancaire.';

  @override
  String get moreInfo => 'Plus d\'info';

  @override
  String get selectAddress => 'Sélectionnez l\'adresse';

  @override
  String get kpubTitle => 'Clé publique étendue';

  @override
  String get kpubAuth => 'Voir la clé publique étendue';

  @override
  String get kpubDescription =>
      'La clé publique étendue peut être utilisée pour importer votre portefeuille en \"lecture seule\".';

  @override
  String get copyKpub => 'Copier la Kpub';

  @override
  String get kpubCopied => 'Clé publique étendue copiée';

  @override
  String get kpubCopyFailed => 'Échec de copie de la clé publique';

  @override
  String walletAddressesCopied(String addressType) {
    return 'Adresses du portefeuille $addressType copiées dans le presse-papier';
  }

  @override
  String walletAddressesCopyFailed(String addressType) {
    return 'Échec de copie des adresses du portefeuille $addressType ';
  }

  @override
  String get txReport => 'Rapport de transaction';

  @override
  String get txReportSubtitle =>
      'Obtenir un fichier CSV de l\'historique de transaction';

  @override
  String get txReportDetails =>
      'Générer un rapport de transaction, au format CSV, qui contient tout l\'historique de transaction du portefeuille.';

  @override
  String get txReportOptionIgnoreCompound =>
      'Ignorer les transactions combinées';

  @override
  String get txReportOptionIgnoreSelfTxs =>
      'Ignorer les transactions envoyées à soi-même';

  @override
  String get txReportOptionRefreshTxs => 'Rafraichir les transactions';

  @override
  String get txReportGenerate => 'Générer';

  @override
  String get txReportStatusRefreshing => 'Rafraichissement des transactions';

  @override
  String get txReportStatusLoading => 'Chargement des transactions';

  @override
  String get txReportStatusReady => 'Rapport de transaction prêt!';

  @override
  String get txReportGetReport => 'Obtenir le rapport';

  @override
  String get txReportDate => 'Date';

  @override
  String get txReportSentAmount => 'Montant envoyé';

  @override
  String get txReportSentCurrency => 'Devise envoyée';

  @override
  String get txReportReceivedAmount => 'Montant reçu';

  @override
  String get txReportReceivedCurrency => 'Devise reçue';

  @override
  String get txReportFeeAmount => 'Montant des frais';

  @override
  String get txReportFeeCurrency => 'Devise des frais';

  @override
  String get txReportLabel => 'Label';

  @override
  String get txReportDescription => 'Description';

  @override
  String get txReportTxHash => 'TxHash';

  @override
  String get txReportNote => 'Note';

  @override
  String get txReportLabelCost => 'coût';

  @override
  String get txReportFeeForCompound => 'Frais pour combiner la transaction';

  @override
  String get txReportFeeForSelfSend => 'Frais pour envoyer à sa propre adresse';

  @override
  String get txReportError => 'Échec lors de la génération du rapport';

  @override
  String txReportNoTxs(int numberOf) {
    return '$numberOf transactions trouvées.';
  }

  @override
  String txReportNoLoadedTxs(int loadedTxs, int totalTxs) {
    return '($loadedTxs sur $totalTxs)';
  }

  @override
  String get txFilterDialogTitle => 'Filtre de transaction';

  @override
  String get txFilterDialogOptionAllTxs => 'Afficher toutes les transactions';

  @override
  String get txFilterDialogOptionHideNotAcceptedCoinbase =>
      'Cacher les transactions coinbase refusées';

  @override
  String get changeAddressModeTitle => 'Comportement de l\'adresse de monnaie';

  @override
  String get changeAddressModeDescriptionKeepPerAddress =>
      'Chaque adresse conserve son propre solde et la monnaie reste sur place';

  @override
  String get changeAddressModeDescriptionPrivate =>
      'Une nouvelle adresse est utilisée à chaque fois (privé, le solde se répartit)';

  @override
  String get changeAddressModeDialogTitle =>
      'Comportement de l\'adresse de monnaie';

  @override
  String get changeAddressModeDialogOptionKeepPerAddress =>
      'Garder les soldes sur chaque adresse';

  @override
  String get changeAddressModeDialogOptionPrivate => 'Privé';

  @override
  String get requestPasswordHeader => 'Demander le mot de passe';

  @override
  String get requestPasswordAtLaunch => 'Au lancement';

  @override
  String get requestPasswordWhenLocked => 'Quand verrouillé';

  @override
  String get requestPasswordWhenSigning => 'Lors de la signature';

  @override
  String get importWalletAdvancedOptions => 'Options avancées';

  @override
  String get bip39Passphrase => 'Phrase de passe BIP39';

  @override
  String get bip39PassphraseWarning =>
      'REMARQUE : ce n\'est pas un mot de passe du portefeuille ; des phrases de passe BIP39 différentes ouvrent des portefeuilles différents.';

  @override
  String get bip39PassphraseEnter => 'Saisissez la phrase de passe';

  @override
  String get bip39PassphraseConfirm => 'Confirmez la phrase de passe';

  @override
  String get bip39PassphraseMismatch =>
      'Les phrases de passe ne correspondent pas !';

  @override
  String get bip39PassphraseNote => 'Portefeuille avec phrase de passe BIP39.';

  @override
  String get feePriorityHint => 'Saisissez les frais de priorité';

  @override
  String get feeBaseUppercase => 'FRAIS DE BASE';

  @override
  String get feePriorityUppsercase => 'FRAIS DE PRIORITÉ';

  @override
  String get feeUpdateAddressError =>
      'Impossible de reconnaître l\'adresse de destination';

  @override
  String get feeUpdateRebuildError =>
      'Impossible de reconstruire la transaction';

  @override
  String get feeUpdateRebuildError2 =>
      'Impossible de reconstruire la transaction avec les nouveaux frais';

  @override
  String get feeUpdateError => 'Impossible de mettre à jour les frais';

  @override
  String get feeUpdate => 'Mettre à jour les frais';

  @override
  String get feeUpdateTitle => 'Mise à jour des frais';

  @override
  String get feeSheetRecommendedPriority => 'Frais de priorité recommandés';

  @override
  String feeSheetPriorityFeeWarning(String amount, String symbol) {
    return 'Les nouveaux frais de priorité doivent être d\'au moins $amount $symbol';
  }

  @override
  String get txPending => 'EN ATTENTE';

  @override
  String get txPendingMessage => 'Cette transaction est en attente';

  @override
  String get txPendingTitle => 'Transaction en attente';

  @override
  String get txPendingContent =>
      'Des transactions sont en attente dans le mempool.';

  @override
  String get txPendingActionUpdateFee =>
      'Mettre à jour les frais de la transaction';

  @override
  String get txPendingActionRbf => 'Remplacer par les frais (RBF)';

  @override
  String get txInMempool => 'dans le mempool';

  @override
  String get utxoSelectionTitle => 'Sélectionner des UTXO';

  @override
  String get utxoSelectionHint => 'Veuillez sélectionner plus d\'UTXO';
}
