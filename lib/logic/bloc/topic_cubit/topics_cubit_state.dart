part of 'topics_cubit_cubit.dart';

@immutable
abstract class TopicsCubitState extends Equatable {}

class TopicsCubitInitial extends TopicsCubitState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TopicsLoading extends TopicsCubitState {
  @override
  List<Object?> get props => [];
}

class TopicsError extends TopicsCubitState {
  final String? errMessage;

  TopicsError(this.errMessage);
  @override
  List<Object?> get props => [errMessage];
}

class TopicsSuccess extends TopicsCubitState {
  final List<TopicModel> topics;

  TopicsSuccess(this.topics);

  @override
  List<Object?> get props => [topics];
}
