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
    int userId = 13,
    int foodNameSoon = 1,
    int foodPriceSoon = 55,
    int foodQuanSoon = 2,
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
  static Future<ApiCallResponse> call({
    String foodNameBSheet = '',
    bool forBottomSheet = false,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Item in List',
      apiUrl: 'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/cart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'food_name_bSheet': foodNameBSheet,
        'forBottomSheet': forBottomSheet,
      },
      returnBody: true,
    );
  }
}

class EditItemCounterAddCall {
  static Future<ApiCallResponse> call({
    int cartId,
    int userId,
    int foodNameSoon,
    int foodPriceSoon,
    int foodQuanSoon,
    int incerementAdd,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Item CounterAdd',
      apiUrl:
          'https://xqe6-qgw3-z0sx.n7.xano.io/api:qcpA0em5/Edit_Cart_with_Counter',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'cart_id': cartId,
        'user_id': userId,
        'food_name_soon': foodNameSoon,
        'food_price_soon': foodPriceSoon,
        'food_quan_soon': foodQuanSoon,
        'incerement_add': incerementAdd,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
