import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ReelDetail extends StatefulWidget {
  const ReelDetail({Key? key}) : super(key: key);

  @override
  State<ReelDetail> createState() => _ReelDetailState();
}

class _ReelDetailState extends State<ReelDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          title: Text('xbr.dev - follow',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500 ),),
          leading: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage('https://images.livemint.com/img/2022/02/26/1140x641/The-Worst-Person-in-the-World_1645849348768_1645849366108.jpg',),
          ),
        ),
      const Padding(
        padding: EdgeInsets.all(6.0),
        child: ExpandableText(
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
          style: TextStyle(
            color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w400
          ),
          expandText: 'show more',
          collapseText: 'show less',
          expandOnTextTap: true,
          collapseOnTextTap: true,
          maxLines: 1,
          linkColor: Colors.grey,
        ),
      ),
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 5,
          title: Row(
            children: [
              SizedBox(
                height: 20,
                width: 125,
                child: Marquee(text: '  middle of the night - original music', scrollAxis: Axis.horizontal, velocity: 10, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
              ),
            ],
          ),
          leading: const Icon(Icons.graphic_eq_outlined, color: Colors.white,)
        ),
      ],
    );
  }
}
