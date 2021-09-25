import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singapore_company_task/constants/config/db_configuration.dart';

class OrderListService{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var dio = Dio();

  Future<dynamic> fetchOrderList() async{

    final options = await getDioOptions();

    final _orderData =
    {
      "orderId":56,
    };
    final orderResponse = await dio.post(
      "$baseApiUrl/orders",
      data: _orderData,
      options: options,
    );

    return orderResponse.data;
  }

  Future<Options> getDioOptions() async {

    final SharedPreferences prefs = await _prefs;

    final _token = prefs.get("token");
    return Options(headers: {
      'Authorization': 'Bearer ${_token.toString()}',
    });
  }
}