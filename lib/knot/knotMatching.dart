import 'package:flutter/material.dart';
import 'dart:async';

import 'package:navbar/knot/matchedPage.dart';

class KnotMatchingPage extends StatefulWidget {
  const KnotMatchingPage({super.key});

  @override
  _KnotMatchingPageState createState() => _KnotMatchingPageState();
}

class _KnotMatchingPageState extends State<KnotMatchingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;
  bool _isInitialLayout = true;
  bool _loadingVisible = false;
  bool _flashVisible = false;
  double _progress = 0.0;
  int _percentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleKnotButtonPress() {
    if (_isAnimating) return;
    setState(() {
      _isAnimating = true;
      _isInitialLayout = false;
    });

    _startQuizAnimation();
  }

  Future<void> _startQuizAnimation() async {
    _startQuizWithDelay('n1', 0);
    _startQuizWithDelay('n2', 100);
    _startQuizWithDelay('n3', 200);
    _startQuizWithDelay('n4', 300);

    await Future.delayed(const Duration(seconds: 3));
    _controller.stop();

    _startLoadingEffect();
  }

  Future<void> _startQuizWithDelay(String quizName, int delay) async {
    await Future.delayed(Duration(milliseconds: delay));
    _controller.repeat();
  }

  Future<void> _startLoadingEffect() async {
    setState(() {
      _loadingVisible = true;
      _progress = 0.0;
      _percentage = 0;
    });

    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        _progress = i / 100.0;
        _percentage = i;
      });
    }

    setState(() {
      _loadingVisible = false;
    });

    _triggerFlashEffect();
  }

  Future<void> _triggerFlashEffect() async {
    setState(() {
      _flashVisible = true;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    setState(() {
      _flashVisible = false;
    });

    // Navigate to the MatchedPage when the flash effect is done
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchedPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.asset('assets/knot/soulee.png', height: 60),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: Text(
                              "KNOTS",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset('assets/knot/Knot.png', height: 30),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: Text(
                              "CONNECTIONS",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/knot/Souls 1.png'),
                ),
              ),
              Expanded(
                child: _isInitialLayout
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildStaticQuizOption(
                              'assets/knot/n1.png', screenWidth),
                          buildStaticQuizOption(
                              'assets/knot/n2.png', screenWidth),
                          buildStaticQuizOption(
                              'assets/knot/n3.png', screenWidth),
                          buildStaticQuizOption(
                              'assets/knot/n4.png', screenWidth),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return buildSlidingQuizOptionWithTrace(
                                  'assets/knot/n1.png',
                                  0,
                                  _animation,
                                  screenWidth);
                            },
                          ),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return buildSlidingQuizOptionWithTrace(
                                  'assets/knot/n2.png',
                                  1,
                                  _animation,
                                  screenWidth);
                            },
                          ),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return buildSlidingQuizOptionWithTrace(
                                  'assets/knot/n3.png',
                                  2,
                                  _animation,
                                  screenWidth);
                            },
                          ),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return buildSlidingQuizOptionWithTrace(
                                  'assets/knot/n4.png',
                                  3,
                                  _animation,
                                  screenWidth);
                            },
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _handleKnotButtonPress,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.redAccent,
                        child: Image.asset('assets/knot/Knot.png', height: 30),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: Row(
                            children: [
                              Icon(Icons.filter_list),
                              Text("FILTER"),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: Text("BACKWARD"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_loadingVisible)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRect(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: _progress,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Text(
                        "$_percentage%",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_flashVisible)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: _flashVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: Container(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildStaticQuizOption(String imagePath, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Image.asset(
        imagePath,
        width: screenWidth * 1,
        height: 80,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildSlidingQuizOptionWithTrace(String imagePath, int index,
      Animation<double> animation, double screenWidth) {
    double quizPositionOffset = index % 2 == 0
        ? (screenWidth + 250) * animation.value - 300
        : -(screenWidth + 250) * animation.value + 300;

    int trailCount = 7;
    double trailSpacing = 40.0;

    return SizedBox(
      width: screenWidth,
      height: 80,
      child: Stack(
        children: List.generate(trailCount, (i) {
          double trailDelayFactor = (1 - (i / trailCount));
          double trailOffset = quizPositionOffset - (i * trailSpacing);
          double trailOpacity = animation.value > 0.9 && i == trailCount - 1
              ? trailDelayFactor * (2 - animation.value)
              : trailDelayFactor * (1 - animation.value);

          return Positioned(
            left: trailOffset,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: trailOpacity,
              child: Image.asset(
                imagePath,
                width: screenWidth * 1,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
      ),
    );
  }
}