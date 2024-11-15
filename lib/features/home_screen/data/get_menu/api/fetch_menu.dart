import 'dart:developer';

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
      // headers: {
      //   'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
      //   'Pragma': 'no-cache',
      //   'Expires': '0',
      // },
    );

    try {
      final result = await _networkReqHandler.getRequest<List>(
        request: request,
        logTag: LogTags.getMenu,
        logmsg: "Fetching Menu from ${request.url}",
        // fromJson: (data) => MenuResponseModel.fromJson(data),
      );

      return result.fold(
        (failure) {
          debugLog(LogTags.responseError, "${failure.message}, response error");
          return Left(failure);
        },
        (menuResponse) {
          try {
            final menuList = menuResponse
                .where((jsonItem) => jsonItem != null)
                .map((jsonItem) => MenuResponseModel.fromJson(jsonItem))
                .toList();
            log("Fetched Menu: $menuList");
            return Right(menuList);
          } catch (e, stackTrace) {
            debugLog(LogTags.exception, "Error processing menu response: $e");
            return Left(
              Failure(
                message: 'Error processing menu response: $e',
                stackTrace: stackTrace,
              ),
            );
          }
        },
      );
    } catch (e, stackTrace) {
      debugLog(LogTags.exception, "Unexpected error: $e");
      return Left(
        Failure(
          message: 'Unexpected error: $e',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
