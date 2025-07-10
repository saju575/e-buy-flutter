abstract class UrlBuilderBaseModel {
  Map<String, dynamic> toJson();
}

class UrlBuilderService {
  final String _url;
  UrlBuilderBaseModel? _paramModel;
  UrlBuilderBaseModel? _queryModel;

  UrlBuilderService({
    required String url,
    UrlBuilderBaseModel? param,
    UrlBuilderBaseModel? query,
  }) : _url = url,
       _paramModel = param,
       _queryModel = query;

  UrlBuilderService withParam(UrlBuilderBaseModel paramModel) {
    _paramModel = paramModel;
    return this;
  }

  UrlBuilderService withQuery(UrlBuilderBaseModel query) {
    _queryModel = query;
    return this;
  }

  String build() {
    String url = _url;

    // Replace path params (e.g., :id)
    if (_paramModel != null) {
      final paramJson = _paramModel!.toJson();
      paramJson.forEach((key, value) {
        if (value != null) {
          url = url.replaceAll(':$key', Uri.encodeComponent(value.toString()));
        }
      });
    }

    // Build query string
    if (_queryModel != null) {
      final queryJson = _queryModel!.toJson();
      final flattened = _flattenMap(queryJson);

      final queryString = flattened.entries
          .where((e) => e.value != null)
          .map(
            (e) =>
                '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}',
          )
          .join('&');

      if (queryString.isNotEmpty) {
        url += '?$queryString';
      }
    }

    return url;
  }

  Map<String, dynamic> _flattenMap(
    Map<String, dynamic> map, [
    String prefix = '',
  ]) {
    final result = <String, dynamic>{};

    map.forEach((key, value) {
      final newKey = prefix.isEmpty ? key : '$prefix.$key';
      if (value is Map<String, dynamic>) {
        result.addAll(_flattenMap(value, newKey));
      } else if (value is List) {
        for (var i = 0; i < value.length; i++) {
          result['$newKey[$i]'] = value[i];
        }
      } else {
        result[newKey] = value;
      }
    });

    return result;
  }
}
