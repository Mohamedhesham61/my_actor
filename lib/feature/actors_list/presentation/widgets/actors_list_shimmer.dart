part of 'actors_list_widgets_imports.dart';

class ActorListShimmer extends StatelessWidget {
  const ActorListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(.1), borderRadius: BorderRadius.circular(12)),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.shade100,
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Color(0xffFAFAFA), radius: 34),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 150,
                        decoration: BoxDecoration(color: Color(0xffFAFAFA), borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 10,
                        width: 80,
                        decoration: BoxDecoration(color: Color(0xffFAFAFA), borderRadius: BorderRadius.circular(8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
