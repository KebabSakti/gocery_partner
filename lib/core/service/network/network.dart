import 'package:get/get.dart';

abstract class RequestInterface {
  Future<dynamic> get(String path, {Map<String, dynamic>? query});

  Future<dynamic> post(String path,
      {dynamic data, Map<String, dynamic>? query});

  Future<dynamic> put(String path, {dynamic data, Map<String, dynamic>? query});

  Future<dynamic> delete(String path,
      {dynamic data, Map<String, dynamic>? query});
}

abstract class UploadInterface {
  Future<dynamic> upload(String path, {required FormData formData});
}

abstract class DownloadInterface {
  Future<dynamic> download(String path, {String? savePath});
}

abstract class Network
    implements RequestInterface, UploadInterface, DownloadInterface {
  Future<Network> init();
}

class NetworkImpl implements Network {
  NetworkImpl({required this.implementation});

  final Network implementation;

  @override
  Future<Network> init() async {
    return await implementation.init();
  }

  @override
  Future get(String path, {Map<String, dynamic>? query}) async {
    return await init()
        .then((instance) async => await instance.get(path, query: query));
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? query}) async {
    return await init().then((instance) async =>
        await instance.post(path, data: data, query: query));
  }

  @override
  Future delete(String path, {data, Map<String, dynamic>? query}) async {
    return await init().then((instance) async =>
        await instance.delete(path, data: data, query: query));
  }

  @override
  Future put(String path, {data, Map<String, dynamic>? query}) async {
    return await init().then(
        (instance) async => await instance.put(path, data: data, query: query));
  }

  @override
  Future download(String path, {String? savePath}) async {
    return await init().then((instance) async => await instance.download(path));
  }

  @override
  Future upload(String path, {required FormData formData}) async {
    return await init().then(
        (instance) async => await instance.upload(path, formData: formData));
  }
}
