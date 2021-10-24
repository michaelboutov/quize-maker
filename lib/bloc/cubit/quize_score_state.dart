part of 'quize_score_cubit.dart';

abstract class QuizeScoreState extends Equatable {
  const QuizeScoreState();

  @override
  List<Object> get props => [];
}

class QuizeScoreInitialState extends QuizeScoreState {}

class QuizeScoreLoadingState extends QuizeScoreState {}

class QuizeScoreReadyState extends QuizeScoreState {
  final List<QuizeScore> quizeScoreList;

  // ignore: prefer_const_constructors_in_immutables
  QuizeScoreReadyState(this.quizeScoreList);
}

class QuizeScoreAddedState extends QuizeScoreState {
  final String userId;
  final QuizeScore record;

  const QuizeScoreAddedState(this.userId, this.record);

  @override
  List<Object> get props => [record];
}

class QuizeScoreDeletedState extends QuizeScoreState {
  final String userId;

  final String id;

  const QuizeScoreDeletedState(this.userId, this.id);

  @override
  List<Object> get props => [id];
}
