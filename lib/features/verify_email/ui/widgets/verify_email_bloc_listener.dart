import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/verify_email/cubit/verify_email_cubit.dart';
import 'package:eshop/features/verify_email/cubit/verify_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
          success: (data) {
            context.pop(); // Close loading dialog
            // Navigate to login after successful verification
            context.pushNamedAndRemoveUntil(
              MyRoutes.login,
              predicate: (route) => false,
            );
          },
          failure: (message) {
            context.pop(); // Close loading dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.error),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Got it'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
