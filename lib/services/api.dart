import 'dart:io';
import 'package:http/http.dart' as http;

abstract class Api {
  static const baseUrl = 'https://123.123.123.123:80/';

  static Future<String> uploadImage(File file) async {
    var request = http.MultipartRequest('POST', Uri.parse("http://161.97.116.245:8000/upload-file/"));
    request.files.add(http.MultipartFile.fromBytes("file", File(file.path).readAsBytesSync(), filename: file.path));
    var stream = await request.send();
    var res = await http.Response.fromStream(stream);
    return res.body;
  }

  static Future<String> uploadImageDummy(File file) async {
    await Future.delayed(Duration(seconds: 5));
    return """
{
    "date": "08.12.07",
    "time": "16:27",
    "total": 14.84,
    "items": [
        {
            "name": "SCHWEINFURT",
            "category": "meat",
            "price": 6.4
        },
        {
            "name": "RADIESCHEN",
            "category": "vegetables",
            "price": 0.59
        },
        {
            "name": "KAESEAUFSCH.",
            "category": "dairy",
            "price": 1.39
        },
        {
            "name": "BAUCHSPECK",
            "category": "meat",
            "price": 1.19
        },
        {
            "name": "BAUCHSPECK",
            "category": "meat",
            "price": 1.19
        },
        {
            "name": "DORNFELDER",
            "category": "alcohol",
            "price": 2.49
        },
        {
            "name": "CLEMENTINEN",
            "category": "fruit",
            "price": 1.73
        },
        {
            "name": "L&M BLUE",
            "category": "cigarettes",
            "price": 6.71
        },
        {
            "name": "L&M BLUE",
            "category": "cigarettes",
            "price": 6.4
        }
    ],
    "store": {
        "name": "EDEKA",
        "address": "OSKAR-VON-MILLER-STR.6",
        "city": "SCHWEINFURT"
    }
}""";
  }
}