part of 'actor_details_widgets_imports.dart';

class BuildActorBiography extends StatelessWidget {
  final String biographyContent;
  const BuildActorBiography({super.key, required this.biographyContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography',
          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        ReadMoreText(
          biographyContent,
          trimMode: TrimMode.Line,
          trimLines: 4,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
          moreStyle: TextStyle(color: Colors.orange, fontSize: 10.sp),
          lessStyle: TextStyle(color: Colors.orange, fontSize: 10.sp),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
