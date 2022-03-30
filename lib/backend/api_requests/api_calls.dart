import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RestaurantListAPICall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Restaurant List API',
      apiUrl: 'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/restaurants',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class MenuListAPICall {
  static Future<ApiCallResponse> call({
    int filterRestid = 1,
    int categValue = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Menu List API',
      apiUrl: 'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/menu',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter_restid': filterRestid,
        'categ_value': categValue,
      },
      returnBody: true,
    );
  }
}

class AddItemToCartCall {
  static Future<ApiCallResponse> call({
    int userId,
    String foodNameSoon = '',
    int foodPriceSoon,
    int foodQuanSoon,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Item to Cart',
      apiUrl: 'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/cart',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userId,
        'food_name_soon': foodNameSoon,
        'food_price_soon': foodPriceSoon,
        'food_quan_soon': foodQuanSoon,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetItemInListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Item in List',
      apiUrl: 'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/cart',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
