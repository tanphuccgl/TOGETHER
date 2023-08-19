import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/network/widgets/dialogs/toast_wrapper.dart';

class StatePageMessage<T> {
  final String? message;

  final List<T>? data;

  PageStatus status;
  int page;

  bool hasMore;

  bool get canNext => hasMore == true && isLoading == false;

  T? get lastDoc {
    if (data?.isNotEmpty == true) {
      return data!.last;
    }
    return null;
  }

  StatePageMessage(
      {this.message,
      this.hasMore = true,
      this.data,
      this.status = PageStatus.initial,
      this.page = 0});

  factory StatePageMessage.initial() {
    return StatePageMessage();
  }

  bool get isInitial => status == PageStatus.initial;

  bool get isLoading => status == PageStatus.loading;

  bool get isCompleted => status == PageStatus.success;

  bool get isError => status == PageStatus.error;

  StatePageMessage<T> loading() {
    if (canNext == true && status != PageStatus.initial) {
      return StatePageMessage(
          data: data, page: page, status: PageStatus.loading);
    } else {
      return StatePageMessage();
    }
  }

  StatePageMessage<T> result(XResult<List<T>> result) {
    hasMore = (result.data ?? []).isEmpty ? false : true;
    status = result.status;

    final List<T> items = [
      ...data ?? [],
      ...result.data ?? [],
    ];
    if (items.isNotEmpty && canNext == false) {
      XToast.show('End List');
    }
    if (canNext) {
      page++;
    }
    return StatePageMessage(
        status: status,
        message: result.error,
        data: items,
        page: page,
        hasMore: hasMore);
  }
}

enum PageStatus { initial, loading, error, success }
