import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/src/int64.dart';

extension NullableStringParser on NullableString {
  String? parseNullable() {
    return hasData() ? data : null;
  }
}

extension NullableTimestampParser on NullableTimestamp {
  Timestamp? parseNullable() {
    return hasData() ? data : null;
  }
}

extension NullablePostParser on NullablePost {
  PostModel? parseNullable() {
    return hasData() ? data : null;
  }
}

extension NullableArticleParser on NullableArticle {
  ArticleModel? parseNullable() {
    return hasData() ? data : null;
  }
}

extension NullableInt64Parser on NullableInt64 {
  Int64? parseNullable() {
    return hasData() ? data : null;
  }
}