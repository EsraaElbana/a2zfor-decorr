import 'package:clint_store/utilities/routes_manager.dart';
import 'package:flutter/material.dart';

import '../client_Screens/success_screen/success_screen.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController paymentMethodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Checkout Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(flex: 2, child: Image.asset("assets/images/logo.png")),
            Expanded(
              flex: 6,
              child: Column(children: [
                const Text(
                  "Checkout Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  controller: nameController,
                  // validator: (value) {
                  //   if (nameController.text.isEmpty) {
                  //     return 'please enter Your Name';
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_sharp,
                        color: Color(0xff070F2B), size: 25),
                    isDense: true,
                    hintText: "your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color(0xFF181A4D),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: addressController,
                  // validator: (value) {
                  //   if (addressController.text.isEmpty) {
                  //     return 'please enter Your address';
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.home_outlined,
                        color: Color(0xff070F2B), size: 25),
                    hintText: "your address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  // validator: (value) {
                  //   if (phoneNumberController.text.isEmpty) {
                  //     return 'please enter Your Phone number';
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.phone_rounded,
                        color: Color(0xff070F2B), size: 25),
                    hintText: " your Phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 18, 24, 70),
                        width: 15.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: paymentMethodController,
                  // validator: (value) {
                  //   if (paymentMethodController.text.isEmpty) {
                  //     return 'please confirm the password';
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.monetization_on,
                        color: Color(0xff070F2B), size: 25),
                    isDense: true,
                    hintText: " payment method ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                  child: MaterialButton(
                    onPressed: () {
                      RoutesManager.navigatorPush(context, SuccessScreen());
                    },
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff070F2B),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 50,
                    color: Color(0xff070F2B),
                    elevation: 0.5,
                    child: Text("Submit",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
