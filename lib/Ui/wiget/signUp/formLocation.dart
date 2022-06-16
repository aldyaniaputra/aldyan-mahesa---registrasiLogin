import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:none/Constant.dart';
import 'package:none/Ui/Models/SignUpViewModel.dart';
import 'package:none/Ui/Shared/ui_helper.dart';

class formLocation extends StatelessWidget{
  SignUpViewModel model;

  formLocation({required this.model});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     return LoadingOverlay(
         isLoading: model.busy,
         child: SafeArea(
           child: SingleChildScrollView(
             child: Container(
               child: Center(
                 child: Column(
                   children: <Widget>[
                     Container(
                       width: size.width,
                       height: size.height*0.8,
                       child: FlutterMap(
                         options: MapOptions(
                           center: LatLng(model.lat, model.long),
                           zoom: 13,
                           onTap: model.HandleTap,
                         ),
                         layers: [
                           TileLayerOptions(
                             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                             subdomains: ['a','b','c']
                           ),
                           MarkerLayerOptions(
                             markers: model.MyPoint,
                           )
                         ],
                       ),
                     ),
                     verticalSpaceTiny,
                     TextField(
                       maxLines: 5,
                       controller: model.addressControler,
                       keyboardType: TextInputType.streetAddress,
                       decoration: InputDecoration(
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: color_main
                           )
                         ),
                         border: OutlineInputBorder(),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         )
     );
  }
}