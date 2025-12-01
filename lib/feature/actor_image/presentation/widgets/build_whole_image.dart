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
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Failed to load image', style: TextStyle(color: Colors.white)));
          },
        ),
      ),
    );
  }
}
