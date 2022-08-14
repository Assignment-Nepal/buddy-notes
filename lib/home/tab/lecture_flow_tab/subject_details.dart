import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_lists.dart';
import 'package:flutter/material.dart';

class SubjectDetails extends StatefulWidget {
  const SubjectDetails({Key? key}) : super(key: key);

  @override
  _SubjectDetailsState createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar:   PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 10,
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[

                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.arrow_back_rounded,color: Colors.black.withOpacity(.5  ),)),

                    const SizedBox(width: 16,),

                    const Text("Subject Name",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: AppColors.gray600,
                          fontSize: 18,
                          letterSpacing: .2,
                          fontWeight: FontWeight.bold
                      ),
                    ),




                  ]),
              // Icon(Icons.,color: Colors.black.withOpacity(.5  ),),
            ],
          ),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(child: myWidget()),
          ],
        ),
      ),
    );
  }

 Widget myWidget() {
   return MediaQuery.removePadding(
     context: context,
     removeTop: true,
     child: GridView.builder(
       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: MediaQuery.of(context).size.width /
             (MediaQuery.of(context).size.height / 2.5),
       ),
       itemCount: 6,
       itemBuilder: (BuildContext context, int index) {
         return InkWell(
           onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context) => const NotesLists()));

           },
           child: Container(
             height: 50,
             margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
             decoration:BoxDecoration(
                 color: AppColors.gray200,
                 borderRadius: BorderRadius.circular(8),
                 boxShadow: [
                   BoxShadow(
                       offset: const Offset(1, 1),
                       blurRadius: 2,
                       color: Colors.black.withOpacity(.25)
                   )
                 ]
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.note),
                 Text("Notes"),
                 Text("According to your syllabus",textAlign: TextAlign.center,)
               ],
             ),
           ),
         );
       }
     ),
   );
 }
}
