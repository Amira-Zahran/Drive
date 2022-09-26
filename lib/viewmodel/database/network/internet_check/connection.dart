import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  State<Connection> createState() => _ConnectionState();
}


class _ConnectionState extends State<Connection> {

  late StreamSubscription connection;
  bool? isOffline;


  @override
  Widget build(BuildContext context) {
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.none){
        setState(() {
          isOffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.ethernet){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.bluetooth){
        setState(() {
          isOffline = false;
        });
      }
    });
    return Container( child: isOffline! ? Text('off') : Text('data'));
  }
}

