part of 'actor_details_widgets_imports.dart';

class BuildActorTopImage extends StatelessWidget {
  final String imagePath;

  const BuildActorTopImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints(maxWidth: 200.w, maxHeight: 200.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.network(ApiConstants.imageUrl(imagePath), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
