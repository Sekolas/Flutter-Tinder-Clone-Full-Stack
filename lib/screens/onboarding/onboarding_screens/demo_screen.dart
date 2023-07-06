import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/screens/onboarding/widgets/widgets.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextHeader(text: 'What\'s Your Name?'),
                    SizedBox(height: 20),
                    CustomTextField(
                      hint: 'ENTER YOUR NAME',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(name: value),
                              ),
                            );
                      },
                    ),
                    SizedBox(height: 50),
                    CustomTextHeader(text: 'What\'s Your Gender?'),
                    SizedBox(height: 20),
                    CustomCheckbox(
                      text: 'MALE',
                      value: state.user.gender == 'Male',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Male'),
                              ),
                            );
                      },
                    ),
                    CustomCheckbox(
                      text: 'FEMALE',
                      value: state.user.gender == 'Female',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Female'),
                              ),
                            );
                      },
                    ),
                    SizedBox(height: 50),
                    CustomTextHeader(text: 'What\'s Your Age?'),
                    CustomTextField(
                      hint: 'ENTER YOUR AGE',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user:
                                    state.user.copyWith(age: int.parse(value)),
                              ),
                            );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 10),
                    CustomButton(
                        tabController: tabController, text: 'NEXT STEP'),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}