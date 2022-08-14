
import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/faculty_and_sem_view.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class StartLectureFlow extends StatefulWidget {
  const StartLectureFlow({Key? key}) : super(key: key);

  @override
  _StartLectureFlowState createState() => _StartLectureFlowState();
}

class _StartLectureFlowState extends State<StartLectureFlow> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: 30,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const FacultyAndSemester()));
                  },
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 8),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(.25)
                          )
                        ]
                    ),
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("DataStructure and Alogrothim",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: AppColors.gray600,
                                fontSize: 18,
                                letterSpacing: .2,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Dcrust university Haryana India",maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: AppColors.gray600,fontSize: 12,letterSpacing: .2),
                          )

                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,size: 20,),
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child:  SearchBarAnimation(
        textEditingController: TextEditingController(),
        isOriginalAnimation: true,
        enableKeyboardFocus: true,
      ),
    );
  }
}

