import 'package:Placelook/main.dart';
import 'package:Placelook/viewmodel/walk_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogOpacity extends StatefulWidget{
  const DialogOpacity({super.key});
@override
  State<StatefulWidget> createState() => _DialogOpacityState();
}

class _DialogOpacityState extends State<DialogOpacity>{
  _DialogOpacityState();
  @override
  Widget build(BuildContext context) {
    final walk = context.read<WalkViewModel>().walk;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Center(
          child: CarouselSlider.builder(
              itemCount: walk?.places?.length,
              itemBuilder: (context, index, realIndex){
                return SizedBox(
                  width: size.width,
                  child: Image.network(walk!.places![index], fit: BoxFit.cover,),
                );
              },
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                initialPage: context.read<WalkViewModel>().start,
                viewportFraction: 1,
                height: size.height
              ))
        )
    );
  }
}