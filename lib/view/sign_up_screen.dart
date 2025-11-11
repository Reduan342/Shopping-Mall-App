import 'package:business_apk/utils/app_textstyle.dart';
import 'package:business_apk/view/widgets/customer_textfield.dart';
import 'package:business_apk/view/widgets/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Signup to get started',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),

              const SizedBox(height: 40),
              //full name textfield
              CustomerTextfield(
                label: 'Full name',
                prefixIcon: Icons.person_outlined,
                keyboardType: TextInputType.name,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              //email textfield
              CustomerTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              //password textfield
              CustomerTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                ispass: true,
                controller: _passController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              //confirm password textfield
              CustomerTextfield(
                label: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                ispass: true,
                controller: _passController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Confirm your Password';
                  }
                  if (value != _passController.text) {
                    return 'password do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              //signup button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const MainScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12)
                    )
                  ),
                  child: Text(
                    'Sign Up',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white ,
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 24),
              //signin 
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: AppTextstyle.withColor(
                      AppTextstyle.labelMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => SignUpScreen()),
                    child: Text(
                      'Sign In',
                      style: AppTextstyle.withColor(
                        AppTextstyle.labelMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
               ), 
            ],
          ),
        ),
      ),
    );
  }
}
