import 'dart:io';
import 'package:http/http.dart' as http;

abstract class Api {
  static const baseUrl = 'https://123.123.123.123:80/';

  static Future<String> uploadImage(File file) async {
    var request = http.MultipartRequest('POST', Uri.parse("<API-URL>/upload-file/"));
    request.files.add(http.MultipartFile.fromBytes("file", File(file.path).readAsBytesSync(), filename: file.path));
    var stream = await request.send();
    var res = await http.Response.fromStream(stream);
    return res.body;
  }
}