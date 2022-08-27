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
  GoogleMapController? myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items.length,
                      itemBuilder: (context, index){
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,

                          child: Card(
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Image.network(_items[index].imageUrl, fit: BoxFit.cover,)),
                                Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(_items[index].cityName, style: mapTextStyle,),
                                      ),
                                      Text(_items[index].placeName, style: mapTextStyle,),
                                    ],
                                  ),
                                ),
                              ],
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
}



List<LocationItems> _items = [
  LocationItems(cityName: 'Baghdad', placeName: 'save the culture statue', imageUrl: 'https://www.awla.news/wp-content/uploads/2017/09/2642-780x405.jpg'),
  LocationItems(cityName: 'Baghdad', placeName: 'save the culture statue', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnd5r-oMQglkig1ZO9lXn758EsAjXLANItGA&usqp=CAU'),
  LocationItems(cityName: 'Baghdad', placeName: 'save the culture statue', imageUrl: 'https://www.awla.news/wp-content/uploads/2017/09/2642-780x405.jpg'),
];