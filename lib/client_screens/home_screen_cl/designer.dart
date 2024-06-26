
import 'package:clint_store/models/designer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/creat_no_available_data.dart';

import '../../cubit/cubits/client_cubit.dart';
import '../../utilities/text_style.dart';

class DesignersScreen extends StatelessWidget {
  final List<Designer> designerList;

  DesignersScreen({super.key, required this.designerList});
  List<String> buttons = ["view profile", "message"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: designerList.length,
      itemBuilder: (context, index) =>
          Container(
            width: getSize(context: context).width,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: (
                BlocProvider.of<ClientCubit>(context).designers.isEmpty)
                ? CreatNoAvailableData()
                : creatDesignerDetails(
              context: context,
              designerIdentity: designerList[index]
                  .licencePicture!
                  .designerImage!,
              designerName: designerList[index].userName!,
              email: designerList[index].email!,
              address: designerList[index].address![0],
              gender: designerList[index].gender!,
              phone: designerList[index].phoneNumber!,
              specialAt: designerList[index].specialAt!,
            ),
          ),
    );
  }

  Widget creatDesignerDetails({
    required BuildContext context,
    required String designerIdentity,
    required String designerName,
    required String email,
    required String address,
    required String gender,
    required String phone,
    required String specialAt,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                color: Color(0xffD4D4D4),
                width: 1.0,
              ),
              top: BorderSide(
                color: Color(0xffD4D4D4),
                width: 1.0,
              ),
              right: BorderSide(
                color: Color(0xff070F2B),
                width: 10.0,
              ),
              bottom: BorderSide(
                color: Color(0xff070F2B),
                width: 10.0,
              )),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  designerName,
                  style: BlackTitle.display5(context)
                      .copyWith(color: Colors.red, fontSize: 18),
                ),
                subtitle: Text(
                  email,
                  style: BlackLabel.display5(context)
                      .copyWith(color: Colors.black),
                ),
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/men.png"),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Designer",
                      style: BlackTitle.display5(context)
                          .copyWith(color: Color(0xff4D4D4D), fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "address : $address",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BlackLabel.display5(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "special at : $specialAt",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BlackLabel.display5(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "gender : $gender",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BlackLabel.display5(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "phone : $phone",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BlackLabel.display5(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: getSize(context: context).width,
                height: 0.3,
                color: Colors.blueGrey,
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: buttons.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            if (index == 0) {
                              //////// هنا هتروحي علي البروفيل

                              print("view profile ${buttons[index]}");
                            } else {
                              // هنا هتروحي الشات
                              print("message  ${buttons[index]}");
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8)),
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                buttons[index],
                                style: BlackLabel.display5(context).copyWith(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
