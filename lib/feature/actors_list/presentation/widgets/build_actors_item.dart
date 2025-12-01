part of 'actors_list_widgets_imports.dart';

class BuildActorsItem extends StatelessWidget {
  final Results actor;
  final int actorId;

  const BuildActorsItem({super.key, required this.actor, required this.actorId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.actorDetailsScreen, arguments: {'actorId': actorId, 'actorName': actor.name}),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
        padding: EdgeInsets.all(11.h),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(.1), borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            // -------------------------------- IMAGE -------------------------------- \\
            CircleAvatar(radius: 31.r, backgroundImage: NetworkImage(ApiConstants.imageUrl(actor.profilePath ?? ''))),
            SizedBox(width: 17.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------------------------------- ACTOR'S NAME -------------------------------- \\
                  Text(
                    actor.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),

                  // -------------------------------- ACTOR'S WORK -------------------------------- \\
                  Text(
                    actor.knownForDepartment ?? '',
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            // -------------------------------- ICON -------------------------------- \\
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
