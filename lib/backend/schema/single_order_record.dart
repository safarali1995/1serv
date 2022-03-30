import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'single_order_record.g.dart';

abstract class SingleOrderRecord
    implements Built<SingleOrderRecord, SingleOrderRecordBuilder> {
  static Serializer<SingleOrderRecord> get serializer =>
      _$singleOrderRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'current_user')
  String get currentUser;

  @nullable
  @BuiltValueField(wireName: 'food_name')
  BuiltList<String> get foodName;

  @nullable
  @BuiltValueField(wireName: 'food_price')
  BuiltList<int> get foodPrice;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SingleOrderRecordBuilder builder) => builder
    ..currentUser = ''
    ..foodName = ListBuilder()
    ..foodPrice = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('singleOrder');

  static Stream<SingleOrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SingleOrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SingleOrderRecord._();
  factory SingleOrderRecord([void Function(SingleOrderRecordBuilder) updates]) =
      _$SingleOrderRecord;

  static SingleOrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSingleOrderRecordData({
  String currentUser,
}) =>
    serializers.toFirestore(
        SingleOrderRecord.serializer,
        SingleOrderRecord((s) => s
          ..currentUser = currentUser
          ..foodName = null
          ..foodPrice = null));
