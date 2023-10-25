part of 'add_cv_portfolio_cubit.dart';

@immutable
abstract class AddCvPortfolioState {}

class AddCvPortfolioInitial extends AddCvPortfolioState {}

class AddCvPortfolioLoading extends AddCvPortfolioState {}

class AddCvPortfolioSuccess extends AddCvPortfolioState {
  
}

class AddCvPortfolioFailure extends AddCvPortfolioState {
  final String errorMessage;

  AddCvPortfolioFailure(this.errorMessage);
}
