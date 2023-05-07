import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app/components/masked_image.dart';
import 'package:movie_app/components/search_field.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_detailes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.kBlackColor,
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5),
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
                top: screenHeight * 0.5,
                right: -100,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: const SizedBox(
                      height: 166,
                      width: 166,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -150,
                left: -150,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5),
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
              SafeArea(
                bottom: false,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  children: [
                    SizedBox(
                      height: screenHeight * .05,
                    ),
                    Text(
                      'What would you \n like to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.8),
                        fontSize: screenWidth >= 600 ? 18 : 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .04,
                    ),
                    const SearchField(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    SizedBox(
                      height: screenWidth * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Popular Movies',
                        style: TextStyle(
                          color: Constants.kWhiteColor.withOpacity(0.6),
                          fontSize: 17,
                          letterSpacing: -.41,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MovieDetails(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.1, //39 pixel
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                          color: Constants.kWhiteColor.withOpacity(0.6),
                          fontSize: 17,
                          letterSpacing: -.41,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == upcomingMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.1, //39 pixel
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Box Office',
                        style: TextStyle(
                          color: Constants.kWhiteColor.withOpacity(0.6),
                          fontSize: 17,
                          letterSpacing: -.41,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: boxOffice.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == upcomingMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: boxOffice[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.2),
                Constants.kGreenColor.withOpacity(0.2),
              ],
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kGreenColor,
                ],
              ),
            ),
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: const Color(0xff404c57),
              shape: const CircleBorder(),
              child: SvgPicture.asset(Constants.kIconPlus),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GlassmorphicContainer(
          width: screenWidth,
          height: 60,
          borderRadius: 0,
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kWhiteColor.withOpacity(0.1),
              Constants.kWhiteColor.withOpacity(0.1),
            ],
          ),
          border: 0,
          blur: 30,
          borderGradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ],
          ),
          child: BottomAppBar(
            elevation: 0,
            notchMargin: 4,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconHome),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconPlayOnTv),
                  ),
                ),
                const Expanded(child: Text('')),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconCategories),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconDownload),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
