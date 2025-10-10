import 'package:eshop/core/helpers/extentions.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          ),
          success: (data) {
            context.pop();
            // Get the email from the cubit
            final email = context.read<SignUpCubit>().emailController.text;
            context.pushNamed(MyRoutes.verify_email, arguments: email);
          },
          failure: (message) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: Icon(Icons.error),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Got it'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
