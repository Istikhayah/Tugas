import 'package:flutter/material.dart';
import 'package:news2/models/on_boarding_model.dart';
import 'package:news2/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int curentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const Text(
              'News',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
            Expanded(child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  curentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[index].image,
                        height: 300,
                      ),
                      Text(
                        contents[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[index].description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, 
              (index) => buildDot(index, context),
              ),
            ),
            Container(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if(curentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage(),
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: const Duration(microseconds: 100),
                    curve: Curves.bounceIn,
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFF39E3A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  curentIndex == contents.length - 1 ? 'Continue' : 'Next',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ],
        ), 
        ),
    );
  }

  buildDot(int index, BuildContext context)
  {
    return Container(
      height: 10,
      width: curentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade500,
      ),
    );
  }
}