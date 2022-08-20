import 'package:alpha/utils/navigation/printer.dart';
import 'package:dio/dio.dart';
import '../../api/url.dart';


class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  var dio = Dio();

  void update(token) {
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      headers: {'Authorization': "Bearer " + token},
      connectTimeout: 180000,
      receiveTimeout: 180000,
    );

    dio = Dio(options);
  }

  void create() {
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: 180000,
      receiveTimeout: 180000,
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          printer("= = = Dio Request = = =");
          printer(options.headers);
          printer(options.contentType);

          printer(options.extra);

          printer(options.baseUrl + "" + options.path);

          printer(options.data);
          printer("= = = Dio End = = =");
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          printer(error.message);
          return handler.next(error);
        },
        onResponse: (Response response, handler) {
          printer("= = = Dio Response = = =");
          printer(response.data);
          printer(response.extra);
          printer(response.statusCode);
          printer(response.statusMessage);
          printer("= = = Dio End = = =");
          return handler.next(response);
        },
      ),
    );
  }
}

Future<Response> postHttp({
  required String path,
  dynamic data,
}) async {
  return DioSingleton.instance.dio.post(path, data: data);
}

Future getHttp({required String path}) async {
  return DioSingleton.instance.dio.get(path);
}

Future<Response> postWithoutBase({required String path, dynamic data}) async {
  return Dio().post(path, data: data);
}
