import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/bloc/biometric/biometric_cubit.dart';
import 'package:mobile/screens/account/login.dart';

import '../../widget/settings_content.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() {
    return _SecurityState();
  }
}

class _SecurityState extends State<Security> {
  var isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        color: Color(0xFFF8F8F8),
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SettingsContent(
                prefixIcon: Icons.lock_outline,
                suffixWidget: Transform.scale(
                  scale: 0.6,
                  child: BlocBuilder<BiometricCubit, bool>(
                    builder: (context, useBiometric) {
                      return Switch(
                        value: useBiometric,
                        onChanged: (value) {
                          context.read<BiometricCubit>().toggleBiometric(value);
                        },
                        inactiveTrackColor: Colors.grey.shade200,
                        activeTrackColor: Colors.green,
                      );
                    },
                  ),
                ),
                title: 'Biometrics',
              ),
              SettingsContent(
                prefixIcon: Icons.password_outlined,
                suffixIcon: Icons.arrow_forward_ios_outlined,
                title: 'Change Password',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
