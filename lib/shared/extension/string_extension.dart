extension StringExtension on String {
  String addQueryParameter(Map<String, dynamic> query) {
    if (query.isEmpty) return this;
    return Uri(path: this, queryParameters: query).toString();
  }

  String redirect({
    String? redirect,
    bool? clearRoute,
  }) {
    return addQueryParameter(
      {
        if (redirect != null) 'redirect': redirect,
        if (clearRoute != null) 'clearPreviousRoute': clearRoute.toString(),
      },
    );
  }

  String truncate({int maxLength = 10}) {
    return length > maxLength ? '${substring(0, maxLength)}…' : this;
  }
}
