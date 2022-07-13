import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/update_image_bloc/update_image_bloc.dart';
import 'package:test_app/logic/blocs/user_update_bloc/user_update_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';

class ProfileUpdateImageForm extends StatelessWidget{
  const ProfileUpdateImageForm({Key? key}) : super(key: key);

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
                return Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(25.0),
                          height: 262,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.45
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(employerModel
                                        .logoPath),
                                    radius: 55,
                                  )
                              ),
                              const SizedBox(
                                height: 7,
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
                                    fontFamily: '.SF UI Display',
                                    color: Color(0xFFB7C1D1),
                                    fontSize: 15.0
                                ),
                              ),
                              const SizedBox(
                                height: 17.0,
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
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 2/3,
                                        child: const Text(
                                          'Изменить фотографию',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: '.SF UI Display',
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
                    ]
                );
              }
          )
      );
    }
    );
  }
}