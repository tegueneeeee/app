import 'package:app/data/data_source/result.dart';
import 'package:app/domain/model/photo.dart';
import 'package:app/domain/repository/photo_api_repository.dart';
import 'package:app/domain/usecase/get_photos_usecase.dart';
import 'package:app/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetch test ', () async {
    final viewModel = HomeViewModel(GetPhotosUsecase(FakePhotoApiRepository()));
    await viewModel.fetch('apple');
    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL":
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g9b885f092d8776bdee1af7cf7e1691d6a3afbc5dfd15ce40464035ac3742853c440188d34bc7b7ba584705d611d7070d26597c3e2a3dac4bf5a1a9ea45e3d829_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/ge341d53058f01cf5b9185cb7bd95ab3fc5c1e616c0ecee8dc7b10196348976b3ecf2910c7721b8b898b24a7df2c67fbf43b1f4712c5427472264cb8b24e214bc_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 534781,
    "downloads": 298043,
    "collections": 1973,
    "likes": 1908,
    "comments": 235,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g6ed6306024a96f5a52153c5f0516d5c8be31222dfc13ef5a2d2253425b6c367bc33a59fb4798b0b7539274a449928ee6fd0f2850af25f56390a22843552e367a_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g77b0ce8e6e38e6a5c74c2a19182c24cf053bd71355d72a34661a15ec9869723528ca05aade18edeaea4379c59b024cb2f183ad30c81c662eef3069a787792c04_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 991800,
    "downloads": 643814,
    "collections": 1341,
    "likes": 1493,
    "comments": 326,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
];
