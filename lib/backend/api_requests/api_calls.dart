import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OPT Verification Group Code

class OPTVerificationGroup {
  static String baseUrl = 'https://www.fast2sms.com/dev/';
  static Map<String, String> headers = {
    'authorization':
        'ziJq0BedSYMQRAIm9xO4EjyFtkoWCX2LKTD865cgHUN3vPG7nViOx9AMJYrsRqe1vNVSw26ZXaguEBFT',
  };
  static SmsApiCall smsApiCall = SmsApiCall();
}

class SmsApiCall {
  Future<ApiCallResponse> call({
    String? variablesValues = '',
    String? numbers = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SMS API',
      apiUrl: '${OPTVerificationGroup.baseUrl}bulkV2',
      callType: ApiCallType.POST,
      headers: {
        'authorization':
            'ziJq0BedSYMQRAIm9xO4EjyFtkoWCX2LKTD865cgHUN3vPG7nViOx9AMJYrsRqe1vNVSw26ZXaguEBFT',
      },
      params: {
        'variables_values': variablesValues,
        'route': "otp",
        'numbers': numbers,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.return''',
      );
  dynamic requestid(dynamic response) => getJsonField(
        response,
        r'''$.request_id''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End OPT Verification Group Code

class SendPDFCall {
  static Future<ApiCallResponse> call({
    int? phone,
    String? type = 'media',
    String? message = '',
    String? mediaUrl = '',
    String? instanceID = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "number": $phone,
  "type": "$type",
  "message": "$message",
  "media_url": "$mediaUrl",
  "instance_id": "$instanceID",
  "access_token": "6560bdfe3e964"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendPDF',
      apiUrl: 'https://wap.wappblaster.com/api/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic reponse(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class SendSMSCall {
  static Future<ApiCallResponse> call({
    int? phone,
    String? message = '',
    String? instanceID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "number": $phone,
  "type": "text",
  "message": "$message",
  "instance_id": "$instanceID",
  "access_token": "6560bdfe3e964"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendSMS',
      apiUrl: 'https://wap.wappblaster.com/api/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic reponse(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
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
