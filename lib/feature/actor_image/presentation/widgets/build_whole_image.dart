part of 'actor_image_widgets_imports.dart';

class BuildWholeImage extends StatelessWidget {
  final String imageUrl;
  const BuildWholeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        panEnabled: true,
        minScale: 0.5,
        maxScale: 4.0,
        child: Image.network(
          ApiConstants.imageUrl(imageUrl),
          fit: BoxFit.contain,
          // Prevent white flash while loading
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              color: Colors.black,   // IMPORTANT: stops the white glow
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Colors.orange),
            );
          },

          // Prevent white flash when error occurs
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.black,   // IMPORTANT: stops the white glow
              alignment: Alignment.center,
              child: const Text(
                'Failed to load image',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
