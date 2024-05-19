import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Rentals.dart';
import 'package:um_media/Views/Rentals/RentalsCategoryList.dart';

import '../../Controller/RentalsController.dart';
import 'RentalProductsDetails.dart';

class RentalsSubCategories extends StatelessWidget {
  final Rentals rentals;
  final String categorySeletected;

  RentalsSubCategories(
      {required this.categorySeletected, required this.rentals, super.key});

  final _rentalsController = Get.find<RentalController>();
  List<String> cameraBrands = [
    'Canon',
    'Nikon',
    'Sony',
    'Fujifilm',
    'Olympus',
    'Panasonic',
    'Leica',
    'Pentax',
    'Hasselblad',
    'Sigma',
    'GoPro',
    'DJI',
    'Ricoh',
    'Kodak',
    'Casio',
    'Polaroid',
    'Lomography',
    'Phase One',
    'Mamiya',
    'Yashica'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          rentals.name,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: rentals.id,
                child: CachedNetworkImage(
                  imageUrl: AppConstants.base_URL + rentals.image,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  rentals.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: 275,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: cameraBrands.length,
                      itemBuilder: (con, index) {
                        return GestureDetector(
                            onTap: () {
                              // RentalProductDetails(
                              //                                 rentals: rentals,
                              //                               )
                              Get.to(
                                RentalsCategoryList()
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(

                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFb3aaaa).withOpacity(.3),
                                    offset: Offset(0, 0),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: Center(
                                child: Text(
                                  cameraBrands[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                            // CachedNetworkImage(
                            //   imageUrl: AppConstants.base_URL + rentals.image,
                            //   fit: BoxFit.fitWidth,
                            // ),

                            );
                      })),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Explore more",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: _rentalsController.getRentalsList
                          .where((e) {
                            return e.type == categorySeletected;
                          })
                          .toList()
                          .length,
                      itemBuilder: (con, index) {
                        print(
                            "Length of the Equipent is  ${_rentalsController.getRentalsList.where((e) {
                                  return e.type == categorySeletected;
                                }).toList().length}");
                        var rentalCategories =
                            _rentalsController.getRentalsList.where((e) {
                          return e.type == categorySeletected;
                        }).toList();

                        return GestureDetector(
                            onTap: () {
                              // Get.to(RentalsSubCategories(
                              //     rentals: rentalCategories[index]));
                            },
                            child: Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFb3aaaa).withOpacity(.3),
                                      offset: Offset(0, 0),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: rentals.name ==
                                          rentalCategories[index].name
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      rentalCategories[index]
                                          .name
                                          .toUpperCase(),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: rentals.name ==
                                                  rentalCategories[index].name
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize:
                                              rentalCategories[index].name ==
                                                      'Accessories'
                                                  ? 10
                                                  : 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
