import 'package:flutter/material.dart';
import '../../../home/views/home_view.dart';
import 'custom_search_bar.dart';
import 'messages_list_view.dart';

class MessagesViewBody extends StatefulWidget {
  const MessagesViewBody({super.key});

  @override
  State<MessagesViewBody> createState() => _MessagesViewBodyState();
}

class _MessagesViewBodyState extends State<MessagesViewBody> {
  final int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text('Messages',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center),
          ),
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
          elevation: 0,
          backgroundColor: Colors.white),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 24,
              ),
              const CustomSearchBar(),
              const SizedBox(
                height: 24,
              ),
              MessagesListView(),
            ]),
          )),

    );
  }
}
