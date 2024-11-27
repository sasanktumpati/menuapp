import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:menuapp/constants/urls.dart';
import 'package:menuapp/features/home_screen/data/state/menu_service_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/network/dio_client.dart';
import '../../../services/network/request/request_methods.dart';
import '../../../utils/logger/log_tags.dart';
import '../../../utils/logger/logger.dart';
import 'models/meal_timings.dart';
import 'models/response_model.dart';

part 'fetch_menu.g.dart';

@riverpod
class FetchMenuService extends _$FetchMenuService {
  @override
  MenuServiceState build() {
    state = const MenuServiceState(isLoading: true);
    _initializeData();
    return state;
  }

  Future<void> _initializeData() async {
    await Future.wait([
      fetchMenu(),
      fetchTimings(),
    ]);
  }

  Future<void> fetchTimings() async {
    final NetworkRequestHandlerNotifier networkReqHandler =
        ref.read(networkRequestHandlerNotifierProvider.notifier);

    final request = NetworkRequest(
      path: APIUrls.timingsURLProd,
    );

    try {
      final result = await networkReqHandler.getRequest(
        request: request,
        logTag: LogTags.getTimings,
        logMsg: "Fetching Timings",
      );

      result.fold(
        (failure) async {
          debugLog(
              LogTags.responseError, "${failure.message}, timing fetch error");

          // final box = await Hive.openBox('timingBox');
          // if (box.containsKey('timingConfig')) {
          //   final timingConfigJson = box.get('timingConfig');
          //   final timingConfig = MealTimings.fromJson(timingConfigJson);
          //   state = state.copyWith(timingConfig: timingConfig);
          // } else {
          //   state = state.copyWith(
          //     hasError: true,
          //     errorMessage: 'Failed to fetch timing d ata: ${failure.message}',
          //   );
          //   return;
          // }

          state = state.copyWith(
            hasError: true,
            errorMessage: 'Failed to fetch timing d ata: ${failure.message}',
          );
        },
        (response) async {
          try {
            if (response.data == null) {
              debugLog(LogTags.getTimings, "Received null timing data");

              state = state.copyWith(timingConfig: _getDefaultTimingConfig());
              return;
            }

            dynamic decodedData;
            if (response.data is String) {
              decodedData = jsonDecode(response.data);
            } else {
              decodedData = response.data;
            }

            if (decodedData == null) {
              debugLog(
                  LogTags.getTimings, "Decoded data is null, using defaults");
              state = state.copyWith(timingConfig: _getDefaultTimingConfig());
              return;
            }

            final timingConfig = MealTimings.fromJson(decodedData);
            state = state.copyWith(timingConfig: timingConfig);
            debugLog(LogTags.getTimings,
                "Successfully processed timing configuration");

            // final box = await Hive.openBox('timingBox');
            // await box.clear();
            // await box.put('timingConfig', timingConfig.toJson());
          } catch (e) {
            debugLog(
                LogTags.getTimings, "Error processing timing response: $e");

            state = state.copyWith(timingConfig: _getDefaultTimingConfig());
          }
        },
      );
    } catch (e) {
      debugLog(LogTags.getTimings, "Unexpected timing error: $e");
      state = state.copyWith(
        hasError: true,
        errorMessage: 'Unexpected error fetching timings: $e',
      );
    }
  }

  MealTimings _getDefaultTimingConfig() {
    final defaultDayTimings = Timings(
      breakfast: MealType(type: 'breakfast', start: '7:30', end: '9:30'),
      lunch: MealType(type: 'lunch', start: '12:00', end: '14:00'),
      dinner: MealType(type: 'dinner', start: '19:00', end: '21:00'),
    );

    return MealTimings(
      defaultTimings: defaultDayTimings,
      sundayTimings: defaultDayTimings,
      specialDays: [],
      meta: Meta(timezone: 'IST', lastUpdated: DateTime.now(), version: '1.0'),
    );
  }

  Future<void> fetchMenu() async {
    state = state.copyWith(isLoading: true);

    final NetworkRequestHandlerNotifier networkReqHandler =
        ref.read(networkRequestHandlerNotifierProvider.notifier);

    final request = NetworkRequest(
      path: APIUrls.menuURLProd,
    );

    try {
      final result = await networkReqHandler.getRequest(
        request: request,
        logTag: LogTags.getMenu,
        logMsg: "Fetching Menu",
      );

      result.fold(
        (failure) async {
          debugLog(LogTags.responseError, "${failure.message}, response error");

          // final box = await Hive.openBox('menuBox');
          // if (box.containsKey('menuList')) {
          //   final menuListJson = box.get('menuList');
          //   final menuList = (menuListJson as List)
          //       .map((e) => MenuResponseModel.fromJson(e))
          //       .toList();
          //   state = state.copyWith(
          //     isLoading: false,
          //     hasError: false,
          //     menuList: menuList,
          //     errorMessage: null,
          //     failure: null,
          //   );
          // } else {
          //   state = state.copyWith(
          //     isLoading: false,
          //     hasError: true,
          //     errorMessage: failure.message,
          //     failure: failure,
          //   );
          // }

          state = state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: failure.message,
            failure: failure,
          );
        },
        (response) async {
          await _processMenuResponse(response);
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

  Future<void> _processMenuResponse(Response response) async {
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
          .where((menu) => menu != null)
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

      // try {
      //   final box = await Hive.openBox('menuBox');
      //   // await box.clear();
      //   await box.put('menuList', menuList.map((e) => e.toJson()).toList());
      // } catch (e) {
      //   debugLog(LogTags.getMenu, "Error saving to Hive: $e");
      // }
    } catch (e, stackTrace) {
      debugLog(
          LogTags.getMenu, "Error processing menu response: $e, $stackTrace");
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'Failed to process menu data: $e',
      );
    }
  }
}
