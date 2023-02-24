import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    Key? key,
    required this.timeInputStart,
    required this.timeInputEnd,
  }) : super(key: key);

  final TextEditingController timeInputStart;
  final TextEditingController timeInputEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: TextFormField(
              controller: timeInputStart,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyanAccent),
                  )),
              // onTap: () async => await getTime(),
            ),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: TextFormField(
              controller: timeInputEnd,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyanAccent),
                  )),
              // onTap: () async => getTime(),
            ),
          ),
        ),
      ],
    );
  }
}
