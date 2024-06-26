import 'package:clint_store/Engineer/main%20home/pages_in_drawer/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Engineer/main home/pages_in_drawer/setting.dart';


class DrawerEngineer extends StatelessWidget {
  const DrawerEngineer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: 240,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/Ellipse 2.png"),
                        ),
                      ),
                      Text("userName"),
                      Text("email"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.menu_rounded)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EngineerEditingPage();
                },
              )),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffdcdcdc)),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(children: const [
                  Icon(Icons.mode_edit_outline_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Edite Profile",
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return settingProfileEngineer();
                },
              )),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdcdcdc)),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Row(children: [
                  Icon(Icons.settings_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Setting",
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffdcdcdc)),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Row(children: [
                  Icon(Icons.output_sharp),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Log Out",
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Image.asset("assets/Ellipse 2.png"),
