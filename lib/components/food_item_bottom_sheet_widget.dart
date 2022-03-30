import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../test_cart/test_cart_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemBottomSheetWidget extends StatefulWidget {
  const FoodItemBottomSheetWidget({
    Key key,
    this.restImafeModal,
    this.foodNameModal,
    this.foodDescrpModal,
    this.foodPriceModal,
    this.foodID,
    this.existingQuantityXano,
  }) : super(key: key);

  final String restImafeModal;
  final String foodNameModal;
  final String foodDescrpModal;
  final int foodPriceModal;
  final int foodID;
  final int existingQuantityXano;

  @override
  _FoodItemBottomSheetWidgetState createState() =>
      _FoodItemBottomSheetWidgetState();
}

class _FoodItemBottomSheetWidgetState extends State<FoodItemBottomSheetWidget> {
  int cartTotal;
  int countControllerValue;
  int getCounterSpecFood;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        getCounterSpecFood = await actions.itemCounterState(
          widget.foodNameModal,
        );

        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.restImafeModal,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
              child: Text(
                widget.foodNameModal,
                style: FlutterFlowTheme.of(context).title1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
              child: Text(
                widget.foodDescrpModal,
                style: FlutterFlowTheme.of(context).subtitle1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                        child: Text(
                          '${widget.foodPriceModal.toString()}c',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x009E9E9E),
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? Color(0xFFFF5252)
                                    : Color(0x74FF5252),
                                size: 18,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color: enabled
                                    ? Color(0xFFFF5252)
                                    : Color(0x74FF5252),
                                size: 18,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: TextStyle(
                                  fontFamily: 'Proxy Nova',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              count: countControllerValue ??= functions
                                  .getQuantityFoodItem(widget.foodNameModal),
                              updateCount: (count) =>
                                  setState(() => countControllerValue = count),
                              stepSize: 1,
                              minimum: 1,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: double.infinity,
                height: 7,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                    child: Text(
                      'Особое требование ?',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'San Franciso New',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      cartTotal = await actions.calculateCartTotal();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestCartWidget(
                            cartTotalFinal: cartTotal,
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    text: 'Добавить ',
                    options: FFButtonOptions(
                      width: 85,
                      height: 25,
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'San Franciso New',
                                color: FlutterFlowTheme.of(context).alternate,
                                useGoogleFonts: false,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
              child: InkWell(
                onTap: () async {
                  await AddItemToCartCall.call(
                    userId: 13,
                    foodNameSoon: widget.foodNameModal,
                    foodPriceSoon: widget.foodPriceModal,
                    foodQuanSoon: countControllerValue,
                  );
                  setState(() =>
                      FFAppState().cartOnlyPrices.add(widget.foodPriceModal));
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5252),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добавить в корзину ',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'San Franciso New',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                useGoogleFonts: false,
                              ),
                        ),
                        Text(
                          functions
                              .getTotalCostFoodItem(widget.foodNameModal)
                              .toString(),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'San Franciso New',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                useGoogleFonts: false,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
