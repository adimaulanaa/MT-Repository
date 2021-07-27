import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/theme/color.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/theme/textstyle.dart';

class secondDashboard extends StatefulWidget {
  secondDashboard({Key? key}) : super(key: key);

  @override
  _secondDashboard createState() => _secondDashboard();
}

// ignore: camel_case_types
class _secondDashboard extends State<secondDashboard> {
  final _formkey = GlobalKey<FormBuilderState>();

  var provinsiOptions = ["Jakarta", "Bandung", "Banten"];
  String provinsiPrimary = '';
  String provinsiSecondary = '';
  int checkbox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Form Register', style: Colors.black,),
        backgroundColor: ColorPalette.grey,
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MyHomePage(
                title: StringResources.TEXT_APLICATION_TITLE,
              );
            }));
          },
        ),
        actions: <Widget>[
          new TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage(
                    title: StringResources.TEXT_APLICATION_TITLE,
                  );
                }));
              },
              child: Text("Skip"))
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: ColorPalette.grey,
            // height: 20s.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 70, 0),
                    child: Text(
                      "Lengkapi data diri",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: Text("Mohon Untuk Melengkapi Data Diri Anda",
                        style: TextStyle(fontSize: 15)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: FormBuilder(
        key: _formkey,
        child: ListView(
          addAutomaticKeepAlives: true,
          children: <Widget>[
            SizedBox(
              // width: 370,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 313, 0),
                    child: Text(
                      "Provinsi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 950,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: FormBuilderDropdown(
                          name: 'provinsi',
                          decoration: InputDecoration(
                            // labelText: 'Provinsi',
                            fillColor: ColorPalette.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          // initialValue: 'Male',
                          allowClear: true,
                          hint: Text('Pilih Provinsi'),
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          items: provinsiOptions
                              .map((provinsi) => DropdownMenuItem(
                                    value: provinsi,
                                    child: Text('$provinsi'),
                                  ))
                              .toList(),
                          onChanged: (provinsi) {
                            setState(() {
                              provinsiPrimary = provinsi.toString();
                            });
                            // Prov = provinsi.toString();
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: FormBuilderCheckbox(
                      name: 'samaKtp',
                      // onChanged: (),
                      initialValue: false,
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Samakan dengan Alamat KTP ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      validator: FormBuilderValidators.equal(
                        context,
                        true,
                        errorText:
                            'You must accept terms and conditions to continue',
                      ),
                      onChanged: (samaKtp) {
                        setState(() {
                          if (samaKtp == true) {
                            print('bener');
                            checkbox = 1;
                            provinsiSecondary = provinsiPrimary;
                            print('kedua ' + provinsiSecondary);
                          } else {
                            print("salah");
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    // width: 370,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 280, 0),
                          child: Text(
                            "Provinsi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: 950,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: FormBuilderDropdown(
                              // initialValue: Prov.toString(),

                              name: 'setProvinsi',
                              decoration: InputDecoration(
                                // labelText: 'Provinsi',
                                fillColor: ColorPalette.grey,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text('Pilih Provinsi'),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              items: provinsiOptions
                                  .map((setProvinsi) => DropdownMenuItem(
                                        value: provinsiSecondary,
                                        child: Text('$provinsiSecondary'),
                                      ))
                                  .toList(),
                              onChanged: (setProvinsi) {
                                setState(() {
                                  // setProvinsi = provinsiSecondary;
                                  print("test");
                                });
                              },
                              // initialValue: (setProvinsi) {
                              //   setState(() {
                              //     if (checkbox == 1) {
                              //       print('test');
                              //       // setProvinsi = provinsiSecondary;
                              //     }
                              //   });
                              // }
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
