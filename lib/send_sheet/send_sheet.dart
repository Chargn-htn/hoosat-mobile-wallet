import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../contacts/contact.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../wallet_address/account_display_name_provider.dart';
import '../settings_advanced/compound_utxos_dialog.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../util/user_data_util.dart';
import '../widgets/address_widgets.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/fiat_mode_icon.dart';
import '../widgets/fiat_value_container.dart';
import '../widgets/gradient_widgets.dart';
import '../widgets/sheet_handle.dart';
import '../widgets/sheet_util.dart';
import '../widgets/tap_outside_unfocus.dart';
import 'balance_text_widget.dart';
import 'fee_widget.dart';
import 'my_accounts_picker_sheet.dart';
import 'send_from_picker.dart';
import 'send_from_providers.dart';
import 'send_note_widget.dart';

enum AddressStyle { TEXT60, TEXT90, PRIMARY }

class SendSheet extends ConsumerStatefulWidget {
  final String? title;
  final Contact? contact;
  final HoosatUri? uri;
  final BigInt? feeRaw;
  final bool rbf;

  const SendSheet({
    super.key,
    this.title,
    this.contact,
    this.uri,
    this.feeRaw,
    this.rbf = false,
  });

  _SendSheetState createState() => _SendSheetState();
}

class _SendSheetState extends ConsumerState<SendSheet> {
  final _amountFocusNode = FocusNode();
  final _amountController = TextEditingController();

  final _addressFocusNode = FocusNode();
  final _addressController = TextEditingController();

  final _noteFocusNode = FocusNode();
  final _noteController = TextEditingController();

  // States
  AddressStyle _sendAddressStyle = AddressStyle.TEXT60;
  String? _amountHint;
  String? _addressHint;
  String? _noteHint;

  String _amountValidationText = '';
  String _addressValidationText = '';

  late List<Contact> _contacts;

  // Used to replace address textfield with colorized TextSpan
  bool _addressValidAndUnfocused = false;
  bool _noteValidAndUnfocused = false;

  // Set to true when a contact is being entered
  bool _isContact = false;

  // Set when the user picks one of their OWN accounts from "My accounts": the
  // field then shows the account's name (reassurance) while the real address
  // is kept here and used when sending.
  String? _pickedAccountAddress;
  String? _pickedAccountLabel;

  // Buttons States (Used because we hide the buttons under certain conditions)
  bool _contactButtonVisible = true;
  bool _pasteButtonVisible = true;
  bool _noteQrButtonVisible = true;
  bool _notePasteButtonVisible = true;

  late BigInt? amountRaw = widget.uri?.amount?.raw;
  late BigInt? feeRaw = widget.feeRaw;
  String? get _note => widget.uri?.message;

  bool get hasNote => _note != null;
  bool get hasUri => widget.uri != null;

