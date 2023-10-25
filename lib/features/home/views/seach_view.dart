import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/home/views/widgets/search_bar_widget.dart';
import 'package:job_app/features/home/views/widgets/search_view_body.dart';

import '../../../cubits/search_jobs/cubit/search_jobs_cubit.dart';
import 'home_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static String id = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchValue = "";
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: 300,
                child: SearchBarWidget(
                  controller: controller,
                  hintText: 'Type something...',
                  Icon: Icons.search,
                  onChanged: (value) {
                    setState(() {
                      controller.text;
                      searchValue = value!;
                    });
                  },
                  onSubmited: (value) {
                    setState(() {
                      controller.text;
                      searchValue = value!;

                      BlocProvider.of<SearchJobsCubit>(context)
                          .fetchSearchJobs(searchWord: searchValue);
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: searchValue.isEmpty
          ? const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("No search result yet"),
            )
          : const SearchViewBody(),
    );
  }
}
