import 'dart:typed_data';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';

/// Wrapper around the Bip-39 library making it easier to deal with
/// mnemonic phrases.
class Bip39 {
  static const _separator = ' ';

  /// Returns [true] if the provided mnemonic is valid, or [false] otherwise.
  static bool validateMnemonic(List<String> mnemonic) {
    try{
      Mnemonic.fromWords(words: mnemonic).entropy;
      return true;
    }catch (e){
      return false;
    }
  }

  /// Returns a seed from the provided mnemonic that can be used to generate
  /// a new wallet.
  static Uint8List mnemonicToSeed(List<String> mnemonic) {
    return Uint8List.fromList(Mnemonic.fromWords(words: mnemonic).seed);
  }

  /// Returns a randomly generated seed phrase.
  static List<String> generateMnemonic({int strength = 128}) {
    return Mnemonic.generate(Language.english , entropyLength:  strength).words;
  }
}
