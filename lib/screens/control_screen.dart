import '../screens/result_screen.dart';
import '../screens/colors.dart';
import 'package:flutter/material.dart';

int weight = 35;
int height = 140;

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key, required this.isMle});
  final bool isMle;

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  late Color kMain;

  @override
  void initState() {
    super.initState();
    kMain = widget.isMle ? kBlue : kRed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: kMain,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'BMI',
                                style: TextStyle(
                                  color: kMain,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.isMle ? 'Male' : 'Female',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                              Icon(
                                widget.isMle ? Icons.male : Icons.female,
                                color: kMain,
                                size: 70,
                              ),
                              const Text(
                                'Weight (KG)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 40,
                            itemBuilder: (BuildContext context, int index) {
                              int i = (index + 5) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        weight = i;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        '$i',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: weight == i ? 30 : 20,
                                          color: weight == i
                                              ? kMain
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: kMain),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 48),
                        const Text(
                          'Height\n (CM)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 17,
                            itemBuilder: (BuildContext context, int index) {
                              int i = (index + 25) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        height = i;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        '$i',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: height == i
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: height == i ? 24 : 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width * 2 / 3 - 30,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffF57C00)),
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xffffffff)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                          height: height, weight: weight, isMale: widget.isMle);
                    },
                  ),
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
