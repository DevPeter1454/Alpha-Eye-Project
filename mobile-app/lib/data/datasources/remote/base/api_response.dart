class ApiResponse<T> {
  int? insertedId;
  bool success = true;
  String message = '';
  int? totalCount;
  int? pageSize;
  int? statusCode;
  int? currentPage;
  int? totalPages;
  bool? hasNext;
  bool? hasPrevious;
  T? data;

  ApiResponse(
      {this.insertedId,
      this.success = true,
      this.message = '',
      this.totalCount,
      this.pageSize,
      this.statusCode,
      this.currentPage,
      this.totalPages,
      this.hasNext,
      this.hasPrevious,
      this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    insertedId = json['insertedId'];
    success = json['isSuccess'] ?? true;
    message = json['message'] ?? '';
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    hasNext = json['hasNext'];
    hasPrevious = json['hasPrevious'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['insertedId'] = insertedId;
    data['isSuccess'] = success;
    data['message'] = message;
    data['totalCount'] = totalCount;
    data['pageSize'] = pageSize;
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['hasNext'] = hasNext;
    data['hasPrevious'] = hasPrevious;
    return data;
  }
}
