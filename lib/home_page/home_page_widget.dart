import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../restaurant_details/restaurant_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'San Franciso New',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: RestaurantListAPICall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final listViewRestaurantListAPIResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final restaurantItems = getJsonField(
                        (listViewRestaurantListAPIResponse?.jsonBody ?? ''),
                        r'''$''',
                      )?.toList() ??
                      [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: restaurantItems.length,
                    itemBuilder: (context, restaurantItemsIndex) {
                      final restaurantItemsItem =
                          restaurantItems[restaurantItemsIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RestaurantDetailsWidget(
                                      restaurantIDPassed: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.id''',
                                      ),
                                      restProfileImage: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_image.url''',
                                      ),
                                      restEta1: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_eta_1''',
                                      ),
                                      restEta2: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_eta_2''',
                                      ),
                                      restDeliveryPrice: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_delivery_price''',
                                      ),
                                      restRatingUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_rating''',
                                      ).toString(),
                                      restCommentUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_comment''',
                                      ).toString(),
                                      restAreaUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_location''',
                                      ).toString(),
                                      restMinOrderUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_minOrder''',
                                      ),
                                      restPaymentOptionsUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_payment_options''',
                                      ).toString(),
                                      restNameUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_name''',
                                      ).toString(),
                                      restCuisineUI: getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_cuisine''',
                                      ).toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_image.url''',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        restaurantItemsItem,
                                        r'''$.rest_name''',
                                      ).toString(),
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                  ),
                                  Text(
                                    getJsonField(
                                      restaurantItemsItem,
                                      r'''$.rest_cuisine''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Icon(
                                          Icons.star_rate_rounded,
                                          color: Color(0xFF00BA14),
                                          size: 25,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 6, 0),
                                        child: Text(
                                          getJsonField(
                                            restaurantItemsItem,
                                            r'''$.rest_rating''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'San Franciso New',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.clock,
                                                color: Color(0xFF151515),
                                                size: 23,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 6, 0),
                                              child: Text(
                                                '${getJsonField(
                                                  restaurantItemsItem,
                                                  r'''$.rest_eta_1''',
                                                ).toString()}-${getJsonField(
                                                  restaurantItemsItem,
                                                  r'''$.rest_eta_2''',
                                                ).toString()} мин',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: Color(0xFFB2B2B2),
                                          size: 6,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Icon(
                                                Icons.motorcycle_rounded,
                                                color: Color(0xFF151515),
                                                size: 23,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 6, 0),
                                              child: Text(
                                                '${getJsonField(
                                                  restaurantItemsItem,
                                                  r'''$.rest_delivery_price''',
                                                ).toString()}c',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
