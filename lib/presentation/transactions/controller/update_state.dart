abstract class UpdateState {}

class UpdateInitialState extends UpdateState {}

class UpdateLoadingState extends UpdateState {}

class UpdateSuccessState extends UpdateState {}

class UpdateErrorState extends UpdateState {
  final String message;
  UpdateErrorState(this.message);
}
