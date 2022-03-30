import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'restaurants_record.g.dart';

abstract class RestaurantsRecord
    implements Built<RestaurantsRecord, RestaurantsRecordBuilder> {
  static Serializer<RestaurantsRecord> get serializer =>
      _$restaurantsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'rest_comment')
  String get restComment;

  @nullable
  @BuiltValueField(wireName: 'rest_name')
  String get restName;

  @nullable
  @BuiltValueField(wireName: 'rest_cuisine')
  String get restCuisine;

  @nullable
  @BuiltValueField(wireName: 'rest_image')
  String get restImage;

  @nullable
  @BuiltValueField(wireName: 'rest_rating')
  double get restRating;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RestaurantsRecordBuilder builder) => builder
    ..restComment = ''
    ..restName = ''
    ..restCuisine = ''
    ..restImage = ''
    ..restRating = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RestaurantsRecord._();
  factory RestaurantsRecord([void Function(RestaurantsRecordBuilder) updates]) =
      _$RestaurantsRecord;

  static RestaurantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRestaurantsRecordData({
  String restComment,
  String restName,
  String restCuisine,
  String restImage,
  double restRating,
}) =>
    serializers.toFirestore(
        RestaurantsRecord.serializer,
        RestaurantsRecord((r) => r
          ..restComment = restComment
          ..restName = restName
          ..restCuisine = restCuisine
          ..restImage = restImage
          ..restRating = restRating));
