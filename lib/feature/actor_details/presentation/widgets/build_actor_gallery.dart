part of 'actor_details_widgets_imports.dart';

class BuildActorGallery extends StatelessWidget {
  const BuildActorGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorImagesBloc, ActorImagesState>(
      builder: (BuildContext context, state) {
        if (state is ActorImagesLoading) {
          return Padding(
            padding: EdgeInsets.all(12.w),
            child: const Center(child: CircularProgressIndicator(color: Colors.orange)),
          );
        }

        if (state is ActorImagesError) {
          return const Center(child: Text('ERROR'));
        }

        if (state is ActorImagesLoaded) {
          final actorImages = state.actorImages;
          return actorImages.profiles!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                      padding: EdgeInsets.all(12.w),
                      shrinkWrap: true,
                      // IMPORTANT
                      physics: const NeverScrollableScrollPhysics(),
                      // IMPORTANT
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: actorImages.profiles?.length ?? 0,
                      itemBuilder: (context, index) {
                        final imageUrl = actorImages.profiles?[index].filePath ?? '';
                        return InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.actorImageScreen, arguments: {'imageUrl': imageUrl}),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: Image.network(
                                ApiConstants.imageUrl(imageUrl),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person, size: 30, color: Colors.grey);
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.orange),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : SizedBox();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
