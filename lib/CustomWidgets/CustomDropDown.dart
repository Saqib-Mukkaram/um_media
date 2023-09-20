import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  Set<String> selectedOptions = {'Actor'}; // Initialize with 'Actor'
  List<DropDownValueModel> value = AppConstants.TalentSelectionList;
  final MultiValueDropDownController _controller =
      MultiValueDropDownController();

  @override
  void initState() {
    // TODO: implement initState
    // _controller.dropDownValueList = value;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropDownTextField.multiSelection(
      textFieldDecoration: InputDecoration(
        label: Text("Talent List"),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        // errorText: "This is a requirement",
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        fillColor: Colors.white,

        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
      controller: _controller,
      displayCompleteItem: true,

      // initialValue: const ["name1", "name2", "name8", "name3"],
      dropDownList: const [
        DropDownValueModel(name: ' Actor', value: 0),
        DropDownValueModel(name: ' Singer', value: 1),
        DropDownValueModel(name: ' Dancer', value: 2),
        DropDownValueModel(name: ' Youtuber', value: 3),
        DropDownValueModel(name: ' Videographer', value: 4),
        DropDownValueModel(name: ' Model', value: 5),
        DropDownValueModel(name: ' DJ', value: 6),
        DropDownValueModel(name: ' Musician', value: 7),
      ],
      onChanged: (val) {
        setState(() {
          print(val);
        });
      },
      dropdownColor: Colors.white,
      padding: EdgeInsets.all(0),

      submitButtonTextStyle: TextStyle(fontSize: 14),
    );
  }
}
