import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetterCall {
  static Future<ApiCallResponse> call({
    String? address = '0xc80514871dfc91b9a6126b716c6c514bfa2bb4ca',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Getter',
      apiUrl: '111.229.17.159:8080/school/get',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic tokens(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class TransferCall {
  static Future<ApiCallResponse> call({
    String? to = '0xc80514871dfc91b9a6126b716c6c514bfa2bb4ca',
    String? tokens = '1',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "$to",
  "tokens": "$tokens"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'transfer',
      apiUrl: 'xia0.top:8080/school/transfer',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
