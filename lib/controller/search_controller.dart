import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
RxBool isSearch = false.obs;
  var activeIndex=0.obs;

final searchFieldController = TextEditingController();
PageController controller=PageController();
List<String> location = ['Hyderabad','Mumbai','Pune'];
List<String> temperature =['31°','20°','25°'];
  List<Widget> list=<Widget>[
     Center(child: Image.asset('assets/cloudy.png')),
     Center(child:Image.asset('assets/sunriseandsunset.png')),
     Center(child:Image.asset('assets/sunny.png')),
   
  ];
  searchButtonOntap(){
    isSearch.value =! isSearch.value;
    update();

  }
}