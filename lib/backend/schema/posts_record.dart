import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'gif_url')
  String get gifUrl;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'uploaded_at')
  Timestamp get uploadedAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) =>
      builder..gifUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;
}

Map<String, dynamic> createPostsRecordData({
  String gifUrl,
  DocumentReference user,
  Timestamp uploadedAt,
}) =>
    serializers.serializeWith(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..gifUrl = gifUrl
          ..user = user
          ..uploadedAt = uploadedAt));

PostsRecord get dummyPostsRecord {
  final builder = PostsRecordBuilder()
    ..gifUrl = dummyImagePath
    ..uploadedAt = dummyTimestamp;
  return builder.build();
}

List<PostsRecord> createDummyPostsRecord({int count}) =>
    List.generate(count, (_) => dummyPostsRecord);
