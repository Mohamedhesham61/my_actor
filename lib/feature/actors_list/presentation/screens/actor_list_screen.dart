import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_actors/core/network/api_constants.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/widgets/custom_appBar.dart';
import '../blocs/actor_list_bloc.dart';
import '../blocs/actor_list_event.dart';
import '../blocs/actor_list_state.dart';
import '../widgets/actor_list_shimmer.dart';

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
      backgroundColor: Color(0xff121623),
      appBar: CustomAppBar(title: 'Popular'),
      body: BlocBuilder<ActorsListBloc, ActorsListState>(
        builder: (context, state) {
          if (state is ActorsListLoading) {
            return ActorListShimmer();
          }

          if (state is ActorsListError) {
            return Center(child: Text(state.message));
          }

          if (state is ActorsListLoaded) {
            final actors = state.actorsList;

            return ListView.builder(
              controller: scrollController,
              itemCount: actors.length + 1 ,
              itemBuilder: (context, index) {
                if (index < actors.length) {
                  final actor = actors[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundImage: NetworkImage(ApiConstants.imageUrl(actor.profilePath ?? '')),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(actor.name ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                              Text(actor.knownForDepartment ?? '', style: TextStyle(color: Colors.grey, fontSize: 17)),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange),
                      ],
                    ),
                  );
                } else {
                  // Loading spinner
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
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
