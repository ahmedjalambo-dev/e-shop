import 'package:eshop/core/helpers/extentions.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/login/cubit/login_cubit.dart';
import 'package:eshop/features/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
            context.pushNamed(MyRoutes.home);
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
