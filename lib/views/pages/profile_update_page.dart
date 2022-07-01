// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '../../components/models/employer.dart';
import '../../service/api/api_singleton.dart';

class ProfilePageUpdate extends StatefulWidget{
  const ProfilePageUpdate({Key? key}) : super(key: key);

  @override
  _ProfilePageUpdateState createState() => _ProfilePageUpdateState();
}

class _ProfilePageUpdateState extends State<ProfilePageUpdate>{
  final _api = ApiSingleTon.instance;
  final _headers = ['ФИО', 'Названия организации', 'E-mail', 'Номер телефона', 'Юридический адрес', 'Фактический адрес', 'О компании', 'Должность'];
  final List<TextEditingController> _controllers = List.generate(8, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: FutureBuilder<Employer>(
          future: _api.getData(),
          builder: (context, snapshot){
            if(snapshot.hasData) {
              Employer employer = snapshot.data!;
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        children:<Widget>[
                            const Text('Профиль работодателя',
                              style: TextStyle(
                                color: Color(0xFF009ED1),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text('Настройки профиля',
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 0.45
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                margin: const EdgeInsets.all(10.0),
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
                                      Text(employer.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text('Работодатель',
                                        style: TextStyle(
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
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                )
                              ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              height: 730,
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
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              )
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          TextField(
                                            controller: _controllers[i],
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
                                            height: 7.0,
                                          ),
                                        ]
                                    ),
                                  );
                                }
                              )
                          ),
                      Center(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF009ED1),
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: TextButton(
                                        onPressed: () async{
                                            employer.update(
                                                orgName: _controllers[1].text,
                                                name: _controllers[0].text,
                                                email: _controllers[2].text,
                                                legalAddress: _controllers[4].text,
                                                actualAddress: _controllers[5].text,
                                                companyDescription: _controllers[6].text,
                                                post: _controllers[7].text
                                            );
                                            if(await _api.saveData(employer) == 200){
                                              Navigator.of(context).pop();
                                            }
                                        },
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width - 50,
                                          child: const Text(
                                            'Сохранить',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
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
                                          Navigator.of(context).pop();
                                        },
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width - 50,
                                          child: const Text(
                                            'Отменить',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
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
                        ]
                      )
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