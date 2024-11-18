import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../../constants/urls.dart';
import '../../../../../services/network/dio_client.dart';
import '../../../../../services/network/request/request_methods.dart';
import '../../../../../utils/logger/log_tags.dart';
import '../../../../../utils/logger/logger.dart';
import 'response_model/response_model.dart';

class MenuService {
  final NetworkRequestHandler _networkReqHandler;

  MenuService({NetworkRequestHandler? networkReqHandler})
      : _networkReqHandler = networkReqHandler ?? NetworkRequestHandler();

  Future<Either<Failure, List<MenuResponseModel>>> fetchMenu() async {
    final String url;
    if (kDebugMode) {
      url = APIUrls.menuURLDev;
    } else {
      url = APIUrls.menuURLProd;
    }

    final request = NetworkRequest(
      url: url,
      path: "",
      headers: {
        'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
        'Pragma': 'no-cache',
        'Expires': '0',
      },
    );

    try {
      final result = await _networkReqHandler.getRequest(
        request: request,
        logTag: LogTags.getMenu,
        logMsg: "Fetching Menu",
      );

      return result.fold(
        (failure) {
          debugLog(LogTags.responseError, "${failure.message}, response error");
          return Left(failure);
        },
        (response) {
          try {
            if (response.data == null) {
              return Left(Failure(
                message: 'Empty response received',
                code: response.statusCode,
              ));
            }

            final dynamic decodedData = jsonDecode(response.data);

            if (decodedData is! List) {
              return Left(
                Failure(
                  message: 'Invalid response format: expected a list',
                  code: response.statusCode,
                  data: response.data,
                ),
              );
            }

            final menuList = decodedData
                .whereType<Map<String, dynamic>>()
                .map((json) => MenuResponseModel.fromJson(json))
                .toList();

            if (menuList.isEmpty) {
              return Left(Failure(
                message: 'No menu items found',
                code: response.statusCode,
              ));
            }

            debugLog(LogTags.getMenu,
                "Successfully fetched ${menuList.length} menu items");
            return Right(menuList);
          } catch (e, stackTrace) {
            debugLog(LogTags.getMenu, "Error processing menu response: $e");
            return Left(Failure(
              message: 'Failed to process menu data: ${e.toString()}',
              stackTrace: stackTrace,
              data: response.data,
            ));
          }
        },
      );
    } catch (e, stackTrace) {
      debugLog(LogTags.getMenu, "Unexpected error: $e");
      return Left(
        Failure(
          message: 'Unexpected error: $e',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
