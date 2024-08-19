library fancy_popups_new;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum Type {
  success, //done
  error, //done
  info, //done
  danger, //done
  delete, //done
  warning, //done
  noInternet, //done
  serverError, //done
  timeout, //done
  location, //done
  search //done
}

class MyFancyPopup extends StatelessWidget {
  final Type? type;
  final String heading, body, assetIcon, buttonText;
  final bool isSvg,canPop;
  final VoidCallback onClose;
  final Color buttonColor, backgroundColor;
  final TextStyle headingStyle, bodyStyle,buttonStyle;
  final double imageWidth, imageHeight, buttonWidth, buttonHeight,buttonRadius, dialogRadius;

  const MyFancyPopup({super.key,this.type, required this.heading,this.canPop=true,this.buttonColor=Colors.blue,this.dialogRadius=15, required this.body, required this.assetIcon,
    this.imageWidth=120,this.backgroundColor=Colors.white, this.imageHeight=120,
    this.buttonWidth=150, this.buttonHeight=50,this.buttonRadius=15, this.isSvg=false, this.bodyStyle= const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),
    this.headingStyle= const TextStyle(fontSize: 20,fontWeight: FontWeight.w600), required this.onClose,required this.buttonText, this.buttonStyle = const TextStyle(fontSize: 14,color: Colors.white)});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Dialog(
        backgroundColor: backgroundColor,
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dialogRadius),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width*0.85,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close,color: Colors.black45,),
                  )
              ),
              type!=null && isSvg==false?
              type==Type.success? Image.asset("assets/success.png", height: imageWidth, width: imageHeight):
              type==Type.error? Image.asset("assets/error.png", height: imageWidth, width: imageHeight):
              type==Type.danger? Image.asset("assets/danger.png", height: imageWidth, width: imageHeight):
              type==Type.warning? Image.asset("assets/warning.png", height: imageWidth, width: imageHeight):
              type==Type.info? Image.asset("assets/info.png", height: imageWidth, width: imageHeight):
              type==Type.search? Image.asset("assets/search.png", height: imageWidth, width: imageHeight):
              type==Type.noInternet? Image.asset("assets/noInternet.png", height: imageWidth, width: imageHeight):
              type==Type.serverError? Image.asset("assets/serverError.png", height: imageWidth, width: imageHeight):
              type==Type.timeout? Image.asset("assets/timeout.png", height: imageWidth, width: imageHeight):
              type==Type.location? Image.asset("assets/location.png", height: imageWidth, width: imageHeight):
              type==Type.delete? Image.asset("assets/delete.png", height: imageWidth, width: imageHeight):
              const SizedBox():
              isSvg? SvgPicture.asset(assetIcon, height: imageWidth, width: imageHeight):
              Image.asset(assetIcon, height: imageWidth, width: imageHeight),
              const SizedBox(height: 10),
              Text(heading, style: headingStyle,textAlign: TextAlign.center),
              Text(body, textAlign: TextAlign.center, style: bodyStyle),
              const SizedBox(height: 20),
              InkWell(
                onTap: onClose,
                child: Container(
                  height: buttonHeight,
                  width: buttonWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonRadius),
                      color: buttonColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10
                        )
                      ]
                  ),
                  child:  Center(
                    child: Text(buttonText,
                        style: buttonStyle),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

