import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/globals.dart';
import 'widgets/carousel.dart';
import 'widgets/cv_section.dart';
import 'widgets/education_section.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';
import 'widgets/ios_app_ad.dart';
import 'widgets/portfolio_stats.dart';
import 'widgets/skill_section.dart';
import 'widgets/sponsors.dart';
import 'widgets/testimonial_widget.dart';
import 'widgets/website_ad.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: sideDrawer(context),
      // body
      body: _body(context),
    );
  }

//////////////////////////////////////////////
/////////Widget Methods /////////////////////
////////////////////////////////////////////

  Drawer sideDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return headerItems[index].isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextButton(
                          onPressed: headerItems[index].onTap,
                          child: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        headerItems[index].title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.0,
              );
            },
            itemCount: headerItems.length,
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Header(),
            ),
            Carousel(),
            SizedBox(height: 20.0),
            CvSection(),
            IosAppAd(),
            SizedBox(
              height: 70.0,
            ),
            WebsiteAd(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: PortfolioStats(),
            ),
            SizedBox(
              height: 50.0,
            ),
            EducationSection(),
            SizedBox(height: 50.0),
            SkillSection(),
            SizedBox(height: 50.0),
            Sponsors(),
            SizedBox(height: 50.0),
            TestimonialWidget(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
