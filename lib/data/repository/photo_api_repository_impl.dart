// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/data/data_source/pixabay_api.dart';
import 'package:app/data/data_source/result.dart';
import 'package:app/domain/model/photo.dart';
import 'package:app/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl({
    required this.api,
  });

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
