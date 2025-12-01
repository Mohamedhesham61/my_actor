part of 'actor_image_widgets_imports.dart';

class SaveButton extends StatelessWidget {
  final String imageUrl;
  const SaveButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: Color(0xFF4a5ef2),
            shape: BoxShape.circle
        ),
        child: IconButton(
          icon: const Icon(Icons.save, color: Colors.white,),
          onPressed: () => saveNetworkImage(imageUrl),
        ),
      ),
    );
  }
}
