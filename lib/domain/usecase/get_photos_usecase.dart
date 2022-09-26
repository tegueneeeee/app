import 'dart:math';

import 'package:app/data/data_source/result.dart';
import 'package:app/domain/model/photo.dart';
import 'package:app/domain/repository/photo_api_repository.dart';

class GetPhotosUsecase {
  final PhotoApiRepository repository;
  GetPhotosUsecase(this.repository);

  Future<Result<List<Photo>>> call(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);

    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, min(3, photos.length)));
    }, error: (message) {
      return Result.error(message);
    });
  }
}
