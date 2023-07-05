import 'package:flutter/material.dart';

import '../../../data/model/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key, required this.model,
  }) : super(key: key);

  final ReviewModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey.shade800,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    model.userName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                model.reviewDescription ?? "",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
