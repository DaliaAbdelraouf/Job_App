part of 'search_jobs_cubit.dart';

@immutable
abstract class SearchJobsState {}

class SearchJobsInitial extends SearchJobsState {}

class SearchJobsLoading extends SearchJobsState {}

class SearchJobsSuccess extends SearchJobsState {


  final List<JobModel> results;

  SearchJobsSuccess({required this.results});
}

class SearchJobsFailure extends SearchJobsState {
  final String errorMessage;

  SearchJobsFailure(this.errorMessage);
}
