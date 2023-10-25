import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/home/views/widgets/search_list_view.dart';

import '../../../../cubits/search_jobs/cubit/search_jobs_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final pageHight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchJobsCubit, SearchJobsState>(
            builder: (context, state) {
              if (state is SearchJobsSuccess) {
                final searchResults = state.results;
                if (state.results.isNotEmpty) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenWidth,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xfffffe5e7eb),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Featuring 120+ jobs",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SearchListView(
                          jobs: state.results,
                        ),
                      )
                    ],
                  );
                } else {
                  return const Text("There is no search result for this");
                }
              } else if (state is SearchJobsFailure) {
                return Text('Search Failed: ${state.errorMessage}');
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: pageHight * 0.3),
                  child: const CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
