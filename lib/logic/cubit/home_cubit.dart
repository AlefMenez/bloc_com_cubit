import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../models/movie.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError('Não foi possível carregar a lista de fimes'));
    }
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(HomeLoading());

    try {
      final movies = await homeService.fetchMoviesByGenre(genre);
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError('Não foi possível carregar os filmes desse gênero'));
    }
  }
}
