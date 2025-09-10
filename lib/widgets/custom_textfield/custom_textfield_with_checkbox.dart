import 'package:flutter/material.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'custom_textfield.dart';

class CustomtextFieldWithCheckBox extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isMandatory;
  final bool initialInfinity; // default true
  final ValueChanged<bool>? onInfinityChanged; // callback

  const CustomtextFieldWithCheckBox({
    super.key,
    required this.controller,
    required this.labelText,
    this.isMandatory = false,
    this.initialInfinity = true,
    this.onInfinityChanged,
  });

  @override
  State<CustomtextFieldWithCheckBox> createState() => _CustomtextFieldWithCheckBoxState();
}

class _CustomtextFieldWithCheckBoxState extends State<CustomtextFieldWithCheckBox> {
  late bool _isInfinity;

  @override
  void initState() {
    super.initState();
    _isInfinity = widget.initialInfinity;
    if (_isInfinity) {
      widget.controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Label
        Row(
          children: [
            if (widget.isMandatory)
              const Text("*", style: TextStyle(fontSize: 16, color: Colors.red)),
            if (widget.isMandatory) const SizedBox(width: 3),
            Text(
              widget.labelText,
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.blackColor,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded TextField
            Expanded(
              child: CustomTextField(
                controller: widget.controller,
                hintText: "0",
                labelText: "",
                isMandatory: widget.isMandatory,
                keyboardType: TextInputType.number,
                readOnly: _isInfinity, // disable when Infinity is checked
              ),
            ),

            // Checkbox + Infinity label
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _isInfinity,
                  onChanged: (val) {
                    setState(() {
                      _isInfinity = val ?? true;
                      if (_isInfinity) {
                        widget.controller.clear();
                      }
                    });
                    if (widget.onInfinityChanged != null) {
                      widget.onInfinityChanged!(_isInfinity);
                    }
                  },
                  activeColor: AppColor.primaryColor2,
                ),
                const Text(
                  "Infinity",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
