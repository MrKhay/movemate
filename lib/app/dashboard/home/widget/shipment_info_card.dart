import 'package:flutter/material.dart';
import '../../../../shared/index.dart';

class ShipmentInfoCard extends StatelessWidget {
  const ShipmentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kTracking,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.padding3),

          // Details
          Container(
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.transparency(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: context.padding2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: context.padding0,
                        children: [
                          Text(
                            'Shipment Number',
                            style: context.captionText.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.txtGray,
                            ),
                          ),
                          Text(
                            'NEJ20089934122231',
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(Assets.folkLift),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.padding1),
                Divider(
                  endIndent: context.padding2,
                  indent: context.padding2,
                ),
                SizedBox(height: context.padding1),

                // Sender
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: context.padding1,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(Assets.boxOut),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sender',
                                  style: context.captionText.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.txtGray,
                                  ),
                                ),
                                Text(
                                  'Atlanta, 5243',
                                  style: context.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: context.padding2),
                      Expanded(
                        child: Container(
                          child: Row(
                            spacing: context.padding1,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: context.captionText.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: context.txtGray,
                                    ),
                                  ),
                                  Row(
                                    spacing: context.padding0,
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        '2 day - 3 days',
                                        style: context.bodyMedium.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.padding4),

                // Receiver
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: context.padding1,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(Assets.boxIn),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Receiver',
                                  style: context.captionText.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.txtGray,
                                  ),
                                ),
                                Text(
                                  'Chicago, 6342',
                                  style: context.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: context.padding2),
                      Expanded(
                        child: Container(
                          child: Row(
                            spacing: context.padding1,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Status',
                                    style: context.captionText.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: context.txtGray,
                                    ),
                                  ),
                                  Text(
                                    'Waiting to collect',
                                    style: context.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.padding2),
                Divider(),

                /// Add shop button
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Add Stop',
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kOrange,
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 20,
                    color: kOrange,
                  ),
                ),

                SizedBox(height: context.padding1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
