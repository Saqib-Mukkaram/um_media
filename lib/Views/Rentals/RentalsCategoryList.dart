import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/Models/Rentals.dart';
import 'package:um_media/Views/Rentals/RentalProductsDetails.dart';

class RentalsCategoryList extends StatelessWidget {
  RentalsCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Name of the Brand",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (con, index) {
            return Container(
              margin: EdgeInsets.all(8),
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
                ) ,
                child: ListTile(
                leading: Hero(
                tag: index,
            child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: CachedNetworkImage(
            imageUrl:
            "https://th.bing.com/th/id/OIP.5CPkafUaVdteTAy7uHnf-QHaFF?w=1440&h=990&rs=1&pid=ImgDetMain",
            width: 75,
            ),
            ),
            ),
            title: Text("Canon"),
            subtitle: Text("Canon Camera"),
            contentPadding: EdgeInsets.all(8),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
            Get.to(
            RentalProductDetails(
            rentals: Rentals(
            image:
            "https://th.bing.com/th/id/OIP.5CPkafUaVdteTAy7uHnf-QHaFF?w=1440&h=990&rs=1&pid=ImgDetMain",
            id: index,
            name: "Hasselblad",
            type: "equipment"),
            )
            );
            },
            )
            ,
            );
          },
        ),
      ),
    );
  }
}
