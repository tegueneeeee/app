import 'package:app/data/data_source/result.dart';
import 'package:app/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
