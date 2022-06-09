class FilterController {
  final List<Function(Map<String, String> filter)> _listeners = [];

  void addFilterChangeListener(Function(Map<String, String>) listener) {
    _listeners.add(listener);
  }

  void removeFilterChangeListener(Function(Map<String, String>) listener) {
    _listeners.remove(listener);
  }

  void setFilter(Map<String, String> filter) {
    for (var element in _listeners) {
      element.call(filter);
    }
  }
}
