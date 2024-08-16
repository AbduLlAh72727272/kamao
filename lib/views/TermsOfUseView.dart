import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/colors.dart';

class TermsOfUseView extends StatelessWidget {
  final VoidCallback onAccept;

  const TermsOfUseView({Key? key, required this.onAccept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Terms of Use',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: VoidColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''Venenatis mauris elit vitae quisque iaculis in interdum volutpat diam. At habitant rutrum ultrices gravida lorem. Convallis molestie augue faucibus adipiscing consequat vel eu. Fames lacus faucibus orci non a tellus lectus nunc blandit.

• Bibendum facilisis proin commodo ut aliquet maecenas tempor cum porttitor.
• Diam vulputate proin quam amet facilisis tempus at vestibulum maecenas.
• Risus eu ipsum odio metus.
• Et tellus sed neque pharetra orci rhoncus tincidunt elit non.
• Non nisl tempus velit sit at phasellus.
• Habitant sapien elit et fringilla etiam venenatis est.
• Nisi faucibus a mattis consequat.

Eget dignissim nibh au amet auctor accumsan etiam sagittis neque in. Aliquet eu volutpat platea nisl. Suspendisse elementum lobortis penatibus vitae dui congue in luctus. Hac nisl leo pellentesque dui justo ornare. Ullamcorper massa fringilla tortor semper sapien aenean posuere. Faucibus et turpis est tortor sit tincidunt est blandit. Fermentum ornare vulputate tincidunt eget pellentesque eu quis et. Diam vitae nulla urna tempor sapien in mid. Gravida risus et gravida. Sed sagittis risus integer justo molestie. Leo morbi vestibulum nunc sed quam faucibus commodo eu. Tincidunt nunc neque ut interdum nunc fermentum gravida mid est. Senectus velit gravida malesuada orci felis mid. Gravida turpis est lorem viverra. Proin gravida nulla mi semper. Sapien volutpat cursus rhoncus in turpis sapien in quam. Pulvinar orci orci nullam nulla turpis molestie est. Dignissim tortor amet luctus scelerisque leo et nisl lacus odio odio. Varius rutrum massa lectus ut. Lobortis sodales scelerisque eget pellentesque purus sit cursus risus nisl. Sed pulvinar consequat ornare dolor sed. Tincidunt purus vel enim a ornare.''',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: onAccept,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
                backgroundColor: VoidColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Accept',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
