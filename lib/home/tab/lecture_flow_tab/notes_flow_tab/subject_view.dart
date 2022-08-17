import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/sub_model.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_lists.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/snapshot.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:flutter/material.dart';


class SubjectView extends StatefulWidget {
  final String sem_id;
  final String fromTab;
  const SubjectView({Key? key,required this.sem_id,required this.fromTab}) : super(key: key);

  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {

  late Future facultyList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    facultyList =  getSubject(widget.sem_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          title: Text("Select your subject"),
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
            List<SubjectModel> listOfSubject = snapshot.data;
            return ListView.builder(
                itemCount: listOfSubject.length,
                itemBuilder: (context,index){
                  SubjectModel subject = listOfSubject[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  NotesLists(sub_id: subject.id as String, pathName: "Notes",)));
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
                          title: Text(subject.subName as String,
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
