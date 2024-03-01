import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellify_task/details_screen/details_cubit.dart';
import 'package:intellify_task/details_screen/details_screen.dart';
import 'package:intellify_task/model/near_by_location_response_model.dart';
import 'package:intellify_task/nearByLocation/near_by_cubit/near_by_cubit.dart';
import 'package:intellify_task/nearByLocation/near_by_cubit/near_by_cubit_state.dart';

import '../app_style/app_colors.dart';
import '../app_style/app_font_style.dart';

class NearByLocationScreen extends StatefulWidget {
  const NearByLocationScreen({super.key});

  @override
  State<NearByLocationScreen> createState() => _NearByLocationScreenState();
}

class _NearByLocationScreenState extends State<NearByLocationScreen> {

  final List<String> images = [
    'https://images.unsplash.com/photo-1545987796-200677ee1011?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmV0d29ya3xlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1661916762370-4768aa1fc4c4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGZyZWUlMjBkb3dubG9hZHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1528437457702-ec66df48de3f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGZyZWUlMjBkb3dubG9hZHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1531662439848-a7ed93c51468?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];

  NearByCubit nearByCubit = NearByCubit();

  @override
  void initState() {
    super.initState();
    final detailsCubit = BlocProvider.of<NearByCubit>(context);
    detailsCubit.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined, color: red,),
            onPressed: () {

            },
          ),
        ],
        title: Text('Hello, G Test', style: styleLarge1.copyWith(
          color: black,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          searchBarField(),

          SliderBanner()

        ],),
      ),
    );
  }


  Widget searchBarField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextField(
          onTap: () {
          },
          decoration: InputDecoration(
            hintText: 'Search for Burger and etc..',
            fillColor: lightGrey,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            prefixIcon: const Icon(Icons.search, size: 25,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none
            ),
          )),
    );
  }

  Widget SliderBanner() {

    return BlocBuilder<NearByCubit, NearByState>(
      builder: (context, state) {
        if(state is LocationLoadingState){
          return const Center(child:
          CircularProgressIndicator(color: red,));
        }
        if(state is LocationLoaded){

          List<Result> dateList  = state.resultList;


          return CarouselSlider.builder(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            itemCount: dateList.length ?? 0,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var item;
              if (dateList[index].photos != null && dateList[index].photos!.isNotEmpty) {

                if (dateList[index].photos!.length > index && dateList[index].photos![index] != null) {

                  item = dateList[index].photos![index].photoReference;
                  if (item != null) {
                    item = dateList[index].photos![index].photoReference;
                  } else {
                    item = "ATplDJYCGmzlS3ABg6QMfbc6qrG5xJ8vm_cGzLg3NP7eJpJJUTjl-hkdEhB5-qTrloq0O43Py-NCmCEeiGJQ2uxWiWjWDNfMEojMi60OcIhptkdv0xlaEFSXpKYQx11V6LFrbpML7dxSpw7l1_5tANcosklgfQDc4UxlWNjL_T5LRQQmlFBr";
                  }
                } else {
                  item = "ATplDJYCGmzlS3ABg6QMfbc6qrG5xJ8vm_cGzLg3NP7eJpJJUTjl-hkdEhB5-qTrloq0O43Py-NCmCEeiGJQ2uxWiWjWDNfMEojMi60OcIhptkdv0xlaEFSXpKYQx11V6LFrbpML7dxSpw7l1_5tANcosklgfQDc4UxlWNjL_T5LRQQmlFBr";
                }
              }

              var placeID = dateList[index].placeId;
              return   FutureBuilder(
                future: nearByCubit.fetchGoogleImage(item),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Placeholder();
                  }
                  else{
                    return InkWell(onTap: (){

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BlocProvider(
                            create: (context) => DetailsCubit(),
                            child: DetailsScreen(placeID),
                          )));

                    },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://www.onlineinstruments.co.in/imgs/logo/logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,
                              vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                decoration: BoxDecoration(color: white,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Image.asset(
                                  'assets/image/Google_Icons-09-512.jpg',
                                  width: 40,
                                  height: 40,),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(dateList[index].name ?? "",
                                    style: styeSmall4.copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w800
                                    ),),

                                  Text(
                                    dateList[index].vicinity ?? "",
                                    style: styeSmall3.copyWith(
                                      color: white,

                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),),
                    );
                  }

                },

              );
            },
          );
        }

       else {
          return Center(child: Text("Error"),);
        }

      },
    );
  }
}
