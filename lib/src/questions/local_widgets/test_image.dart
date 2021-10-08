import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestImage extends StatelessWidget {
  final String? imageURL;
  const TestImage({Key? key, this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        // child: Image(image: CachedNetworkImageProvider(imageURL!)),
        child: CachedNetworkImage(
          imageUrl: imageURL!,
          fadeInDuration: const Duration(milliseconds: 300),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
            padding: EdgeInsets.all(5.r),
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: 3.0,
            ),
          ),
          errorWidget: (ctxx, msg, dyn) => Text(
            "Oops..\nError in loading image \n $msg",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: CustomColors.errorColor,
            ),
          ),
        ),
      ),
    );
  }
}
