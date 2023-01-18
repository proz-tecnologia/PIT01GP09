abstract class AddTransactionState {}

class AddTransactionInitialState extends AddTransactionState {}

class AddTransactionLoadingState extends AddTransactionState {}

class AddTransactionSuccessState extends AddTransactionState {}

class AddTransactionErrorState extends AddTransactionState {
  final String message;
  AddTransactionErrorState(this.message);
}
