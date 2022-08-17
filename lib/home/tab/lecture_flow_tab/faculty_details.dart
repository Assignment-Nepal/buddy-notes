import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/snapshot.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:flutter/material.dart';

import 'model/faculty_model.dart';
import 'notes_flow_tab/notes_flow_tab_widget.dart';

class FacultyDetail extends StatefulWidget {
  final String university_id;
  const FacultyDetail({Key? key,required this.university_id}) : super(key: key);

  @override
  _FacultyDetailState createState() => _FacultyDetailState();
}

class _FacultyDetailState extends State<FacultyDetail> {

  late Future facultyList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    facultyList =  getFaculty(widget.university_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          title: Text("Choose your faculty"),
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

  Widget facultyFutureBuilder() {
    return FutureBuilder(
      future: facultyList,
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
            List<FacultyModel> faculties = snapshot.data;
            return ListView.builder(
                itemCount: faculties.length,
                itemBuilder: (context,index){
                  FacultyModel faculty = faculties[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  NotesFlowTab(faculty_id: faculty.id,)));
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
                          leading: const Icon(Icons.book),
                          title: Text(faculty.facultyName,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(color: AppColors.gray600,
                                fontSize: 18,
                                letterSpacing: .2,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,size: 20,),
                        ),
                      ),
                    ),
                  );
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
