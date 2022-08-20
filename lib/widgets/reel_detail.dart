import 'package:flutter/material.dart';

class ReelDetail extends StatefulWidget {
  const ReelDetail({Key? key}) : super(key: key);

  @override
  State<ReelDetail> createState() => _ReelDetailState();
}

class _ReelDetailState extends State<ReelDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          title: Text('follow - something',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500 ),),
          leading: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage('https://images.livemint.com/img/2022/02/26/1140x641/The-Worst-Person-in-the-World_1645849348768_1645849366108.jpg',),
          ),
        ),
      ],
    );
  }
}
