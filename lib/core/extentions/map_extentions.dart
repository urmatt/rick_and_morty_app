extension MapToUrlParams on Map<String, String> {
  String toUrlParams() {
    var uri = Uri(queryParameters: this);
    return uri.query;
  }
}
