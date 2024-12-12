import '../../../../services/network/request/request_methods.dart';
import '../models/meal_timings.dart';
import '../models/response_model.dart';

class MenuServiceState {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final Failure? failure;
  final List<MenuResponseModel>? menuList;
  final MealTimings? timingConfig;

  const MenuServiceState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    this.failure,
    this.menuList,
    this.timingConfig,
  });

  MenuServiceState copyWith({
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    Failure? failure,
    List<MenuResponseModel>? menuList,
    MealTimings? timingConfig,
  }) {
    return MenuServiceState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      failure: failure ?? this.failure,
      menuList: menuList ?? this.menuList,
      timingConfig: timingConfig ?? this.timingConfig,
    );
  }
}
