import 'package:dio/dio.dart';
import 'dart:convert';

class NetUtils {
  Future<dynamic> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      Response response;
      print(url);
      response = await Dio().get(url);
      var res = json.decode(response.toString()); //对数据进行Json转化

      if (res['code'] == 200) {
        return res['data'];
      } else {
        print(res['msg']);
      }
    } catch (e) {
      print('error' + e);
    }
  }

  post(String url, {Map<String, String> params}) async {
    var response = await Dio().post(url, data: params);
    return response;
  }
}

var request = new NetUtils();
