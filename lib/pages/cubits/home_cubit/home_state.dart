part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  List<ProductModal> productsList;
  HomeSuccess({required this.productsList});
}
class HomeFailre extends HomeState {}
