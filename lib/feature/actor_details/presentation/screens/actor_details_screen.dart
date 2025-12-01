part of 'actor_details_imports.dart';

class ActorDetailsScreen extends StatefulWidget {
  final int actorId;
  final String actorName;

  const ActorDetailsScreen({super.key, required this.actorId, required this.actorName});

  @override
  State<ActorDetailsScreen> createState() => _ActorDetailsScreenState();
}

class _ActorDetailsScreenState extends State<ActorDetailsScreen> {
  @override
  void initState() {
    context.read<ActorDetailsBloc>().add(FetchActorDetails(widget.actorId));
    context.read<ActorImagesBloc>().add(FetchActorImages(widget.actorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.actorName, backButton: true, fontSize: 20.sp),
      body: BlocBuilder<ActorDetailsBloc, ActorDetailsState>(
        builder: (context, state) {
          if (state is ActorDetailsLoading) {
            return Padding(
              padding: EdgeInsets.all(12.w),
              child: Center(
                child: CircularProgressIndicator(color: Colors.orange),
              ),
            );
          }

          if (state is ActorDetailsError) {
            return const Center(child: Text('ERROR'));
          }
          if (state is ActorDetailsLoaded) {
            final actorDetails = state.actorDetails;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------- TOP IMAGE -------------------------------- \\
                    BuildActorTopImage(imagePath: actorDetails.profilePath ?? ''),
                    SizedBox(height: 20.h),

                    // -------------------------------- BIOGRAPHY -------------------------------- \\
                    actorDetails.biography!.isNotEmpty
                        ? BuildActorBiography(biographyContent: actorDetails.biography ?? '')
                        : SizedBox(),

                    // -------------------------------- GALLERY -------------------------------- \\
                    BuildActorGallery(),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
