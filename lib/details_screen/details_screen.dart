import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellify_task/details_screen/details_cubit.dart';
import 'package:intellify_task/details_screen/details_cubtit_state.dart';
import 'package:intellify_task/model/place_details_response_model.dart';


import '../app_style/app_colors.dart';
import '../app_style/app_font_style.dart';

class DetailsScreen extends StatefulWidget {
  String? placeId;

  DetailsScreen(this.placeId, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  late DetailsCubit detailsCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        automaticallyImplyLeading: true,
        actions: [
        ],
        title: Text('Hello, G Test',
          style: styleLarge1.copyWith(
              color: red,
              fontWeight: FontWeight.w700
          ),),
      ),
      body: SingleChildScrollView(child:
      Column(
        children: [

          Container(

            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                if(state is DetailsLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }
                 if(state is DetailsLoadedState){
                  Result result = state.result;
                  List<Photo> photoList = state.photo ?? [];
                  return Column(children: [


                    const SizedBox(height: 20,),

                    addressView(result),

                    const SizedBox(height: 20,),

                    contactView(),

                    const SizedBox(height: 20,),

                    SliderBanner(photoList,result),

                    const SizedBox(height: 20,),

                    bottomWidget()


                  ],);
                }
                else {
                  return Center(child: Text("Something Went Wrong"),);
                }


              },
            ),
          ),
        ],
      ),),
    );
  }

  @override
  void initState() {
    super.initState();
    final detailsCubit = BlocProvider.of<DetailsCubit>(context);
    detailsCubit.goToDetailPage(widget.placeId ?? "");
  }


  Widget addressView(Result result) {
    return Card(
        color: white,
        elevation: 4.0, // Adjust elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Container(
          decoration: BoxDecoration(color: white,
              borderRadius: BorderRadius.circular(13)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Icon(Icons.location_on_outlined, color: red, size: 30,),

              const SizedBox(width: 10,),

              Expanded(
                flex: 5,
                child: Text(
                  result.formattedAddress ?? "",
                  style: styeMedium1.copyWith(
                    color: black,
                  ),),
              )
            ],),
        ));
  }

  Widget contactView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(flex: 1, child:
        Card(
            color: white,
            elevation: 4.0, // Adjust elevation as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Container(
              decoration: BoxDecoration(color: white,
                  borderRadius: BorderRadius.circular(13)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Icon(Icons.watch_later, color: red, size: 20,),


                  const SizedBox(width: 7,),

                  Text('Open houres',
                    style: styeMedium1.copyWith(
                      color: black,
                    ),),

                  const SizedBox(width: 7,),

                  Text('view',
                    style: styeMedium1.copyWith(
                        color: red,
                        fontWeight: FontWeight.w600
                    ),)
                ],),
            ))),

        Expanded(flex: 1, child:
        Card(
            color: white,
            elevation: 4.0, // Adjust elevation as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Container(
              decoration: BoxDecoration(color: white,
                  borderRadius: BorderRadius.circular(13)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Icon(Icons.call, color: red, size: 20,),


                  const SizedBox(width: 7,),

                  Text('Call Restaurant',
                    style: styeMedium1.copyWith(
                      color: black,
                    ),),


                ],),
            )))
      ],);
  }

  Widget SliderBanner(List<Photo> photoList, Result result) {
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
      itemCount: photoList.length,
      itemBuilder: (BuildContext context, int index, int realIndex)
      {

       String? photoRef;

       if (result.photos != null && result.photos!.isNotEmpty) {

         if (result.photos!.length > index && result.photos![index] != null) {

           photoRef = result.photos![index].photoReference;
           if (photoRef != null) {
             photoRef = result.photos![index].photoReference;
           } else {
             photoRef = "ATplDJYCGmzlS3ABg6QMfbc6qrG5xJ8vm_cGzLg3NP7eJpJJUTjl-hkdEhB5-qTrloq0O43Py-NCmCEeiGJQ2uxWiWjWDNfMEojMi60OcIhptkdv0xlaEFSXpKYQx11V6LFrbpML7dxSpw7l1_5tANcosklgfQDc4UxlWNjL_T5LRQQmlFBr";
           }
         } else {
           photoRef = "ATplDJYCGmzlS3ABg6QMfbc6qrG5xJ8vm_cGzLg3NP7eJpJJUTjl-hkdEhB5-qTrloq0O43Py-NCmCEeiGJQ2uxWiWjWDNfMEojMi60OcIhptkdv0xlaEFSXpKYQx11V6LFrbpML7dxSpw7l1_5tANcosklgfQDc4UxlWNjL_T5LRQQmlFBr";
         }
       }

        return FutureBuilder(
            future: context.read<DetailsCubit>().fetchGoogleImage(photoRef),
            builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting){
                return const Placeholder();
              }
              else{
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                          vertical: 10)),);
              }

            },);
      },
    );
  }

  Widget bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        commonView(Icons.app_shortcut, "Order"),

        SizedBox(width: 10,),

        commonView(Icons.history, "Reserve"),

        const SizedBox(width: 10,),

        commonView(Icons.send_outlined, "Direction"),
      ],);
  }

  Widget commonView(IconData mIcon, String text) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(borderRadius:
        BorderRadius.circular(10),
          color: white,),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(mIcon, size: 20, color: Colors.grey,),

              const SizedBox(height: 7),

              Text(text,
                style: styeMedium1.copyWith(
                    color: red,
                    fontWeight: FontWeight.w600
                ),)

            ],),
        ),),
    );
  }
}
