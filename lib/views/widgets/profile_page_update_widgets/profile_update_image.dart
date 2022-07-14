import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/update_image_bloc/update_image_bloc.dart';
import 'package:test_app/logic/blocs/user_update_bloc/user_update_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';

class ProfileUpdateImage extends StatelessWidget{
  const ProfileUpdateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateBloc, UserUpdateState>(
        builder: (context, userState)
    {
      return BlocProvider<UpdateImageBloc>(
          create: (_) => UpdateImageBloc(),
          child: BlocConsumer<UpdateImageBloc, UpdateImageState>(
              listener: (context, state) {
                if (state is UpdateImageSuccess) {
                  context.read<UserUpdateBloc>().add(UserUpdateImageEvent(state.logoPath));
                }
              },
              builder: (context, _) {
                EmployerModel employerModel = context.read<UserUpdateBloc>().state.employerModel!;
                return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              height: 221,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.45
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 84,
                                        ),
                                        Text(employerModel.name.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const Text(
                                          'Работодатель',
                                          style: TextStyle(
                                              color: Color(0xFFB7C1D1),
                                              fontSize: 15.0
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 27.0,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF009ED1),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                context.read<UpdateImageBloc>().add(UpdateImageEvent(employerModel.logoPath));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: MediaQuery.of(context).size.width * 2/3,
                                                child: const Text(
                                                  'Изменить фотографию',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  )
                                )
                          ),
                        ],
                      ),
                      Stack(
                      children: <Widget>[
                          Center(
                            child: SizedBox(
                                width: 113,
                                height: 113,
                                child: CircularProgressIndicator(
                                strokeWidth: 6.24,
                                color: const Color(0xFF14C686),
                                value: employerModel.companyRate * 0.01,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                const SizedBox(height: 11.5),
                                SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(employerModel.logoPath),
                                      radius: 45,
                                    )
                                ),
                              ],
                            ),
                          ),
                      ]
                    )
                  ]
                );
              }
          )
      );
    }
    );
  }
}