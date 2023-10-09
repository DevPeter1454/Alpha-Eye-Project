import 'package:flutter/material.dart';

import 'form_field_decoration.dart';

class GenericDropDown extends StatelessWidget {
  const GenericDropDown({
    Key? key,
    this.loading,
    this.onChange,
    required this.list,
    this.value,
    this.hint,
    this.validator,
  }) : super(key: key);

  final bool? loading;
  final String? hint;
  final Function(int? p1)? onChange;
  final List<Map<String, dynamic>>? list;
  final int? value;
  final String? Function(int?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: DropdownButtonFormField<int?>(
        value: value,
        decoration: textInputDecoration.copyWith(hintText: hint),
        validator: validator,
        items: (list ?? []).map((item) {
          return DropdownMenuItem<int>(
              value: item['id'], child: Text('${item['name']}'));
        }).toList(),
        onChanged: onChange,
      )),
      loading ?? false
          ? const Padding(
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    // color: AppColors.appPrimaryColor,
                    strokeWidth: 1.4,
                  )))
          : Container()
    ]);
  }
}
