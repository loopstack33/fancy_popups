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
  final VoidCallback? onClose;
  final Color buttonColor, backgroundColor;
  final TextStyle headingStyle, bodyStyle,buttonStyle;
  final double imageWidth, imageHeight, buttonWidth, buttonHeight,buttonRadius, dialogRadius;

  const MyFancyPopup({super.key,this.type, required this.heading,this.canPop=true,this.buttonColor=Colors.blue,this.dialogRadius=15, required this.body, this.assetIcon="",
    this.imageWidth=120,this.backgroundColor=Colors.white, this.imageHeight=120,
    this.buttonWidth=150, this.buttonHeight=50,this.buttonRadius=15, this.isSvg=false, this.bodyStyle= const TextStyle(fontSize: 14,fontWeight: FontWeight.w300,fontFamily: 'Futura'),
    this.headingStyle= const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Futura'), this.onClose,required this.buttonText, this.buttonStyle = const TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Futura')});

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
              isSvg? SvgPicture.asset(assetIcon, height: imageWidth, width: imageHeight):
              Image.asset(type==Type.success? "assets/images/success.png" :
              type==Type.error? "assets/images/error.png" :
              type==Type.danger? "assets/images/danger.png" :
              type==Type.warning? "assets/images/warning.png" :
              type==Type.info? "assets/images/info.png" :
              type==Type.search? "assets/images/search.png" :
              type==Type.noInternet? "assets/images/wifi.png" :
              type==Type.serverError? "assets/images/server.png" :
              type==Type.timeout? "assets/images/timeout.png" :
              type==Type.location? "assets/images/location.png" :
              type==Type.delete? "assets/images/delete.png" :
              assetIcon, height: imageWidth, width: imageHeight),
              const SizedBox(height: 10),
              Text(heading, style: headingStyle,textAlign: TextAlign.center),
              Text(body, textAlign: TextAlign.center, style: bodyStyle),
              const SizedBox(height: 20),
              InkWell(
                onTap: onClose ?? (){
                  Navigator.pop(context);
                },
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

