import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';

class EnqurieList extends StatelessWidget {
  const EnqurieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isAvailble = false;
    return Stack(
      children: [
        isAvailble
            ? ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset("assets/imgs/People/Sana-2.png"),
                      ),
                      title: Text("Sana Mirza"),
                      subtitle: Text("#actor, #model"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outlined,
                          color: Colors.red.shade500,
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      size: 60,
                      color: AppConstants.siteSubColor,
                    ),
                    //TODO: Needed to add to the Languages File
                    Text(
                      "Enquire List Empty!",
                      style: TextStyle(fontSize: 32),
                    )
                  ],
                ),
              ),
        Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  child: ButtonCustom(
                    buttonText: "Enquire",
                    onPress: () {},
                    foregroundColor: AppConstants.siteSubColor,
                    backgroundColor: AppConstants.subTextGrey,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
