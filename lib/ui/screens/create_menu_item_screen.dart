import 'package:flutter/material.dart';

import '../widget/app_bars/logo_app_bar.dart';
import '../widget/button_widgets/image_selecting_button.dart';

class CreateMenuItemScreen extends StatelessWidget {
  const CreateMenuItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Item Name"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Quantity"),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Price"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              ImageSelectingButton(
                onPressed: () {},
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                maxLines: 6,
                decoration: const InputDecoration(hintText: "Food description"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create Item"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
