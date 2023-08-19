import 'package:together/src/network/model/common/result.dart';

import 'handle.dart';

class XPagination<T> {
  XPagination({
    this.page = 1,
    this.data = const [],
    this.status = Status.none,
    this.hasMore = true,
  });

  final int page;
  final List<T> data;
  final Status status;
  final bool hasMore;

  bool get canNext => hasMore && isNone;
  bool get canLoad => hasMore && !isLoading;
  T? get lastDoc => data.isNotEmpty ? data.last : null;

  bool get isLoading => status == Status.loading;
  bool get isError => status == Status.error;
  bool get isNone => status == Status.none;

  XPagination<T> addAll(
    List<T> items, {
    int? totalPage,
    int? countData,
  }) {
    final data = [...this.data, ...items];
    return this.copyWith(
      hasMore: items.isEmpty ? false : true,
      data: data,
      page: this.page + 1,
      status: Status.none,
    );
  }

  XPagination<T> addAllFromResult(XResult<List<T>> result) {
    if (result.isSuccess) {
      return this.addAll(result.data!);
    } else {
      return this.copyWith(status: Status.error, hasMore: false);
    }
  }

  XPagination<T> toLoading() {
    return copyWith(status: Status.loading);
  }

  XPagination<T> copyWith({
    int? page,
    List<T>? data,
    Status? status,
    bool? hasMore,
  }) {
    return XPagination<T>(
      page: page ?? this.page,
      data: data ?? this.data,
      status: status ?? this.status,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
