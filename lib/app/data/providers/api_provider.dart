import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIProvider {
  final box = GetStorage();
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://192.168.100.16:8000/api",
      contentType: 'application/json',
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status! < 500;
      }));

  Future<Response> signup(
      {required String email,
      required String name,
      required String password,
      required String confirmpass,
      File? image}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'name': name,
        'password': password,
        'password_confirmation': confirmpass,
        'avatar':
            image != null ? await MultipartFile.fromFile(image.path) : null
      });
      return await dio.post(
        '/register',
        data: formData,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } catch (e) {
      rethrow;
    }
  }

//Login function
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      return await dio.post(
        '/login',
        data: formData,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProduct() async {
    try {
      return await dio.get(
        '/products',
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProByCate(int id) async {
    try {
      return await dio.get(
        '/product-by-category/$id',
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCurrentUserLogin() async {
    try {
      final token = box.read('token');
      return await dio.get(
        '/me',
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer $token",
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> searchProduct(String name) async {
    try {
      return await dio.post(
        '/searchProduct',
        data: {
          'name': name,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
