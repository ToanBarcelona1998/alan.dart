import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Represents the result that is returned when broadcasting a transaction.
class TransactionResult extends Equatable {
  /// String representing the hash of the transaction.
  /// Note that this hash is always present, even if the transaction was
  /// not sent successfully.
  final String hash;

  /// Tells if the transaction was sent successfully or not.
  final bool success;

  /// Tells which error has verified if the sending was not successful.
  /// Please note that this field is going to be:
  /// - `null` if [success] is `true`.
  /// - a valid [TransactionError] if [success] is `false`
  final TransactionError error;

  final Map<String, dynamic> raw;

  TransactionResult({
    @required this.hash,
    @required this.success,
    @required this.raw,
    this.error,
  });

  factory TransactionResult.fromException(dynamic exception) {
    return TransactionResult(
      success: false,
      hash: '',
      raw: {},
      error: TransactionError(
        errorCode: -1,
        errorMessage: exception.toString(),
      ),
    );
  }

  @override
  List<Object> get props {
    return [hash, success, error, raw];
  }

  @override
  String toString() {
    return 'TransactionResult { '
        'success: $success, '
        'hash: $hash, '
        'error: $error '
        '}';
  }
}

/// Contains the data related to an error that has occurred when
/// broadcasting the transaction.
class TransactionError extends Equatable {
  final int errorCode;
  final String errorMessage;

  TransactionError({
    @required this.errorCode,
    @required this.errorMessage,
  });

  @override
  List<Object> get props {
    return [errorCode, errorMessage];
  }

  @override
  String toString() {
    return 'TransactionError { '
        'errorCode: $errorCode, '
        'errorMessage: $errorMessage '
        '}';
  }
}
