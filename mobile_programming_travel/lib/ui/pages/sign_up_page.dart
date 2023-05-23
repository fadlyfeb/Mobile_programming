import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Full Name',
          hinttext: 'Your full name',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hinttext: 'Your email address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hinttext: 'Your password',
          obscuretext: true,
          controller: passwordController,
        );
      }

      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hinttext: 'Your hobby',
          controller: hobbyController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/bonus', (route) => false);
            }
            else if(state is AuthFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content : Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              // ignore: prefer_const_constructors
              return Center(
                // ignore: prefer_const_constructors
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'Get Started',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                  email: emailController.text, 
                  password: passwordController.text, 
                  name: nameController.text, 
                  hobby: hobbyController.text
                );
              },
            );
          },
        );
      }

      Widget signInButton() {
        return GestureDetector(
          onTap: () {Navigator.pushNamed(context, '/sign-in');},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 50, bottom: 73),
            child: Text(
              'Have an account?Sign In',
              style: greenTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
            signInButton()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
