import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_outline.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/home_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        width: screenWidth,
        height: screenHight,
        child: Stack(
          children: [
            Positioned(
              top: screenHight * 0.1,
              left: -75,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 166,
                    width: 166,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHight * 0.3,
              right: -150,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHight * 0.1,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.5,
                      padding: const EdgeInsets.all(4),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0),
                          Constants.kGreenColor.withOpacity(0.1),
                          Constants.kGreenColor,
                        ],
                        stops: const [0.2, 0.4, 0.6, 1],
                      ),
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.8,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/img-onboarding.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHight * .05,
                    ),
                    Text(
                      'Watch movies in \n Vertual Reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.8),
                        fontSize: screenWidth >= 600 ? 18 : 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * .025,
                    ),
                    Text(
                      'Download and watch offline \n wherever you are',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.75),
                        fontSize: screenWidth >= 600 ? 12 : 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: CustomOutline(
                        strokeWidth: 4,
                        radius: screenWidth * 0.5,
                        padding: const EdgeInsets.all(4),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kPinkColor,
                            Constants.kPinkColor.withOpacity(0.5),
                            Constants.kGreenColor.withOpacity(0.5),
                            Constants.kGreenColor,
                          ],
                          stops: const [0.2, 0.4, 0.6, 1],
                        ),
                        width: screenWidth * 0.45,
                        height: screenWidth * 0.15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kPinkColor.withOpacity(0.2),
                                Constants.kGreenColor.withOpacity(0.2),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Constants.kWhiteColor.withOpacity(0.75),
                                fontSize: screenWidth * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 10),
                        Container(
                          width: screenWidth * 0.02,
                          height: screenWidth * 0.02,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.kGreenColor,
                          ),
                        ),
                        const Spacer(flex: 1),
                        Container(
                          width: screenWidth * 0.02,
                          height: screenWidth * 0.02,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.kWhiteColor.withOpacity(0.2),
                          ),
                        ),
                        const Spacer(flex: 1),
                        Container(
                          width: screenWidth * 0.02,
                          height: screenWidth * 0.02,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.kWhiteColor.withOpacity(0.2),
                          ),
                        ),
                        const Spacer(flex: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
