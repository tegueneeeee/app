import 'dart:async';

import 'package:app/data/data_source/result.dart';
import 'package:app/domain/model/photo.dart';
import 'package:app/domain/usecase/get_photos_usecase.dart';
import 'package:app/presentation/home/home_state.dart';
import 'package:app/presentation/home/home_ui_event.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUsecase getPhotosUsecase;

  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.getPhotosUsecase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUsecase(query);

    result.when(success: (photos) {
      _state = state.copyWith(photos: photos);
      notifyListeners();
    }, error: (message) {
      _eventController.add(HomeUiEvent.showSnackBar(message));
    });
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
