import 'dart:convert';
import 'package:menuapp/features/home_screen/data/state/menu_service_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../services/network/dio_client.dart';
import '../../../services/network/request/request_methods.dart';
import '../../../utils/logger/log_tags.dart';
import '../../../utils/logger/logger.dart';
import 'models/response_model.dart';

part 'fetch_menu.g.dart';

@riverpod
class FetchMenuService extends _$FetchMenuService {
  @override
  MenuServiceState build() {
    state = const MenuServiceState(isLoading: true);
    fetchMenu();
    return state;
  }

  Future<void> fetchMenu() async {
    state = state.copyWith(isLoading: true);

    final NetworkRequestHandlerNotifier networkReqHandler =
        ref.read(networkRequestHandlerNotifierProvider.notifier);

    final request = NetworkRequest();

    try {
      final result = await networkReqHandler.getRequest(
        request: request,
        logTag: LogTags.getMenu,
        logMsg: "Fetching Menu",
      );

      result.fold(
        (failure) {
          debugLog(LogTags.responseError, "${failure.message}, response error");
          state = state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: failure.message,
            failure: failure,
          );
        },
        (response) {
          try {
            if (response.data == null) {
              state = state.copyWith(
                isLoading: false,
                hasError: true,
                errorMessage: 'Empty response received',
              );
              return;
            }

            final dynamic decodedData = jsonDecode(response.data);

            if (decodedData is! List) {
              state = state.copyWith(
                isLoading: false,
                hasError: true,
                errorMessage: 'Invalid response format: expected a list',
              );
              return;
            }

            final menuList = decodedData
                .whereType<Map<String, dynamic>>()
                .map((json) => MenuResponseModel.fromJson(json))
                .toList();

            if (menuList.isEmpty) {
              state = state.copyWith(
                isLoading: false,
                hasError: true,
                errorMessage: 'No menu items found',
              );
              return;
            }

            debugLog(LogTags.getMenu,
                "Successfully fetched ${menuList.length} menu items");
            state = state.copyWith(
              isLoading: false,
              hasError: false,
              menuList: menuList,
              errorMessage: null,
              failure: null,
            );
          } catch (e, stackTrace) {
            debugLog(LogTags.getMenu, "Error processing menu response: $e");
            state = state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: 'Failed to process menu data: $e',
            );
          }
        },
      );
    } catch (e) {
      debugLog(LogTags.getMenu, "Unexpected error: $e");
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'Unexpected error: $e',
      );
    }
  }
}