  @override
  void initState() {
    super.initState();

    // Do an UTXO refresh for all active addresses
    final addresses = ref.read(activeAddressesProvider);
    final utxoNotifier = ref.read(utxoNotifierProvider);
    utxoNotifier.refresh(addresses: addresses, force: true);

    _contacts = [];
    if (widget.contact != null) {
      // Setup initial state for contact pre-filled
      _addressController.text = widget.contact!.name;
      _isContact = true;
      _contactButtonVisible = false;
      _pasteButtonVisible = false;
      _sendAddressStyle = AddressStyle.PRIMARY;
    } else if (widget.uri != null) {
      // Setup initial state with prefilled address
      _addressController.text = widget.uri!.address.encoded;
      _contactButtonVisible = false;
      _pasteButtonVisible = false;
      _sendAddressStyle = AddressStyle.TEXT90;
      _addressValidAndUnfocused = true;
    }

    if (_note == null) {
      // on note focus change
      _noteFocusNode.addListener(() {
        if (_noteFocusNode.hasFocus) {
          setState(() {
            _noteValidAndUnfocused = false;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            Scrollable.ensureVisible(
              _noteFocusNode.context!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        }
      });
    }
    // On amount focus change
    _amountFocusNode.addListener(() {
      setState(() => _amountHint = _amountFocusNode.hasFocus ? '' : null);
    });
    // On address focus change
    _addressFocusNode.addListener(() {
      if (_addressFocusNode.hasFocus) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
        setState(() {
          _addressHint = '';
          _addressValidAndUnfocused = false;
        });
        _addressController.selection = TextSelection.fromPosition(
            TextPosition(offset: _addressController.text.length));
        if (_addressController.text.startsWith("@")) {
          setState(() {
            _contacts = ref
                .read(contactsProvider)
                .getContactsWithNameLike(_addressController.text);
          });
        }
      } else {
        setState(() {
          _addressHint = null;
          _contacts = [];
          final prefix = ref.read(addressPrefixProvider);
          final address = Address.tryParse(
            _addressController.text.trim(),
            expectedPrefix: prefix,
          );
          if (address != null) {
            _addressValidAndUnfocused = true;
          }
        });
        if (_addressController.text.trim() == "@") {
          _addressController.text = '';
          setState(() => _contactButtonVisible = true);
        }
      }
    });
    _noteFocusNode.addListener(() {
      setState(() => _noteHint = _noteFocusNode.hasFocus ? '' : null);
    });

    // Set quick send amount
    if (amountRaw != null) {
      _amountController.text = NumberUtil.getStringFromRaw(
        amountRaw!,
        TokenInfo.hoosat.decimals,
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _addressController.dispose();
    _noteController.dispose();

    _amountFocusNode.dispose();
    _addressFocusNode.dispose();
    _noteFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);
    final styles = ref.watch(stylesProvider);

    Future<void> scanQrCode() async {
      FocusManager.instance.primaryFocus?.unfocus();

      final qrCode = await UserDataUtil.scanQrCode(context);
      final qrData = qrCode?.code;
      if (qrData == null) {
        return;
      }

      final prefix = ref.read(addressPrefixProvider);
      final uri = HoosatUri.tryParse(qrData, prefix: prefix);
      final address = uri?.address;
      if (address == null) {
        UIUtil.showSnackbar(l10n.qrInvalidAddress, context);
        return;
      }

      final amount = uri?.amount;
      if (amount != null) {
        _amountController.text = NumberUtil.getStringFromRaw(
          amount.raw,
          TokenInfo.hoosat.decimals,
        );
        amountRaw = amount.raw;
      }

      final note = uri?.message;
      if (note != null) {
        _noteController.text = note;
      }

      // See if this address belongs to a contact
      final contacts = ref.read(contactsProvider);
      final contact = contacts.getContactWithAddress(address.encoded);

      _addressValidationText = '';
      _pasteButtonVisible = false;
      _contactButtonVisible = false;

      if (contact == null) {
        // Not a contact
        _isContact = false;
        _sendAddressStyle = AddressStyle.TEXT90;
        _addressController.text = address.encoded;
        _addressValidAndUnfocused = true;
      } else {
        // Is a contact
        _isContact = true;
        _sendAddressStyle = AddressStyle.PRIMARY;
        _addressController.text = contact.name;
        _addressValidAndUnfocused = false;
      }

      setState(() {});
    }

    Future<void> pickMyAccount() async {
      FocusManager.instance.primaryFocus?.unfocus();

      final theme = ref.read(themeProvider);
      final picked = await Sheets.showAppHeightNineSheet<String>(
        context: context,
        theme: theme,
        widget: const MyAccountsPickerSheet(),
      );
      if (picked == null) {
        return;
      }

      final prefix = ref.read(addressPrefixProvider);
      final address = Address.tryParse(picked, expectedPrefix: prefix);
      if (address == null) {
        return;
      }

      final contacts = ref.read(contactsProvider);
      final contact = contacts.getContactWithAddress(address.encoded);

      _addressValidationText = '';
      _pasteButtonVisible = false;
      _contactButtonVisible = false;

      final mainAddress =
          ref.read(addressNotifierProvider).defaultReceiveAddress.encoded;
      final accountLabel = address.encoded == mainAddress
          ? l10n.mainAccountLabel
          : ref.read(accountLabelProvider(address.encoded));

      _pickedAccountAddress = null;
      _pickedAccountLabel = null;

      if (contact == null && accountLabel != null) {
        // Show the name the user gave this account, like a contact.
        _isContact = true;
        _sendAddressStyle = AddressStyle.PRIMARY;
        _addressController.text = accountLabel;
        _addressValidAndUnfocused = false;
        _pickedAccountAddress = address.encoded;
        _pickedAccountLabel = accountLabel;
      } else if (contact == null) {
        _isContact = false;
        _sendAddressStyle = AddressStyle.TEXT90;
        _addressController.text = address.encoded;
        _addressValidAndUnfocused = true;
      } else {
        _isContact = true;
        _sendAddressStyle = AddressStyle.PRIMARY;
        _addressController.text = contact.name;
        _addressValidAndUnfocused = false;
      }

      setState(() {});
    }

    void sendAction() {
      final validRequest = _validateRequest();
      if (!validRequest) {
        return;
      }
      final addressText = _addressController.text.trim();
      String destination;

      if (_pickedAccountAddress != null && addressText == _pickedAccountLabel) {
        // An account the person picked from "My accounts" (its name may start
        // with "@" too, so this must be checked before the contact rule).
        destination = _pickedAccountAddress!;
      } else if (addressText.startsWith("@")) {
        final contacts = ref.read(contactsProvider);
        // Need to make sure its a valid contact
        final contact = contacts.getContactWithName(addressText);

        if (contact == null) {
          setState(() {
            _addressValidationText = l10n.contactInvalid;
          });
          return;
        }
        destination = contact.address;
      } else {
        destination = addressText;
      }

      final prefix = ref.read(addressPrefixProvider);
      final toAddress = Address.tryParse(
        destination,
        expectedPrefix: prefix,
      );
      if (toAddress == null) {
        UIUtil.showSnackbar('Invalid destination address', context);
        return;
      }

      if (amountRaw == null) {
        UIUtil.showSnackbar('Invalid amount', context);
        return;
      }

      final text = _noteController.text;
      final note = text.isNotEmpty ? text : _note;

      final uri = HoosatUri(
        address: toAddress,
        amount: Amount.raw(amountRaw!),
        message: note,
      );

      UIUtil.showSendFlow(context, ref: ref, uri: uri, useRbf: widget.rbf);
    }

    return SafeArea(
      minimum: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.035,
      ),
      child: TapOutsideUnfocus(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 60, height: 60),
                Column(
                  children: [
                    const SheetHandle(),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 140,
                      ),
                      child: Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.title ?? l10n.send.toUpperCase(),
                              style: styles.textStyleHeader(context),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 60, height: 60),
              ],
            ),
            const SendFromRow(),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
                bottom: 4,
              ),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: l10n.available,
                    style: styles.textStyleAccount,
                  ),
                ),
              ),
            ),
            BalanceTextWidget(address: ref.watch(sendFromAddressProvider)),
            // When part of the balance cannot be spent yet (coins that have just
            // arrived), say how much CAN be, and when the rest will be ready.
            Builder(builder: (context) {
              final from = ref.watch(sendFromAddressProvider);
              final balance = ref.watch(fromBalanceProvider(from)).raw;
              final spendable = ref.watch(sendSpendableAmountProvider(from));
              if (spendable >= balance) return const SizedBox.shrink();
              final ready = ref.watch(nextCoinsReadyProvider);
              return Padding(
                padding: const EdgeInsets.only(top: 4, left: 30, right: 30),
                child: Text(
                  ready == null
                      ? l10nOf(context).sendSpendableRestArriving(
                          NumberUtil.formatedAmount(Amount.raw(spendable)))
                      : l10nOf(context).sendSpendableRestIn(
                          NumberUtil.formatedAmount(Amount.raw(spendable)),
                          ready),
                  textAlign: TextAlign.center,
                  style: styles.textStyleParagraphThinPrimary,
                ),
              );
            }),
            // A main container that holds everything
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                child: Stack(
                  children: [
                    // A column for Enter Amount, Enter Address, Error containers and the pop up list
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: max(
                          0,
                          MediaQuery.of(context).viewInsets.bottom - 180,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 35),
                              // ******* Enter Amount Container ******* //
                              getEnterAmountContainer(),
                              // ******* Enter Amount Container End ******* //

                              // ******* Enter Amount Error Container ******* //
                              Container(
                                alignment: const AlignmentDirectional(0, 0),
                                margin: const EdgeInsets.only(top: 3),
                                child: Text(
                                  _amountValidationText,
                                  style: styles.textStyleParagraphThinPrimary,
                                ),
                              ),
                              // ******* Enter Amount Error Container End ******* //
                            ],
                          ),
                          // Column for Enter Address container + Enter Address Error container
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.105,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.105,
                                      ),
                                      alignment: Alignment.bottomCenter,
                                      constraints: const BoxConstraints(
                                        maxHeight: 174,
                                      ),
                                      // ********************************************* //
                                      // ********* The pop-up Contacts List ********* //
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: theme.backgroundDarkest,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            margin: EdgeInsets.only(bottom: 50),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(
                                                  bottom: 0, top: 0),
                                              itemCount: _contacts.length,
                                              itemBuilder: (context, index) {
                                                return _buildContactItem(
                                                    _contacts[index]);
                                              },
                                            ), // ********* The pop-up Contacts List End ********* //
                                            // ************************************************** //
                                          ),
                                        ),
                                      ),
                                    ),
                                    getEnterAddressContainer(),
                                  ],
                                ),
                              ),

                              // The real address under a picked account's name, so the
                              // user can check both the name AND the address.
                              if (_pickedAccountAddress != null &&
                                  _addressController.text.trim() ==
                                      _pickedAccountLabel)
                                Container(
                                  alignment: const AlignmentDirectional(0, 0),
                                  margin: const EdgeInsets.only(
                                      top: 6, left: 30, right: 30),
                                  child: Text(
                                    _pickedAccountAddress!,
                                    textAlign: TextAlign.center,
                                    style: styles.textStyleAddressText60,
                                  ),
                                ),

                              // ******* Enter Address Error Container ******* //
                              Container(
                                alignment: const AlignmentDirectional(0, 0),
                                margin: const EdgeInsets.only(top: 3),
                                child: Text(
                                  _addressValidationText,
                                  style: styles.textStyleParagraphThinPrimary,
                                ),
                              ),
                              // ******* Enter Address Error Container End ******* //
                              if (feeRaw != null && feeRaw! > BigInt.zero) ...[
                                FeeWidget(
                                  amount: Amount.raw(feeRaw!),
                                ),
                              ],
                              const SizedBox(height: 3),
                              Column(
                                children: [
                                  if (hasNote)
                                    SendNoteWidget(note: _note!)
                                  else
                                    getEnterNoteContainer(),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const ListTopGradient(),
                    const ListBottomGradient(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  PrimaryButton(
                    title: l10n.send,
                    onPressed: sendAction,
                  ),
                  const SizedBox(height: 16),
                  if (widget.uri == null) ...[
                    PrimaryOutlineButton(
                      title: l10n.scanQrCode,
                      onPressed: scanQrCode,
                    ),
                    const SizedBox(height: 16),
                    PrimaryOutlineButton(
                      title: l10n.myAccounts,
                      onPressed: pickMyAccount,
                    ),
                  ] else
                    PrimaryOutlineButton(
                      title: l10n.cancel,
                      onPressed: () => appRouter.pop(context),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build contact items for the list
  Widget _buildContactItem(Contact contact) {
    return Consumer(builder: (context, ref, _) {
      final theme = ref.watch(themeProvider);
      final styles = ref.watch(stylesProvider);

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 42,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                _addressController.text = contact.name;
                FocusManager.instance.primaryFocus?.unfocus();

                setState(() {
                  _isContact = true;
                  _contactButtonVisible = false;
                  _pasteButtonVisible = false;
                  _sendAddressStyle = AddressStyle.PRIMARY;
                });
              },
              child: Text(
                contact.name,
                textAlign: TextAlign.center,
                style: styles.textStyleAddressPrimary,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 1,
            color: theme.text03,
          ),
        ],
      );
    });
  }

  /// Validate form data to see if valid
  /// @returns true if valid, false otherwise
  bool _validateRequest() {
    final l10n = l10nOf(context);

    _amountFocusNode.unfocus();
    _addressFocusNode.unfocus();
    _noteFocusNode.unfocus();

    // Validate amount
    if (amountRaw == null) {
      setState(() {
        _amountValidationText = l10n.amountMissing;
      });
      return false;
    }

    if (amountRaw == BigInt.zero) {
      setState(() {
        _amountValidationText = l10n.amountZero;
      });
      return false;
    }

    final fromAddress = ref.read(sendFromAddressProvider);
    final balanceRaw = ref.read(fromBalanceProvider(fromAddress)).raw;
    final utxoCount = ref.read(sendSpendableUtxosForProvider(fromAddress)).length;
    final maxFees = BigInt.from(utxoCount) * kFeePerInput;

    if (amountRaw! > balanceRaw - maxFees) {
      setState(() {
        _amountValidationText = l10n.insufficientBalance;
      });
      return false;
    }

    final maxSend = ref.read(maxSendForProvider(fromAddress));
    if (amountRaw! > maxSend.raw) {
      // Two different reasons this can happen, and they need different
      // messages: either this account's utxos are genuinely fragmented
      // (compounding helps), or the shortfall is because recently-received
      // funds haven't hit the network's 1000-DAA-score maturity threshold
      // yet (compounding does NOT help here -- it would hit the exact
      // same maturity rejection, and just confuses the user into thinking
      // "consolidate" is the fix when "wait a few minutes" is).
      final scopeCoins = spendableForFrom(
        ref.read(utxoListProvider),
        fromAddress: fromAddress?.encoded,
        mainAddress: ref.read(mainAddressProvider),
        accountAddresses: ref.read(accountAddressesProvider),
      );
      final score = ref.read(matureScoreProvider);
      final heldBack = ref.read(heldBackCoinsProvider.notifier).active();
      // What is in this "From" choice but cannot be spent yet: coins still
      // maturing and coins just spent in a payment that is not confirmed.
      var notYet = BigInt.zero;
      for (final u in scopeCoins) {
        final maturing = score != null &&
            u.utxoEntry.blockDaaScore + BigInt.from(kMinUtxoMaturityDaaScore) >=
                score;
        final held = heldBack
            .contains(outpointKey(u.outpoint.transactionId, u.outpoint.index));
        if (maturing || held) notYet += u.utxoEntry.amount;
      }
      // Waiting only helps when those coins would cover what is missing;
      // otherwise the coins are too scattered and merging is the fix.
      final waitingHelps = notYet >= amountRaw! - maxSend.raw;

      if (waitingHelps) {
        final styles = ref.read(stylesProvider);
        showAppDialog(
          context: context,
          builder: (_) => AppAlertDialog(
            title: Text(l10n.fundsStillConfirmingTitle,
                style: styles.textStyleDialogHeader),
            content: Text(l10n.fundsStillConfirmingBody,
                style: styles.textStyleParagraph),
            actions: [
              TextButton(
                style: styles.dialogButtonStyle,
                onPressed: () {
                  appRouter.pop(context);
                  showSendFromDialog(context, ref);
                },
                child: Text(
                  l10n.fundsStillConfirmingSwitchAccount.toUpperCase(),
                  style: styles.textStyleDialogButtonText,
                ),
              ),
              TextButton(
                style: styles.dialogButtonStyle,
                onPressed: () => appRouter.pop(context),
                child: Text(
                  l10n.close.toUpperCase(),
                  style: styles.textStyleDialogButtonText,
                ),
              ),
            ],
          ),
        );
        return false;
      }

      showAppDialog(
        context: context,
        builder: (_) => CompoundUtxosDialog(lightMode: true, rbf: widget.rbf),
      );
      return false;
    }

    // Validate address
    final addressText = _addressController.text.trim();
    final pickedAccount = _pickedAccountAddress != null &&
        addressText == _pickedAccountLabel;
    bool isContact = addressText.startsWith('@') || pickedAccount;
    if (addressText.isEmpty) {
      setState(() {
        _addressValidationText = l10n.addressMising;
        _pasteButtonVisible = true;
      });
      return false;
    }
    final prefix = ref.read(addressPrefixProvider);
    final address = Address.tryParse(addressText, expectedPrefix: prefix);
    if (!isContact && address == null) {
      setState(() {
        _addressValidationText = l10n.invalidAddress;
        _pasteButtonVisible = true;
      });
      return false;
    }
    if (!isContact) {
      setState(() {
        _addressValidationText = '';
        _pasteButtonVisible = false;
      });
      _addressFocusNode.unfocus();
    }
    return true;
  }

  Widget getEnterAmountContainer() {
    return HookConsumer(builder: (context, ref, _) {
      final theme = ref.watch(themeProvider);
      final styles = ref.watch(stylesProvider);
      final l10n = l10nOf(context);

      final hoosatFormatter = ref.watch(hoosatFormatterProvider);
      final fiatFormatter = ref.watch(fiatFormatterProvider);
      final fromAddress = ref.watch(sendFromAddressProvider);
      final maxSend = ref.watch(maxSendForProvider(fromAddress));
      final isMaxSend = amountRaw == maxSend.raw || maxSend.raw == BigInt.zero;

      final amount = Amount.raw(amountRaw ?? BigInt.zero);

      final fiatMode = ref.watch(fiatModeProvider);

      final hintText = (fiatMode ? l10n.enterFiatValue : l10n.enterAmount);

      useEffect(() {
        if (amountRaw != null) {
          _amountController.text = switch (fiatMode) {
            true => ref.read(fiatForAmountProvider(amount)),
            false => NumberUtil.textFieldFormatedAmount(amount),
          };
        }
        return null;
      }, [fiatMode]);

      void onValueChanged(String text) {
        final value = switch (fiatMode) {
          true => () {
              final price = ref.read(hoosatPriceProvider);
              final fiatValue = fiatFormatter.tryParse(text);
              if (price.price == Decimal.zero || fiatValue == null) {
                return null;
              }
              return (fiatValue / price.price)
                  .toDecimal(scaleOnInfinitePrecision: 8);
            }(),
          false => hoosatFormatter.tryParse(text),
        };

        if (value == null) {
          setState(() => amountRaw = null);
          return;
        }
        amountRaw = Amount.value(value).raw;
        // Always reset the error message to be less annoying
        setState(() => _amountValidationText = '');
      }

      void onMaxPressed() {
        if (isMaxSend) {
          return;
        }

        setState(() => amountRaw = maxSend.raw);

        _amountController.text = switch (fiatMode) {
          true => ref.read(fiatForAmountProvider(maxSend)),
          false => NumberUtil.textFieldFormatedAmount(maxSend),
        };

        if (_addressController.text.isEmpty) {
          _addressController.selection = TextSelection.fromPosition(
            TextPosition(offset: _addressController.text.length),
          );
          _addressFocusNode.requestFocus();
        } else {
          _amountFocusNode.unfocus();
        }
      }

      return FiatValueContainer(
        amount: amount,
        showAmount: fiatMode,
        child: AppTextField(
          focusNode: _amountFocusNode,
          controller: _amountController,
          topMargin: 15,
          cursorColor: theme.primary,
          style: styles.textStyleParagraphPrimary,
          inputFormatters: [fiatMode ? fiatFormatter : hoosatFormatter],
          onChanged: onValueChanged,
          textInputAction: TextInputAction.done,
          maxLines: null,
          autocorrect: false,
          hintText: _amountHint ?? hintText,
          prefixButton: TextFieldButton(
            widget: FiatModeIcon(fiatMode: fiatMode),
            onPressed: () {
              final notifier = ref.read(fiatModeProvider.notifier);
              notifier.update((state) => !state);
            },
          ),
          suffixButton: TextFieldButton(
            icon: AppIcons.max,
            onPressed: onMaxPressed,
          ),
          fadeSuffixOnCondition: true,
          suffixShowFirstCondition: !isMaxSend,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.center,
          onSubmitted: (text) {
            //FocusScope.of(context).unfocus();
            final prefix = ref.read(addressPrefixProvider);
            final address = Address.tryParse(
              _addressController.text.trim(),
              expectedPrefix: prefix,
            );
            if (address == null) {
              FocusScope.of(context).requestFocus(_addressFocusNode);
            }
          },
        ),
      );
    });
  }

  Widget getEnterAddressContainer() {
    return Consumer(builder: (context, ref, _) {
      final theme = ref.watch(themeProvider);
      final l10n = l10nOf(context);
      final styles = ref.watch(stylesProvider);

      return AppTextField(
        topMargin: 124,
        padding: _addressValidAndUnfocused
            ? EdgeInsets.symmetric(horizontal: 25, vertical: 15)
            : EdgeInsets.zero,
        focusNode: _addressFocusNode,
        controller: _addressController,
        cursorColor: theme.primary,
        inputFormatters: [
          _isContact
              ? LengthLimitingTextInputFormatter(20)
              : LengthLimitingTextInputFormatter(74),
        ],
        textInputAction: TextInputAction.done,
        maxLines: null,
        autocorrect: false,
        hintText: _addressHint ?? l10n.enterAddress,
        prefixButton: TextFieldButton(
          icon: AppIcons.at,
          onPressed: () {
            if (_contactButtonVisible && _contacts.length == 0) {
              // Show menu
              FocusScope.of(context).requestFocus(_addressFocusNode);
              if (_addressController.text.length == 0) {
                _addressController.text = "@";
                _addressController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _addressController.text.length));
              }
              setState(() {
                _contacts = ref.read(contactsProvider).contacts;
              });
            }
          },
        ),
        fadePrefixOnCondition: true,
        prefixShowFirstCondition:
            _contactButtonVisible && _contacts.length == 0,
        suffixButton: TextFieldButton(
          icon: AppIcons.paste,
          onPressed: () {
            if (!_pasteButtonVisible) {
              return;
            }
            Clipboard.getData("text/plain").then((ClipboardData? data) {
              if (data == null || data.text == null) {
                return;
              }
              final prefix = ref.read(addressPrefixProvider);
              final address = Address.tryParse(
                data.text!.trim(),
                expectedPrefix: prefix,
              );
              if (address != null) {
                final contacts = ref.read(contactsProvider);
                final contact = contacts.getContactWithAddress(
                  address.encoded,
                  includeLabels: true,
                );
                if (contact == null) {
                  setState(() {
                    _isContact = false;
                    _addressValidationText = "";
                    _sendAddressStyle = AddressStyle.TEXT90;
                    _pasteButtonVisible = false;
                    _contactButtonVisible = false;
                  });
                  _addressController.text = address.encoded;
                  _addressFocusNode.unfocus();
                  _noteFocusNode.unfocus();
                  setState(() {
                    _addressValidAndUnfocused = true;
                  });
                } else {
                  // Is a contact
                  setState(() {
                    _isContact = true;
                    _addressValidationText = "";
                    _sendAddressStyle = AddressStyle.PRIMARY;
                    _pasteButtonVisible = false;
                    _contactButtonVisible = false;
                  });
                  _addressController.text = contact.name;
                }
              }
            });
          },
        ),
        fadeSuffixOnCondition: true,
        suffixShowFirstCondition: _pasteButtonVisible,
        style: _sendAddressStyle == AddressStyle.TEXT60
            ? styles.textStyleAddressText60
            : _sendAddressStyle == AddressStyle.TEXT90
                ? styles.textStyleAddressText90
                : styles.textStyleAddressPrimary,
        onChanged: (text) {
          if (text.length > 0) {
            setState(() {
              _contactButtonVisible = false;
            });
          } else {
            setState(() {
              _contactButtonVisible = true;
            });
          }
          bool isContact = text.startsWith("@");
          // Switch to contact mode if starts with @
          if (isContact) {
            setState(() {
              _isContact = true;
            });
            final contacts = ref.read(contactsProvider);
            final matchedList = contacts.getContactsWithNameLike(text);
            setState(() => _contacts = matchedList);
          } else {
            setState(() {
              _isContact = false;
              _contacts = [];
            });
          }
          // Always reset the error message to be less annoying
          setState(() {
            _addressValidationText = '';
          });
          final prefix = ref.read(addressPrefixProvider);
          if (!isContact &&
              Address.tryParse(text.trim(), expectedPrefix: prefix) != null) {
            FocusManager.instance.primaryFocus?.unfocus();

            setState(() {
              _sendAddressStyle = AddressStyle.TEXT90;
              _addressValidationText = '';
              _pasteButtonVisible = false;
            });
          } else if (!isContact) {
            setState(() {
              _sendAddressStyle = AddressStyle.TEXT60;
              _pasteButtonVisible = true;
            });
          } else {
            final contact = ref.read(contactsProvider).getContactWithName(text);
            if (contact == null) {
              setState(() {
                _sendAddressStyle = AddressStyle.TEXT60;
              });
            } else {
              setState(() {
                _pasteButtonVisible = false;
                _sendAddressStyle = AddressStyle.PRIMARY;
              });
            }
          }
        },
        overrideTextFieldWidget: hasUri
            ? AddressThreeLineText(
                address: widget.uri!.address.encoded,
              )
            : _addressValidAndUnfocused
                ? GestureDetector(
                    onTap: () {
                      setState(() => _addressValidAndUnfocused = false);
                      Future.delayed(Duration(milliseconds: 50), () {
                        FocusScope.of(context).requestFocus(_addressFocusNode);
                      });
                    },
                    child: AddressThreeLineText(
                      address: _addressController.text,
                    ),
                  )
                : null,
      );
    });
  }

  Widget getEnterNoteContainer() {
    return Consumer(builder: (context, ref, _) {
      final theme = ref.watch(themeProvider);
      final styles = ref.watch(stylesProvider);
      final l10n = l10nOf(context);

      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppTextField(
            padding: _noteValidAndUnfocused
                ? const EdgeInsets.symmetric(horizontal: 25, vertical: 15)
                : EdgeInsets.zero,
            focusNode: _noteFocusNode,
            controller: _noteController,
            cursorColor: theme.primary,
            style: styles.textStyleParagraphPrimary,
            inputFormatters: [
              LengthLimitingTextInputFormatter(120),
            ],
            textInputAction: TextInputAction.done,
            maxLines: null,
            autocorrect: false,
            hintText: _noteHint ?? l10n.enterNote,
            // prefixButton: TextFieldButton(
            //   icon: AppIcons.scan,
            //   onPressed: () async {
            //     FocusManager.instance.primaryFocus?.unfocus();

            //     final qr = await UserDataUtil.scanQrCode(context);
            //     final data = qr?.code;
            //     if (data == null) {
            //       return;
            //     }

            //     _noteController.text = data;
            //     _notePasteButtonVisible = false;
            //     _noteQrButtonVisible = false;

            //     setState(() => _noteValidAndUnfocused = true);
            //   },
            // ),
            fadePrefixOnCondition: true,
            prefixShowFirstCondition: _noteQrButtonVisible,
            suffixButton: TextFieldButton(
              icon: AppIcons.paste,
              onPressed: () {
                if (!_notePasteButtonVisible) {
                  return;
                }

                Clipboard.getData("text/plain").then((ClipboardData? data) {
                  final text = data?.text;
                  if (text == null || text.isEmpty) {
                    return;
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                  _noteController.text = text;
                  _notePasteButtonVisible = false;
                  _noteQrButtonVisible = false;

                  setState(() => _noteValidAndUnfocused = true);
                });
              },
            ),
            fadeSuffixOnCondition: true,
            suffixShowFirstCondition: _notePasteButtonVisible,
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  _noteQrButtonVisible = false;
                  _notePasteButtonVisible = false;
                });
              } else {
                setState(() {
                  _noteQrButtonVisible = true;
                  _notePasteButtonVisible = true;
                });
              }
            },
            overrideTextFieldWidget: _noteValidAndUnfocused
                ? GestureDetector(
                    onTap: () {
                      setState(() => _noteValidAndUnfocused = false);
                      Future.delayed(Duration(milliseconds: 50), () {
                        FocusScope.of(context).requestFocus(_noteFocusNode);
                      });
                    },
                    child: Text(
                      _noteController.text,
                      style: styles.textStyleParagraphPrimary,
                    ),
                  )
                : null,
          ),
          Visibility(
            visible: _noteHint == null && _noteController.text.isEmpty,
            child: Container(
              child: Text(
                l10n.optionalLabel,
                style: styles.textStyleTransactionAmount.copyWith(
                  color: theme.text30,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
