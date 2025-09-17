import 'package:flutter/material.dart';

// ---------- Reusable Button Class ----------
class CustomProfileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDownload; // ✅ new function

  const CustomProfileButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.onDownload, // ✅
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 22, color: Colors.black87),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.download, size: 20, color: Colors.black54),
              onPressed: onDownload, // ✅ triggers download separately
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
