import 'package:clint_store/common_widget/make_button.dart';
import 'package:flutter/material.dart';
import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/routes_manager.dart';
import '../utilities/text_style.dart';

class CreatAlertDialog {
  LanguageProvider? languageProvider;

  SelectCameraOrGallery({
    required BuildContext context,
    required void Function() onCameraPress,
    required void Function() onGalleryPressed,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            contentPadding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            elevation: 5,
            content: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // textDirection: languageProvider!.isEnglish == true
                      //     ? TextDirection.ltr
                      //     : TextDirection.rtl,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.cancel,
                              size: 23,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                    Text(
                      "أضف صوره البطاقه الشخصيه",
                      style:
                          BlackTitle.display5(context).copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 5),
                        Expanded(
                          flex: 2,
                          child: MakeButton(
                            height: getSize(context: context).height * 0.045,
                            // width: getSize(context: context).width*0.09,
                            title: "الكاميرا",
                            titleStyle: WhiteTitle.display5(context),
                            onTap: onCameraPress,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: MakeButton(
                              height: getSize(context: context).height * 0.045,
                              // width: 100,
                              title: "معرض الصور",
                              titleStyle: WhiteTitle.display5(context),
                              onTap: onGalleryPressed),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )),
          );
        });
  }

  ConfirmDelete({
    required BuildContext context,
    required void Function() onPress,
    required String title,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: whiteColor,
            contentPadding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            elevation: 5,
            content: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          size: 23,
                          color: mainColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                Text(
                  title,
                  style: BlackTitle.display5(context).copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: MakeButton(
                        height: getSize(context: context).height * 0.045,
                        // width: getSize(context: context).width*0.09,
                        title: "موافق",
                        titleStyle: WhiteTitle.display5(context),
                        onTap: onPress,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: MakeButton(
                          height: getSize(context: context).height * 0.045,
                          // width: 100,
                          title: "الغاء",
                          titleStyle: WhiteTitle.display5(context),
                          onTap: () {
                            RoutesManager.pop(context);
                          }),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
          );
        });
  }
}
