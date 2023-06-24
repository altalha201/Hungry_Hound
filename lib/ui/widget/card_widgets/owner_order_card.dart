import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class OwnerOrderCard extends StatelessWidget {
  const OwnerOrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Dish Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  SizedBox(height: 4.0,),
                  Text("Address", style: TextStyle(color: Colors.grey),),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_outlined, color: Colors.redAccent,),),
              const SizedBox(width: 8.0,),
              IconButton(onPressed: () {}, icon: const Icon(Icons.check, color: colorPrimaryGreen,),),
            ],
          ),
        ),
      ),
    );
  }
}
