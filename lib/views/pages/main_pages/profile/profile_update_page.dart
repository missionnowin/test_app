// ignore_for_file: library_private_types_in_public_api
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/profile_update_bloc/profile_update_bloc.dart';
import 'package:test_app/logic/components/models/employer_model.dart';
import 'package:test_app/service/api/api_service.dart';

class ProfilePageUpdate extends StatelessWidget{
  final _api = ApiService();
  final _headers = ['ФИО', 'Названия организации', 'E-mail', 'Юридический адрес', 'Фактический адрес', 'О компании', 'Должность'];
  final List<TextEditingController> _controllers = List.generate(7, (i) => TextEditingController());

  ProfilePageUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: FutureBuilder<EmployerModel>(
          future: _api.getData(),
          builder: (context, snapshot){
            if(snapshot.hasData) {
              EmployerModel employer = snapshot.data!;
              var s = [employer.name, employer.orgName, employer.email, employer.legalAddress, employer.actualAddress, employer.companyDescription, employer.post];
              return Scaffold(
                  backgroundColor: const Color(0xFFFAFAFB),
                  body: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Container(
                              height: 80,
                              margin: const EdgeInsets.symmetric(horizontal: 12.0),
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),

                              child: ListView(
                              children: const <Widget>[
                                SizedBox(
                                  height: 13,
                                ),
                                Text('Профиль работодателя',
                                  style: TextStyle(
                                    fontFamily: '.SF UI Display',
                                    color: Color(0xFF009ED1),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text('Настройки профиля',
                                  style:
                                  TextStyle(
                                    fontFamily: '.SF UI Display',
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              ),
                            )
                          ),
                        Container(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          margin: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
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
                                          backgroundImage: NetworkImage(employer.logoPath),
                                          radius: 55,
                                        )
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(employer.name.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text('Работодатель',
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
                                            onPressed: () async{
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
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                  height: 630,
                                  child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _headers.length,
                                      itemBuilder: (BuildContext context, int i) {
                                        return SizedBox(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              textDirection: TextDirection.ltr,
                                              children: <Widget>[
                                                Text(_headers[i],
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: '.SF UI Display',
                                                      color: Colors.black.withOpacity(0.5),
                                                    )
                                                ),
                                                const SizedBox(
                                                  height: 6.0,
                                                ),
                                                TextFormField(
                                                  controller: _controllers[i]..text = s[i]!,
                                                  onEditingComplete: ()  {

                                                  },
                                                  decoration: InputDecoration(
                                                    enabledBorder:  OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      borderSide: const BorderSide(color: Color(
                                                          0xFFB6B6B6), width: 0.7),
                                                    ),
                                                    border: const OutlineInputBorder(),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                              ]
                                          ),
                                        );
                                      }
                                  )
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: BlocProvider(
                                    create: (_) => ProfileUpdateBloc(),
                                    child: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
                                      listener: (context, state){
                                        if(state is ProFileUpdateSuccess){
                                          AutoRouter.of(context).navigateBack();
                                        }
                                        if(state is ProfileUpdateError){
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong')));
                                        }
                                      },
                                      child: Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.center,
                                              child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF009ED1),
                                                      borderRadius: BorderRadius.circular(10.0)
                                                  ),
                                                  child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
                                                    builder: (context, state) {
                                                      return TextButton(
                                                        onPressed: () {
                                                          employer.update(
                                                              orgName: _controllers[1].text,
                                                              name: _controllers[0].text,
                                                              email: _controllers[2].text,
                                                              legalAddress: _controllers[3].text,
                                                              actualAddress: _controllers[4].text,
                                                              companyDescription: _controllers[5].text,
                                                              post: _controllers[6].text
                                                          );
                                                          context.read<ProfileUpdateBloc>().add(ProfileUpdateEvent(employer));
                                                        },
                                                        child: SizedBox(
                                                          width: MediaQuery.of(context).size.width - 50,
                                                          child: const Text(
                                                            'Сохранить',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: '.SF UI Display',
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                              ),
                                            ),
                                            const SizedBox(
                                                height: 13
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFFE9EEF1),
                                                      borderRadius: BorderRadius.circular(10.0)
                                                  ),
                                                  child: TextButton(
                                                    onPressed: (){
                                                      AutoRouter.of(context).pop();
                                                    },
                                                    child: SizedBox(
                                                      width: MediaQuery.of(context).size.width - 50,
                                                      child: const Text(
                                                        'Отменить',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: '.SF UI Display',
                                                          color: Color(0xFF617088),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ),
                                            const SizedBox(
                                                height: 45
                                            ),
                                          ]
                                      )
                                  )
                              ),
                              )
                            ],
                          ),
                        )
                        ]
                      )
                    ]
                  )
            );
            }
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        ),
      );
  }
}