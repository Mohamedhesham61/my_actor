import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_appBar.dart';
import '../blocs/actor_list_bloc.dart';
import '../blocs/actor_list_event.dart';
import '../blocs/actor_list_state.dart';
import '../widgets/actor_list_shimmer.dart';
import '../widgets/build_Actor_item.dart';

class ActorListScreen extends StatefulWidget {
  const ActorListScreen({super.key});

  @override
  State<ActorListScreen> createState() => _ActorListScreenState();
}

class _ActorListScreenState extends State<ActorListScreen> {
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
          state is ActorsListLoading ? ActorListShimmer() : null;
          state is ActorsListError ? Center(child: Text('ERROR')) : null;
          if (state is ActorsListLoaded) {
            final actors = state.actorsList;
            return ListView.builder(
              controller: scrollController,
              itemCount: actors.length + 1,
              itemBuilder: (context, index) {
                if (index < actors.length) {
                  final actor = actors[index];
                  return BuildActorItem(actor: actor);
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
