import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/api_model.dart';
import '../seach_view.dart';
import 'featured_jop_future_builder.dart';
import 'featured_recent_job_future_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? username = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final token = await getTokenFromSharedPreferences();
    if (token != null) {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      print("toooooooooooooken$token");

      try {
        final response = await dio.get(
          'https://project2.amit-learning.com/api/auth/profile',
        );
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = response.data;
          // final String? name = data['name'];
          final String? name = data['data']['name'];
          final int userID = data['data']['id']; // Assign userID
          await SharedPreferencesUtil().saveID(userID);
          print("user iddddddddddddddddddddddd");
          print('User ID: $userID');
          log(userID);
          print('Response Data: $data');
          if (name != null && name is String) {
            setState(() {
              username = name;
            });
          } else {
            print("Name is not a valid string: $name");
          }
        } else {
          print("Error: ${response.statusCode}");
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print("Token is null");
    }
  }

  Future<String?> getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: username == null
            ? const CircularProgressIndicator() // Display a loading indicator
            : (username?.isEmpty ?? true)
                ? const Text('please wait') // Display an error message
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              'Hi, $username',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              '👋',
                              style: TextStyle(fontSize: 24),
                            ),
                          ]), // Display the username
                          const SizedBox(height: 15),
                          const Text(
                            'Create a better future for yourself here',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 20),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchView(),
                                ),
                              );
                              // Navigator.pushNamed(context, SearchView.id);
                            },
                            child: Container(
                              width: 370,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              child: const IgnorePointer(
                                // Use IgnorePointer to allow taps to pass through to the GestureDetector
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text(
                                'Suggested Job',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 180),
                              TextButton(
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          const FeaturedJopFutureBuilder(),
                          const SizedBox(height: 20),

                          Row(
                            children: [
                              const Text(
                                'Recent Job',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 180),
                              TextButton(
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          const FeaturedRecentJobFutureBuilder(),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
