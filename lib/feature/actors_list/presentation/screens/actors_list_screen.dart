part of 'actors_list_imports.dart';

class ActorsListScreen extends StatefulWidget {
  const ActorsListScreen({super.key});

  @override
  State<ActorsListScreen> createState() => _ActorsListScreenState();
}

class _ActorsListScreenState extends State<ActorsListScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final bloc = context.read<ActorsListBloc>();
      final state = bloc.state;

      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 &&
            state is ActorsListLoaded &&
            !state.isLoadingMore &&
            state.currentPage < state.totalPages) {
          bloc.add(LoadMoreActors());
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Popular', backButton: false),
      body: BlocBuilder<ActorsListBloc, ActorsListState>(
        builder: (context, state) {
          if (state is ActorsListLoading) {
            return ActorListShimmer();
          }

          if (state is ActorsListError) {
            return const Center(child: Text('ERROR'));
          }
          if (state is ActorsListLoaded) {
            final actors = state.actorsList;
            return ListView.builder(
              controller: scrollController,
              itemCount: actors.length + 1,
              itemBuilder: (context, index) {
                if (index < actors.length) {
                  final actor = actors[index];
                  return BuildActorsItem(actor: actor, actorId: actor.id ?? 0);
                } else {
                  return Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Center(child: CircularProgressIndicator(color: Colors.orange)),
                  );
                }
              },
            );
          }
          return SizedBox(); // fallback
        },
      ),
    );
  }
}
