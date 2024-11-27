import '../../../../services/network/request/request_methods.dart';
import '../models/response_model.dart';

class MenuServiceState {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final Failure? failure;
  final List<MenuResponseModel>? menuList;

  const MenuServiceState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    this.failure,
    this.menuList,
  });

  MenuServiceState copyWith(
      {bool? isLoading,
      bool? hasError,
      String? errorMessage,
      Failure? failure,
      List<MenuResponseModel>? menuList}) {
    return MenuServiceState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      failure: failure ?? this.failure,
      menuList: menuList ?? this.menuList,
    );
  }
}
