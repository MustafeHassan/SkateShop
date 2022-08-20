import 'package:flutter/material.dart';

class ReelSideBar extends StatefulWidget {
  const ReelSideBar({Key? key}) : super(key: key);

  @override
  State<ReelSideBar> createState() => _ReelSideBarState();
}

class _ReelSideBarState extends State<ReelSideBar> {
  final double _iconSize = 28;
  final Color _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline), iconSize: _iconSize, color: _color),
        Text('104', style: TextStyle(color: _color),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.comment_outlined), iconSize: _iconSize, color: _color),
        Text('3',  style: TextStyle(color: _color),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined), iconSize: _iconSize, color: _color),
        IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz_outlined), iconSize: _iconSize, color: _color),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            image: const DecorationImage(image: NetworkImage('https://images.livemint.com/img/2022/02/26/1140x641/The-Worst-Person-in-the-World_1645849348768_1645849366108.jpg'), fit: BoxFit.cover),
            border: Border.all(color: Colors.white, width: 2)
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
