part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}
final class AddLoading extends AddState {}
final class AddSuccess extends AddState {}
final class AddFailre extends AddState {}
