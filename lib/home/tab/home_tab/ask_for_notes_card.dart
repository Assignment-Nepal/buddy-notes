
import 'package:buddyapp/auth_ui/constants/strings.dart';
import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AskForNotesCard extends StatefulWidget {
  const AskForNotesCard({Key? key,
  }) : super(key: key);
  @override
  _AskForNotesCardState createState() => _AskForNotesCardState();
}

class _AskForNotesCardState extends State<AskForNotesCard> {


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [


        const SizedBox(height: 30),

        const Padding(
          padding:  EdgeInsets.only(left: 16, right: 16,bottom: 15),
          child: Text(Strings.askForNotesTittle, maxLines: 1, overflow: TextOverflow.fade, softWrap: false,
              style: TextStyle(color:AppColors.textColorLighter, fontSize: 18,fontWeight: FontWeight.w500)),
        ),

        askMyNotesCard(context),

        const SizedBox(height: 30),
      ],
    );
  }
  Widget askMyNotesCard(BuildContext context){
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16,),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
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
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  InkWell(
                    onTap: () {

                    },
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            margin:  const EdgeInsets.only(left: 10),
                            height: 45,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:AppColors.yellowNotesColor,
                            ),
                            child: const Icon(Icons.star,color: AppColors.accentContrastColor,size: 24,),),

                          const SizedBox(width: 5,),

                          Expanded(
                              child: Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const Text(Strings.askForNotes,maxLines: 3,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(color: AppColors.gray600,fontSize: 14,letterSpacing: .2),
                                    ),

                                    const SizedBox(height: 16),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [

                                          Container(
                                            height: 20,
                                            width: 6,
                                            color: Colors.green,
                                          ),

                                          const SizedBox(width: 8),

                                          const Text(Strings.letsCollaborate,maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(color: AppColors.gray600,fontSize: 14,letterSpacing: .2),
                                          ),
                                        ],),

                                        Row(
                                          children: [
                                            avatarWidget(),
                                            avatarWidget(),
                                            avatarWidget()
                                          ],
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )),

        ],
      ),
    );
  }

  Widget avatarWidget({String? assets}){
    return const CircleAvatar(
      //backgroundImage: ExactAssetImage(assets),
      radius: 15,
    );
  }

}