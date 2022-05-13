
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {

  int? id;
  String? tipo;

    ScanModel({
         this.id,
         this.tipo,
        @required required this.valor,
    }){
      if(this.valor.contains('http')){
         this.tipo='http';
      }else{
        this.tipo = 'geo';
      }

    }

    
    String valor;
 
    LatLng getLatLng()  {

      final latLng = this.valor.substring(4).split(',');
      final lat =  double.parse(latLng[0]);
      final lag =  double.parse( latLng[1]);

      return LatLng(lat, lag);



    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
