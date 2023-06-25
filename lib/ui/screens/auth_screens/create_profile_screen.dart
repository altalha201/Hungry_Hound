import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/customer_model.dart';
import '../../../data/model/restaurant_model.dart';
import '../../controller/cache_controller.dart';
import '../../controller/profile_create_controller.dart';
import '../../utils/util_functions.dart';
import '../../widget/app_bars/logo_app_bar.dart';
import '../../widget/button_widgets/image_selecting_button.dart';
import '../../widget/loading_widget.dart';
import '../splash_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  bool _restaurantSelected = false;

  final TextEditingController nameET = TextEditingController();
  final TextEditingController addressET = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  XFile? pickedImage;
  String? base64Img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              ImageSelectingButton(
                onPicked: (XFile? picked) {
                  pickedImage = picked;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: nameET,
                decoration: const InputDecoration(hintText: "Full name"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: addressET,
                maxLines: 5,
                decoration: const InputDecoration(hintText: "Address"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _restaurantSelected,
                    onChanged: (value) {
                      setState(() {
                        _restaurantSelected = value!;
                      });
                    },
                  ),
                  const Text("Make a Restaurant account"),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child:
                    GetBuilder<ProfileCreateController>(builder: (controller) {
                  if (controller.creatingProfile) {
                    return const LoadingWidget();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (pickedImage != null) {
                        base64Img = await convertToBase64String(pickedImage!);
                      }
                      late final bool response;
                      if (_restaurantSelected) {
                        final restaurant = RestaurantModel(
                          restaurantName: nameET.text,
                          restaurantId: Get.find<CacheController>().userId,
                          location: addressET.text,
                          img: base64Img,
                        );
                        response =
                            await controller.createRestaurant(restaurant);
                      } else {
                        final customer = CustomerModel(
                            userName: nameET.text,
                            userId: Get.find<CacheController>().userId,
                            address: addressET.text,
                            img: base64Img);
                        response = await controller.createCustomer(customer);
                      }

                      if (response) {
                        Get.offAll(const SplashScreen());
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: "Failed",
                          message: "Profile create failed",
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                    child: const Text("Create Profile"),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
