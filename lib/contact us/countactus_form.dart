import 'package:clint_store/common_widget/creat_loading.dart';
import 'package:clint_store/common_widget/create_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_manager/local_data.dart';
import '../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../common_widget/make_appbar.dart';
import '../cubit/application_state/client_states.dart';
import '../cubit/cubits/client_cubit.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,    hasCart:true,
        hasBackButton: true,

        title: 'Contact Us',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();

        },
        hasDrawer: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "Contact Us For Help",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        //isDense: true,
                        // prefixIcon: Icon(Icons.home_outlined,
                        //     color: Color(0xff070F2B), size: 25),
                        //hintText: "your address",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: usernameController,
                      // validator: (value) {
                      //   if (usernameController.text.isEmpty) {
                      //     return 'please enter Your Name';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: emailController,
                      // validator: (value) {
                      //   if (emailController.text.isEmpty) {
                      //     return 'Please enter your email';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: subjectController,
                      // validator: (value) {
                      //   if (subjectController.text.isEmpty) {
                      //     return 'Please enter your email';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      maxLines: 4,
                      controller: messageController,
                      // validator: (value) {
                      //   if (messegeController.text.isEmpty) {
                      //     return 'Please enter your email';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<ClientCubit, ClientStates>(
                      builder: (BuildContext context, state) {
                        ClientCubit clientCubit = ClientCubit.get(context);
                        return Padding(
                          padding: EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                          child: state is ContactUsLoading
                              ? CreatLoading()
                              : MaterialButton(
                                  onPressed: () {
                                    print(
                                        "usernameController :  ${usernameController.text}");
                                    print(
                                        "subjectController :  ${subjectController.text}");
                                    print(
                                        "messageController :  ${messageController.text}");
                                    print(
                                        "emailController :  ${emailController.text}");

                                    if (usernameController.text
                                            .trim()
                                            .isEmpty ||
                                        subjectController.text.trim().isEmpty ||
                                        messageController.text.trim().isEmpty ||
                                        emailController.text.trim().isEmpty) {
                                      CreatToast().showToast(
                                          errorMessage:
                                              "من فضلك اكمل البيانات الثابقه",
                                          context: context);
                                    } else {
                                      clientCubit.contactUs(
                                          userName: usernameController.text,
                                          email: emailController.text,
                                          subject: subjectController.text,
                                          message: messageController.text);
                                    }
                                  },
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff070F2B),
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  textColor: Colors.white,
                                  minWidth: double.infinity,
                                  height: 52,
                                  color: Color(0xff070F2B),
                                  elevation: 0.20,
                                  child: Text("Send Message",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ),
                        );
                      },
                      listener: (BuildContext context, Object? state) {
                        print(
                            "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV $state");

                        if (state is ContactUsSuccess) {
                          CreatToast().showToast(
                              errorMessage: "تم إرسال الرساله بنجاح",
                              context: context);

                          usernameController.clear();
                          subjectController.clear();
                          messageController.clear();
                          emailController.clear();
                        } else if (state is ContactUsError) {
                          CreatToast().showToast(
                              errorMessage: "عفوا لقد حدث خطأ ولم يتم الارسال",
                              context: context);
                        } else if (state is ServerErrorClient) {
                          CreatToast().showToast(
                              errorMessage: serverError,
                              context: context,
                              duration: 5);
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
