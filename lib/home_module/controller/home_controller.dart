import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/crypto_model.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCryptoList();
  }

  @override
  void dispose() {
    super.dispose();
    clearControllers();
  }

  http.Client? client = http.Client();
  var isLoading = false.obs;
  TextEditingController search = TextEditingController();
  var currentPageIndex = 0.obs;

  void loadingTrue() {
    isLoading(true);
  }

  void loadingFalse() {
    isLoading(false);
  }

  clearControllers() {
    isLoading(false);
  }

  var cryptoList = List<CryptoModel>.empty(growable: true).obs;
  var cryptoLogo = List<String>.empty(growable: true).obs;

 Future<dynamic> getCryptoLogoList(int id) async {
    loadingTrue();
    var api = "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info";
    Map<String, String> headers = new HashMap();
    headers = {
      "Accept": "*/*",
      "Content-Type": "keep-alive",
      "X-CMC_PRO_API_KEY": "ccadff55-953f-4df5-84a7-dbd71b181def",
    };
    final queryParameters = {
      'id': '$id',
    };
    var endpointUrl = (api);
    var queryString =
        Uri.parse(endpointUrl).replace(queryParameters: queryParameters).query;
    var requestUrl = endpointUrl + '?' + queryString;
    try {
      final response = await client!.get(
        Uri.parse(requestUrl),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return await result['data']['$id']['logo'];
      } else {
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS29lMSBCAjQxTR0YqRlx6VFwmFQQ1N-EiQGA&usqp=CAU';
      }
    } catch (e) {
      print(e);
      loadingFalse();
    }
  }

  getCryptoList() async {
    loadingTrue();
    var api =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";
    Map<String, String> headers = new HashMap();
    headers = {
      "Accept": "*/*",
      "Content-Type": "keep-alive",
      "X-CMC_PRO_API_KEY": "ccadff55-953f-4df5-84a7-dbd71b181def",
    };
    try {
      final response = await client!.get(
        Uri.parse(api),
        headers: headers,
      );
      if (response.statusCode == 200) {}
      var result = json.decode(response.body);
      for (int i = 0; i < 19; i++) {
        cryptoList.add(getCrytoData(result['data'][i]));
      print(cryptoList[i].symbol);
      }
      // return cryptoList;
    } catch (e) {
      print(e);
      loadingFalse();
    }
  }

  getCrytoData(var data)  {
    return CryptoModel(
      id: data['id'],
      symbol: data['symbol'],
      name: data['name'],
      // logo:  getCryptoLogoList(data['id']).toString(),
      price: data['quote']['USD']['price'],
      cmc: data['cmc_rank'],
      percent: data['quote']['USD']['percent_change_24h'],
    );
  }
}
