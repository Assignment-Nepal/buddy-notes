import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/sem_models.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_flow_tab/subject_view.dart';
import 'package:flutter/material.dart';

class NotesTab extends StatefulWidget {
 final  List<SemYearModel>? listOfSemYear;
  const NotesTab({Key? key,this.listOfSemYear}) : super(key: key);

  @override
  _NotesTabState createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: listViewBuilder(widget.listOfSemYear,"Notes"),
    );
  }


}
Widget listViewBuilder(List<SemYearModel>? listOfSemYear,String tabName){
  return ListView.builder(
      itemCount: listOfSemYear?.length,
      itemBuilder: (context,index){
        SemYearModel semYear = listOfSemYear![index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  SubjectView(sem_id: semYear.id as String,fromTab:tabName ,)));
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
                title: Text(semYear.semName as String,
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
}