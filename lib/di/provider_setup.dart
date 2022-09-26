import 'package:app/data/data_source/pixabay_api.dart';
import 'package:app/data/repository/photo_api_repository_impl.dart';
import 'package:app/domain/repository/photo_api_repository.dart';
import 'package:app/domain/usecase/get_photos_usecase.dart';
import 'package:app/presentation/home/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProvider = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryImpl(api: api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUsecase>(
    update: (context, repository, _) => GetPhotosUsecase(repository),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetPhotosUsecase>()),
  ),
];
