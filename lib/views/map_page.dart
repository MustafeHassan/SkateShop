import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/locations.dart';
import '../utils/styles.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});


  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = Set(); //markers for google map
  static const LatLng showLocation = LatLng(33.2232, 43.6793);

  static const CameraPosition Iraq = CameraPosition(
    target: LatLng(33.2232, 43.6793),
    zoom: 6,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: Iraq,
                markers: getmarkers(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),

              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                         onTap: () async {
                           final GoogleMapController controller = await _controller.future;
                           controller.animateCamera(CameraUpdate.newCameraPosition(  CameraPosition(
                               bearing: 192.8334901395799,
                               target: LatLng(_items[index].latitude, _items[index].longitude),
                               tilt: 59.440717697143555,
                               zoom: 19.151926040649414)));
                         },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(9)),
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Image.network(_items[index].imageUrl, fit: BoxFit.cover,)),
                                  Container(
                                    decoration:  BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                                        )
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(_items[index].cityName, style: mapTextStyle,),
                                        ),
                                        Text(_items[index].placeName, style: mapTextStyle,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title First ',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(33.31533778837663, 44.36779995403607), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title Second ',

        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(27.7137735, 85.315626), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title Third ',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}



List<LocationItems> _items = [
  LocationItems(cityName: 'Baghdad', placeName: 'save the culture statue', imageUrl: 'https://www.awla.news/wp-content/uploads/2017/09/2642-780x405.jpg', latitude: 33.315301925707296, longitude: 44.36774630987348),
];