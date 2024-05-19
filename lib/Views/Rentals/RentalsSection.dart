import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RentalsController.dart';
import 'package:um_media/Controller/ShimmerController.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/RentalBar.dart';
import 'package:um_media/Views/Rentals/RentalsDescription.dart';
import 'package:um_media/Views/Rentals/RentalsSubCategory.dart';

class RentalsSection extends StatelessWidget {
  RentalsSection({super.key});

  var _tappedCard = false.obs;
  var _animationCompleted = false.obs;

  var _firstTapped = false.obs;

  RentalController _rentalController = Get.find();

  @override
  Widget build(BuildContext context) {
    var rentalsCatering = _rentalController.getRentalsList
        .where((element) => element.type == 'catering')
        .toList();
    var rentalsEquiment = _rentalController.getRentalsList
        .where((element) => element.type == 'equipment')
        .toList();
    var rentalsProps = _rentalController.getRentalsList
        .where((element) => element.type == 'prop')
        .toList();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rentalsEquiment.length,
            itemBuilder: (con, index) {
              var rentals = rentalsEquiment;

              return GestureDetector(
                onTap: () {
                  Get.to(RentalsSubCategories(
                    categorySeletected: "equipment",
                    rentals: rentals[index],
                  ));
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  constraints: BoxConstraints(maxWidth: 150, maxHeight: 75),
                  // decoration: BoxDecoration(color: Colors.grey),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                          tag: rentals[index].id,
                          child: CachedNetworkImage(
                            imageUrl:
                                AppConstants.base_URL + rentals[index].image,
                            width: 150,
                            height: 95,
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) =>
                                ShimmerController.shimmerList(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              rentals[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Equipment
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    "Rent Props".toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          onEnd: () {
            _animationCompleted.value = true;
            _firstTapped.value = true;
          },
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rentalsProps.length,
                  itemBuilder: (con, index) {
                    var rentals = rentalsProps;
                    return GestureDetector(
                      onTap: () {
                        Get.to(RentalsSubCategories(
                          categorySeletected: "prop",
                          rentals: rentals[index],
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        constraints:
                            BoxConstraints(maxWidth: 150, maxHeight: 75),
                        // decoration: BoxDecoration(color: Colors.grey),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Hero(
                                tag: rentals[index].id,
                                child: CachedNetworkImage(
                                  imageUrl: AppConstants.base_URL +
                                      rentals[index].image,
                                  width: 150,
                                  height: 95,
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) =>
                                      ShimmerController.shimmerList(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    rentals[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    "Caterings".toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          onEnd: () {
            _animationCompleted.value = true;
            _firstTapped.value = true;
          },
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rentalsCatering.length,
                  itemBuilder: (con, index) {
                    var rentals = _rentalController.getRentalsList
                        .where((element) => element.type == 'catering')
                        .toList();
                    return GestureDetector(
                      onTap: () {
                        Get.to(RentalsSubCategories(
                          categorySeletected: 'catering',
                          rentals: rentals[index],
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        constraints:
                            BoxConstraints(maxWidth: 150, maxHeight: 75),
                        // decoration: BoxDecoration(color: Colors.grey),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Hero(
                                tag: rentals[index].id,
                                child: CachedNetworkImage(
                                  imageUrl: AppConstants.base_URL +
                                      rentals[index].image,
                                  width: 150,
                                  height: 95,
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) =>
                                      ShimmerController.shimmerList(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    rentals[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
