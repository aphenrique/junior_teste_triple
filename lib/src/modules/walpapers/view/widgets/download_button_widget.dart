import 'package:flutter/material.dart';

class DownloadButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const DownloadButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'DOWNLOAD',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width - 40, 50),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
