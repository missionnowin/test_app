import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
import '../../../logic/blocs/user_bloc/user_bloc.dart';

class ProfilePageHeader extends StatelessWidget{
  const ProfilePageHeader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final EmployerModel employerModel = context.read<UserBloc>().state.employerModel!;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      height: 115,
        //margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(24.0),
        child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(employerModel.logoPath),
                radius: 32,
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Работодатель',
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF009ED1)
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(employerModel.name.toString(),
                    style: const TextStyle(
                        color: Color(0xFF3F4554),
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color(
                            0x333DD598),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: SizedBox(
                        height: 24,
                        width: 51,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(Icons.star,
                              color: Color(
                                  0xFF14C686),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(employerModel.companyRate.toString(),
                              style: const TextStyle(
                                  color: Color(0xFF14C686)),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              )
            ]
        )
    );
  }
}

