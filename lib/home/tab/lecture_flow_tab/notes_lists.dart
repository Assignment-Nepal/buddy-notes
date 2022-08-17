import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/snapshot.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:flutter/material.dart';

import 'model/notes_model.dart';

class NotesLists extends StatefulWidget {
  final String sub_id;
  final String pathName;
  const NotesLists({Key? key,required this.sub_id,required this.pathName}) : super(key: key);

  @override
  _NotesListsState createState() => _NotesListsState();
}

class _NotesListsState extends State<NotesLists> {
  late Future subjectDataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjectDataList =  getSubjectData(widget.sub_id,widget.pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          title: Text("University Name"),
        ),
      ),
      body: Column(
        children:  [
          const SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
              child: facultyFutureBuilder(),
            ),
          )
        ],
      ),
    );
  }

  Widget notesItemBuilder(NotesModel notesModel) {
    return Container(
      height: 100,

      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(.25)
            )
          ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 4,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(height: 75,width: 75,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                          Text(notesModel.notesName as String,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(color: AppColors.gray600,
                                fontSize: 14,
                                letterSpacing: .2,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 4,),
                          const Text("Dcrust university Haryana India",maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: AppColors.gray600,fontSize: 12,letterSpacing: .2),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
          Positioned(
            bottom: 10,
              right: 16,
              child: Row(
              children: [
                Icon(Icons.remove_red_eye_sharp,size: 20,color: AppColors.gray600,),
                SizedBox(width: 4,),
                Text("15"),
                SizedBox(width: 16,),

                Icon(Icons.remove_red_eye_sharp,size: 20,color: AppColors.gray600),
                SizedBox(width: 4,),
                Text("15"),
              ],

          )),
        ],
      ),
    );
  }

  facultyFutureBuilder() {
    return FutureBuilder(
      future: subjectDataList,
      builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
          ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            logger.e(snapshot.error);
            return const Text('Error');
          } else if (snapshot.hasData) {
            List<NotesModel> faculties = snapshot.data;
            return ListView.builder(
                itemCount: faculties.length,
                itemBuilder: (context,index){
                  NotesModel notesModel = faculties[index];

                  return notesItemBuilder(notesModel);
                });
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
