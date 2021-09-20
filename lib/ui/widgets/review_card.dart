import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/review_model.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';

import 'bottombar.dart';

class ReviewItem extends StatelessWidget {
  final UserReview userReview;

  const ReviewItem({Key? key, required this.userReview}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClayContainer(
        color: Colors.white,
        spread: 5,
        depth: 7,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: blueColor,
                  child:
                      Text(userReview.reviewerName[0], style: headerTextStyle)),
              title: Text(
                userReview.reviewerName,
                style: headerTextStyle,
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.today,
                    color: iconColor,
                  ),
                  //  how to use the util package
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${userReview.reviewDate.year}-${userReview.reviewDate.month}-${userReview.reviewDate.day} ${userReview.reviewDate.hour}:${userReview.reviewDate.minute}',
                    style: reviewTextStyle,
                  )
                ],
              ),
              trailing: ReviewChip(
                discount: userReview.reviewRating,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Text(userReview.reviewText,
                style: reviewTextStyle.copyWith(fontSize: 15))
          ],
        ),
      ),
    );
  }
}

class ReviewChip extends StatelessWidget {
  final double discount;

  const ReviewChip({Key? key, required this.discount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 28,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10),
          left: Radius.circular(10),
        ),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Text(
              discount.toString(),
              style: chipTextStyle,
            ),
            Icon(
              Icons.star_border,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      )),
    );
  }
}
