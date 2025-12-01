part of 'actor_image_imports.dart';

class ActorImageScreen extends StatelessWidget {
  final String imageUrl;

  const ActorImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Full-screen image', backButton: true, fontSize: 20.sp),

      // -------------------------------- IMAGE -------------------------------- \\
      body: BuildWholeImage(imageUrl: imageUrl),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // -------------------------------- SAVE BUTTON -------------------------------- \\
      floatingActionButton: SaveButton(imageUrl: imageUrl),
    );
  }
}
