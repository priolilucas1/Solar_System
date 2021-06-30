import 'package:flutter/material.dart';
import 'package:solar_system/shared/models/data.dart';
import 'package:solar_system/shared/themes/app_colors.dart';

class DetailsPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailsPage(this.planetInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Text(
                      planetInfo.name,
                      style: TextStyle(
                        fontSize: 56,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Solar System',
                      style: TextStyle(
                        fontSize: 31,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      planetInfo.description,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: AppColors.contentTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                planetInfo.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontSize: 247,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryTextColor.withOpacity(0.08),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
