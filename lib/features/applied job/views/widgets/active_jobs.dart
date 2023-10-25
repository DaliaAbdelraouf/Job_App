import 'package:flutter/material.dart';

class ActiveJobs extends StatelessWidget {
  const ActiveJobs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: 35,
          decoration: const BoxDecoration(
            color: Color(0xfffffe5e7eb),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "1 Jobs",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/images/Twitter Logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "UI/UX Designer",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Twitter",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, bottom: 0),
              child: Image.asset(
                "assets/images/Property 1=outline.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue.withOpacity(0.15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Full Time",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue.withOpacity(0.15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Senior",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  const Text(
                    "Posted 2 days ago",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, top: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 0.6,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Biodata",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Type of work",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Upload Portfolio",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Divider(color: Colors.black.withOpacity(0.4)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
