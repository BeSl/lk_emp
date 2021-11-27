import 'package:flutter/material.dart';
import 'package:lk_emp/model/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Text(User(userId: '1', name: 'Igor').toString());
}
