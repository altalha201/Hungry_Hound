import 'package:flutter/material.dart';

import '../../widget/app_bars/logo_app_bar.dart';
import '../../widget/button_widgets/image_selecting_button.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  bool _restaurantSelected = false;

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
                onPressed: () {},
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Full name"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create Profile"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
