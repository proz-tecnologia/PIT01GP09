abstract class DeleteState {}

class DeleteInitialState extends DeleteState {}

class DeleteLoadingState extends DeleteState {}

class DeleteSuccessState extends DeleteState {}

class DeleteErrorState extends DeleteState {
  final String message;
  DeleteErrorState(this.message);
}
