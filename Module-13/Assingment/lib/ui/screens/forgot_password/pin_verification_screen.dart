import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../widgets/background_widget.dart';
import 'reset_password_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  final String email;

  const PinVerificationScreen({super.key, required this.email});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _pinVerifyInProgress = false;

  Future<void> _verifyPin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _pinVerifyInProgress = true;
    });

    final String otp = _pinTEController.text;
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.recoverVerifyOTP(widget.email, otp),
    );

    setState(() {
      _pinVerifyInProgress = false;
    });

    if (response.isSuccess && response.responseData['status'] == 'success') {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP code verified! Please set a new password.'),
            backgroundColor: Color(0xFF21b573),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(
              email: widget.email,
              otp: otp,
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.errorMessage ?? 'Invalid OTP code! Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PIN Verification',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E3E5C),
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'A 6 digit verification pin will send to your email address.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: const Color(0xFF21b573),
                      inactiveColor: Colors.grey,
                      selectedColor: const Color(0xFF21b573),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _pinTEController,
                    appContext: context,
                    validator: (String? value) {
                      if (value == null || value.length < 6) {
                        return 'Enter the 6-digit OTP code';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: !_pinVerifyInProgress,
                      replacement: const Center(
                        child: CircularProgressIndicator(color: Color(0xFF21b573)),
                      ),
                      child: ElevatedButton(
                        onPressed: _verifyPin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21b573),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have account?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black85,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Clear all routes and go to Login screen
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFF21b573),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
