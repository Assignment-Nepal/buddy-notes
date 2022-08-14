


import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/material.dart';

Widget getInsightChartDropDown({String? value,Function? onChanged,
  required List<String?> dropDownInsightsRpr, double fontSize = 12}) {
  return Container(
    height: 30,
    decoration: BoxDecoration(
      color:AppColors.gray200,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
      child: DropdownButton(
        icon: Padding(
          padding:  EdgeInsets.only(left: 16),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.gray600,
          ),
        ),

        underline: Container(height: 1, color: Colors.transparent),

        value: value,

        onChanged:(value){
          onChanged!(value);
        },

        items: dropDownInsightsRpr.map((user) {
          return DropdownMenuItem<String>(
            value: user,
            child: Row(
              children: <Widget>[
                Text(
                  user!,
                  style: TextStyle(
                      color: AppColors.gray600, fontSize: fontSize),
                ),
              ],
            ),
          );
        }).toList(),

      ),
    ),
  );
}