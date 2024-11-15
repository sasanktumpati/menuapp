import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../log_tags.dart';
import '../logger.dart';

class ProvObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    debugLog(
      LogTags.providerObserver,
      "Provider $provider was initialized with $value",
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    debugLog(
      LogTags.providerObserver,
      "Provider $provider was disposed",
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugLog(
      LogTags.providerObserver,
      "Provider $provider updated from $previousValue to $newValue",
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    debugLog(
      LogTags.providerObserver,
      "Provider $provider threw $error at $stackTrace",
    );
  }
}
