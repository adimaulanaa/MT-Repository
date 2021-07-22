import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/theme/color.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:mini_project/config/stringresource.dart';

class DataProfile extends StatefulWidget {
  DataProfile({Key? key}) : super(key: key);

  @override
  _DataProfileState createState() => _DataProfileState();
}

class _DataProfileState extends State<DataProfile> {
  int selectedJK = 0;
  final _formkey = GlobalKey<FormBuilderState>();
  bool value = true;
  var provinsiOptions = ["Jakarta", "Bandung", "Banten"];
  var kotaOptions = ["Cengkareng", "Meruya", "Joglo"];
  var kecamatanOptions = ["Serpong Utara", "Pondok Aren"];
  var kelurahanOptions = ["Serpong Utara", "Pondok Aren"];
  var rtOptions = ["01", "02", "03", "04", "05"];
  var rwOptions = ["001", "002", "003", "004", "005"];
  List listItem = [
    "DKI Jakarta",
    "Jawa Barat",
    "Jawa Timur",
    "Jawa Selatan",
  ];

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

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(130.0),
        //   child: Container(
        //     color: ColorPalette.grey,
        //     height: 75.0,
        //     width: double.infinity,
        //     child: Padding(
        //       padding: const EdgeInsets.fromLTRB(20, 0, 120, 0),
        //       child: Column(
        //         children: [
        //           Text(
        //             "Lengkapi data diri",
        //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        //           ),
        //           Text("Mohon Untuk Melengkapi Data Diri Anda")
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: FormBuilder(
        key: _formkey,
        child: ListView(
          children: [
            SetNama(),
            SetJK(),
            SetTempatTanggal(),
            SetJalan(),
            SetKTP(),
            SetProvinsi(),
            SetKokap(),
            SetKecamatan(),
            SetKelurahan(),
            SetRtRw(),

            ///
            SetSimpan(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        // Text(''),
        child: Text("Add"),
      ),
    );
  }

  Widget SetNama() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 300, 0),
              child: Text(
                "Nama",
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
                // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
                child: FormBuilderTextField(
                    decoration: InputDecoration(
                        // labelText: "Nama",
                        fillColor: ColorPalette.grey,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Nama"),
                    name: 'nama'),
              ),
            ),
          ],
        ),
      );

  Widget SetJK() => Padding(
        padding: const EdgeInsets.fromLTRB(70, 0, 90, 0),
        // child: Center(
        // child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 100, 0),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
              child: Text(
                "Jenis Kelamin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            FormBuilderRadioGroup(
              // decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              name: 'jeniskelamin',
              validator: FormBuilderValidators.required(context),
              options: [
                'Laki-Laki',
                'Perempuan',
              ]
                  .map((jk) => FormBuilderFieldOption(value: jk))
                  .toList(growable: false),
            ),
          ],
        ),
        // ),
        // ),
      );

  Widget SetTempatTanggal() => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 80, 10),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: Text(
                      'Tempat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FormBuilderTextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          // labelText: "Tempat",
                          fillColor: ColorPalette.grey,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Tempat"),
                      name: 'tempat'),
                ],
              ),
            ),
            SizedBox(
              width: 20.20,
              height: 20.0,
            ),
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: Text(
                      'Tanggal Lahir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FormBuilderTextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.date_range),
                          contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                          // labelText: "Tanggal Lahir",
                          fillColor: ColorPalette.grey,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "DD/MM/YYYY"),
                      name: 'tglLahir'),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  Widget SetJalan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 300, 0),
              child: Text(
                "Jalan",
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
                // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
                child: FormBuilderTextField(
                    decoration: InputDecoration(
                        // labelText: "Nama",
                        fillColor: ColorPalette.grey,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Jalan"),
                    name: 'jalan'),
              ),
            ),
          ],
        ),
      );

  Widget SetProvinsi() => SizedBox(
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
                  name: 'kokap',
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
                ),
              ),
            ),
          ],
        ),
      );

  Widget SetKokap() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 220, 0),
              child: Text(
                "Kota/Kabupaten",
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
                  name: 'kokap',
                  decoration: InputDecoration(
                    // labelText: 'Kota',
                    fillColor: ColorPalette.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Pilih Kota/Kabupaten'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kotaOptions
                      .map((kokap) => DropdownMenuItem(
                            value: kokap,
                            child: Text('$kokap'),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget SetKecamatan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 250, 0),
              child: Text(
                "Kecamatan",
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
                  name: 'kecamatan',
                  decoration: InputDecoration(
                    // labelText: 'Kota',
                    fillColor: ColorPalette.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Pilih Kecamatan'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kecamatanOptions
                      .map((kecamatan) => DropdownMenuItem(
                            value: kecamatan,
                            child: Text('$kecamatan'),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget SetKelurahan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 250, 0),
              child: Text(
                "Kelurahan",
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
                  name: 'kelurahan',
                  decoration: InputDecoration(
                    // labelText: 'Kota',
                    fillColor: ColorPalette.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Pilih Kelurahan'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kelurahanOptions
                      .map((kelurahan) => DropdownMenuItem(
                            value: kelurahan,
                            child: Text('$kelurahan'),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget SetRtRw() => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 120, 10),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: Text(
                      'RT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'rt',
                    decoration: InputDecoration(
                      // labelText: 'RT',
                      fillColor: ColorPalette.grey,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text('Pilih RT'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rtOptions
                        .map((rt) => DropdownMenuItem(
                              value: rt,
                              child: Text('$rt'),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.20,
              height: 20.0,
            ),
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 80, 10),
                    // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                    child: Text(
                      'RWawdsawd',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'rw',
                    decoration: InputDecoration(
                      // labelText: 'RW',
                      fillColor: ColorPalette.grey,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text('Pilih RW'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rtOptions
                        .map((rw) => DropdownMenuItem(
                              value: rw,
                              child: Text('$rw'),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  ///
  Widget SetSimpan() => SizedBox(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              child: Text('Simpan'),
            )),
      );
  Widget SetKTP() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
        child: Row(
          children: [
            Flexible(
                child: Text(
              'KTP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            )),
            SizedBox(
              width: 80.20,
              // height: 20.0,
            ),
            Flexible(
              child: FormBuilderTextField(
                  // decoration: InputDecoration(
                  //     suffixIcon: Icon(Icons.date_range),
                  //     contentPadding: EdgeInsets.all(10),
                  //     labelText: "Tanggal Lahir",
                  //     fillColor: ColorPalette.grey,
                  //     filled: true,
                  //     border: OutlineInputBorder(
                  //         borderSide: BorderSide.none,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     hintText: "dd/MM/YYYY"),
                  name: 'ktp'),
            ),
            // SizedBox(
            //   width: 90.0,
            // ),
          ],
        ),
      );

  // Widget SetKTP() => SizedBox(
  //       // width: 370,
  //       child: Row(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(10, 15, 300, 0),
  //             child: Text(
  //               "KTP",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 15,
  //               ),
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           // Padding(
  //           //   // padding: EdgeInsets.all(5),
  //           //   child: FormBuilderTextField(name: 'ktp'),
  //           // ),
  //         ],
  //       ),
  //     );

  // Widget customRadio(String txt, int index) {
  //   return new OutlinedButton(
  //     onPressed: () {
  //       setState(() {
  //         selectedJK = index;
  //       });
  //       print(index);
  //     },
  //     child: Text(
  //       txt,
  //       style: TextStyle(
  //           color: (selectedJK == index) ? Colors.blue[100] : Colors.blue[400]),
  //     ),
  //     // style: RoundRangeSliderThumbShape(bo),
  //   );
  // }

  // Widget SetTempat() => SizedBox(
  //       width: 170,
  //       child: new TextField(
  //         cursorColor: Colors.black,
  //         decoration: new InputDecoration(
  //             hintText: "tanggerang",
  //             labelText: "Tempat",
  //             fillColor: ColorPalette.grey,
  //             filled: true,
  //             border: new OutlineInputBorder(
  //                 borderSide: BorderSide.none,
  //                 borderRadius: new BorderRadius.circular(20.0))),
  //       ),
  //     );

  // Widget SetTanggal() => SizedBox(
  //       width: 170,
  //       // Text("adasd");

  //       child: new TextField(
  //         cursorColor: Colors.black,
  //         decoration: new InputDecoration(
  //           suffixIcon: IconButton(
  //               onPressed: () => {
  //                     // showDatePicker(
  //                     //         context: context,
  //                     //         initialDate: DateTime.now(),
  //                     //         firstDate: DateTime(1900),
  //                     //         lastDate: DateTime(2222))
  //                     //     .then((date) {
  //                     //   setState(() {
  //                     //     _dateTime = date!;
  //                     //   });
  //                     // })
  //                   },
  //               icon: Icon(Icons.date_range)),
  //           // hintText: (_dateTime.toString()),
  //           labelText: "Tanggal",
  //           fillColor: ColorPalette.grey,
  //           filled: true,
  //           border: new OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //               borderRadius: new BorderRadius.circular(20.0)),
  //         ),
  //       ),
  //     );

  // Widget SetJalan() => SizedBox(
  //       width: 370,
  //       child: Column(
  //         // textBaseline: Text(""),
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(10.0),
  //             child: Text(
  //               "Jalan",
  //               textAlign: TextAlign.left,
  //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           new TextField(

  //             cursorColor: Colors.black,
  //             decoration: new InputDecoration(
  //                 hintText: "Jl. Raya Graha",
  //                 labelText: "Jalan",
  //                 fillColor: ColorPalette.grey,
  //                 filled: true,
  //                 border: new OutlineInputBorder(
  //                     borderSide: BorderSide.none,
  //                     borderRadius: new BorderRadius.circular(20.0))),
  //           ),
  //         ],
  //       ),
  //     );

  // Widget SetProvinsi() => SizedBox(
  //   width: 370,
  //   child: DropdownButton(
  //     // value: valueProvinsi,
  //     onChanged: (newValue) {
  //       setState(() {
  //         // valueProvinsi = newValue;
  //       });
  //     },
  //     items: listItem.map((valueItem) {
  //       return DropdownMenuItem(
  //         value: valueItem,
  //         child: Text(valueItem),
  //       );
  //     }).toList(),
  //   ),
  // );
}
