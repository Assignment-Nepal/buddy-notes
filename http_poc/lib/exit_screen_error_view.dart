// @dart=2.9





import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExitToNativeFlow extends StatefulWidget {
  const ExitToNativeFlow({Key key}) : super(key: key);

  @override
  _ExitToNativeFlowState createState() => _ExitToNativeFlowState();
}

class _ExitToNativeFlowState extends State<ExitToNativeFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height *.1,
                ),

                // SvgPicture.asset(
                //   AppImages.noBankAccount,
                //   fit: BoxFit.contain,
                //   height: 250,
                // ),

                const SizedBox(
                  height: 50,
                ),

                const Text("something went wrong",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6
                    )),

                const SizedBox(
                  height: 12,
                ),


                RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                    text: "bummer! we weren't able to fetch any details from your bank.",
                    style: const  TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.2,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.6,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Know More",
                        style:  const  TextStyle(
                            color: Color(0xFF624DC2),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2
                        ),
                        recognizer:  TapGestureRecognizer()..onTap = () => print("hi"),
                      ),
                    ],
                  ),
                ),


                const Spacer(),

                CustomButton(onTap: (){

                }, label: 'Skip',
                ),

                TextButton(
                  onPressed: () {
                    /// Navigate to blank screen in onboarding module then close flutter activity;
                    //  Modular.to.pushNamed('/blank_screen');
                    },
                  child: const Text("Exit",
                    style:  TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 16,
                        letterSpacing: 0.4
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButton extends  StatefulWidget {
  final GestureTapCallback onTap;
  final String label;
  Color backGroundColor;
  CustomButton({Key key, this.onTap, this.label,this.backGroundColor =  Colors.deepPurpleAccent,}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:widget.backGroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100)
        ),
        child:  Text(widget.label,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6
            )),
      ),
    );
  }
}