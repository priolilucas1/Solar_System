import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:solar_system/shared/models/data.dart';
import 'package:solar_system/shared/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientStartColor, AppColors.gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title Area
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 32, bottom: 12),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w900,
                              color: AppColors.titleTextColor,
                            ),
                          ),
                          DropdownButton(
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Solar System',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dropDownText,
                                  ),
                                ),
                              ),
                            ],
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Image.asset(
                                'assets/drop_down_icon.png',
                              ),
                            ),
                            underline: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Card Area
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 18),
                child: Swiper(
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 20,
                      space: 6,
                    ),
                  ),
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/details',
                          arguments: planets[index],
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 120,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 32),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              planets[index].name,
                                              style: TextStyle(
                                                fontSize: 44,
                                                fontWeight: FontWeight.w900,
                                                color:
                                                    AppColors.primaryTextColor,
                                              ),
                                            ),
                                            Text(
                                              'Solar System',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    AppColors.primaryTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Know More',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(planets[index].iconImage),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.navigationColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          ),
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 32,
              color: AppColors.dropDownText,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              iconSize: 32,
              color: AppColors.dropDownText,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
