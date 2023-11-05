import 'package:companyportfolio/extensions/int_extention.dart';
import 'package:companyportfolio/models/language_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

class CustomDropDownButtonList extends StatelessWidget {
  CustomDropDownButtonList(
      {super.key,
      required this.list,
      required this.onChanged,
      required this.value,
      });
  final List<dynamic> list;
  final void Function(LanguageModel?)? onChanged;
  final LanguageModel? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<LanguageModel>(
        isExpanded: true,
         hint: null,   
        items: list
            .map((item) => DropdownMenuItem<LanguageModel>(
                  value: item,
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // border: Border(bottom: BorderSide(width: 1, color: AppColors.lightPurple))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(item.languageDisplayName as String).tr}',
                                style: const TextStyle(fontFamily: 'Outfit-Medium',color: AppColors.lightPurple),
                                overflow: TextOverflow.ellipsis,
                              ),
                              5.width,
                            ],
                          )),
                          10.height,
                          Divider(
                            height: 1,
                            color: AppColors.lightPurple,
                          )
                    ],
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChanged,
        customButton:  Container(
                  width: 50,
                  height: 50,
                  decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(360)),
                  gradient: AppColors.primaryGradientColor
                  ),
                  child: Icon(Icons.language_rounded,color: AppColors.lightPurple,size: 25,),
                  
                ),
       
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: AppColors.primaryGradientColor,
            // color: Color,
          ),
          offset: const Offset(-10, -20),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
