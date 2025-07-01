class DataType {
  static string(dynamic value) {
    return value == null ? '' : value.toString();
  }
}
