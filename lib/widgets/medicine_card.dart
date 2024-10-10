// lib/widgets/medicine_card.dart
import 'package:flutter/material.dart';

import '../models/medicine.dart'; // Import your Medicine model

class MedicineCard extends StatefulWidget {
  final Medicine medicine;
  const MedicineCard({super.key, required this.medicine});

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 125,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 10, 186, 180),
            blurRadius: 10,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        //color: Colors.blueGrey[50],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset('assets/images/pills.jpg'),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.medicine.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${widget.medicine.dosage}, ${widget.medicine.amount}x fois',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.medicine.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Checkbox(
            value: isChecked,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool;
              });
            },
          )
        ],
      ),
    );
  }
}
