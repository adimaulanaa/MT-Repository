import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/theme/color.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/theme/textstyle.dart';

class DataProfile extends StatefulWidget {
  DataProfile({Key? key}) : super(key: key);

  // bool get wantKeepAlive => true;

  @override
  _DataProfileState createState() => _DataProfileState();
}

class _DataProfileState extends State<DataProfile> {
  final _formkey = GlobalKey<FormBuilderState>();
  bool value = true;
  bool get wantKeepAlive => true;

  var provinsiOptions = ["Jakarta", "Bandung", "Banten"];
  var kotaOptions = ["Cengkareng", "Meruya", "Joglo"];
  var kecamatanOptions = ["Serpong Utara", "Pondok Aren"];
  var kelurahanOptions = ["Serpong Utara", "Pondok Aren"];
  var rtOptions = ["01", "02", "03", "04", "05"];
  var rwOptions = ["001", "002", "003", "004", "005"];

  // final _controllerjalan = new TextEditingController();
  final _controllerNama = new TextEditingController();
  final _controllerTempat = new TextEditingController();
  final _controllerTglLahir = new TextEditingController();
  final _controllerJalan = new TextEditingController();

  final _cgetJalan = new TextEditingController();

  // get provinsi => ;
  String Jk = '';
  String Prov = '';
  String Koka = '';
  String Kec = '';
  String Kel = '';
  String Rt = '';
  String Rw = '';
  // int aku2 = 0;
  String getNama = '';
  String getJln = '';
  String getProv = '';
  String getKoko = '';
  String getKec = '';
  String getKel = '';
  String getRt = '';
  String getRw = '';

  String test = '';

  clearText() {
    _controllerTglLahir.clear();
  }

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
          preferredSize: Size.fromHeight(130.0),
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
          children: [
            setNama(),
            setJK(),
            setTempatTanggal(),
            setJalan(),
            setKTP(),
            setProvinsi(),
            setKokap(),
            setKecamatan(),
            setKelurahan(),
            setRtRw(),
            setAlamat(),
            setSamaKTP(),

            /// get data
            getJalan(),
            getProvinsi(),
            getKokap(),
            getKecamatan(),
            getKelurahan(),
            getRtRw(),

            ///
            setSimpan(),
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

  Widget setNama() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 323, 0),
              child: Text(
                "Nama",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                // TextPalette.altTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 950,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
                child: FormBuilderTextField(
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      // labelText: "Nama",
                      fillColor: ColorPalette.grey,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Nama"),
                  name: 'nama',
                  onChanged: (nama) {
                    setState(() {
                      getNama = nama.toString();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget setJK() => Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 90, 0),
        // child: Center(
        // child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 180, 0),
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
            FormBuilderChoiceChip(
                alignment: WrapAlignment.spaceEvenly,
                // onChanged: (jen) {
                //   _controllerJk = jen;
                // },
                // decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                name: 'jeniskelamin',
                validator: FormBuilderValidators.required(context),
                options: [
                  'Laki-Laki',
                  'Perempuan',
                ]
                    .map((jk) => FormBuilderFieldOption(value: jk))
                    .toList(growable: false),
                onChanged: (jk) {
                  // Jk = jk.toString();
                  // print("jk $jk");
                  setState(() {
                    Jk = jk.toString();
                  });
                }),
          ],
        ),
        // ),
        // ),
      );

  Widget setTempatTanggal() => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 120, 10),
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
                    controller: _controllerTempat,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        // labelText: "Tempat",
                        fillColor: ColorPalette.grey,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Tempat"),
                    name: 'tempat',
                    onChanged: (tempat) {
                      setState(() {
                        Jk = tempat.toString();
                      });
                    },
                  ),
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
                    padding: const EdgeInsets.fromLTRB(0, 5, 80, 10),
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
                  FormBuilderDateTimePicker(
                    controller: _controllerTglLahir,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.date_range,
                          // date(),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                        // labelText: "Tanggal Lahir",
                        fillColor: ColorPalette.grey,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "DD/MM/YYYY"),
                    name: 'tglLahir',

                    // initialValue: DateTime.now(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  Widget setJalan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 323, 0),
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
                  controller: _controllerJalan,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      // labelText: "Nama",
                      fillColor: ColorPalette.grey,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Jalan"),
                  name: 'jalan',
                  onChanged: (jalan) {
                    setState(() {
                      getJln = jalan.toString();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget setKTP() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
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
            Expanded(
                child: Divider(
              color: Colors.black,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ))
          ],
        ),
      );

  Widget setProvinsi() => SizedBox(
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
                        Prov = provinsi.toString();
                      });
                      // Prov = provinsi.toString();
                    }),
              ),
            ),
          ],
        ),
      );

  Widget setKokap() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 265, 0),
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
                    onChanged: (kokap) {
                      setState(() {
                        Koka = kokap.toString();
                      });
                    }),
              ),
            ),
          ],
        ),
      );

  Widget setKecamatan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 300, 0),
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
                  onChanged: (kecamatan) {
                    setState(() {
                      Kec = kecamatan.toString();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget setKelurahan() => SizedBox(
        // width: 370,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 300, 0),
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
                  onChanged: (kelurahan) {
                    setState(() {
                      Kel = kelurahan.toString();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget setRtRw() => Padding(
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
                    onChanged: (rt) {
                      setState(() {
                        Rt = rt.toString();
                      });
                    },
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
                      'RW',
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
                    onChanged: (rw) {
                      setState(() {
                        Rw = rw.toString();
                      });
                    },
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

  Widget setAlamat() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
        child: Row(
          children: [
            Flexible(
                child: Text(
              'Alamat Tempat Tinggal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            )),
            SizedBox(
                // width: 5.0,
                // height: 20.0,
                ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Divider(
                  // color: Colors.black,
                  height: 30,
                ),
              ),
            ),
            // SizedBox(
            //   width: 40.0,
            // ),
          ],
        ),
      );

  Widget setSamaKTP() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
        child: FormBuilderCheckbox(
          name: 'sama_ktp',
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
            errorText: 'You must accept terms and conditions to continue',
          ),
          onChanged: (sama_ktp) {
            setState(() {
              if (sama_ktp == true) {
                print("Jalan: " + _controllerJalan.text);
                print("Provinsi: " + Prov);
                print("Kota/Kabupaten: " + Koka);
                print("Kecamatan: " + Kec);
                print("Kelurhan: " + Kel);
                print("RT: " + Rt);
                print("RW: " + Rw);

                _cgetJalan.text = _controllerJalan.text;
                getProv = Prov;
                getKoko = Koka;

                print("test" + _cgetJalan.text);
                print("test" + getProv);
              } else {
                print("salah");
              }
            });
          },
        ),
      );

  /// Get Data
  Widget getJalan() => SizedBox(
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
                  controller: _cgetJalan,
                  decoration: InputDecoration(
                      // labelText: "Nama",
                      fillColor: ColorPalette.grey,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Jalan "),
                  name: 'getJalan',
                ),
              ),
            ),
          ],
        ),
      );
  Widget getProvinsi() => SizedBox(
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
                  name: 'getProvinsi',
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
                  hint: Text('Pilih Provinsi $getProv'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: provinsiOptions
                      .map((getProvinsi) => DropdownMenuItem(
                            value: getProvinsi,
                            child: Text('$getProvinsi'),
                          ))
                      .toList(),
                  initialValue: Prov.toString(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getKokap() => SizedBox(
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
                  name: 'getKokap',
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
                    [FormBuilderValidators.required(context)],
                  ),
                  items: kotaOptions
                      .map((getKokap) => DropdownMenuItem(
                            value: getKokap,
                            child: Text('$getKokap'),
                          ))
                      .toList(),

                  initialValue: Koka.toString(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getKecamatan() => SizedBox(
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
                  name: 'getKecamatan',
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
                      .map((getKecamatan) => DropdownMenuItem(
                            value: getKecamatan,
                            child: Text('$getKecamatan'),
                          ))
                      .toList(),
                  initialValue: Kec.toString(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getKelurahan() => SizedBox(
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
                  name: 'getKelurahan',
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
                      .map((getKelurahan) => DropdownMenuItem(
                            value: getKelurahan,
                            child: Text('$getKelurahan'),
                          ))
                      .toList(),
                  initialValue: Kel.toString(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getRtRw() => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 230, 0),
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
                    name: 'getRt',
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
                        .map((getRt) => DropdownMenuItem(
                              value: getRt,
                              child: Text('$getRt'),
                            ))
                        .toList(),
                    initialValue: Rt.toString(),
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
                      'RW',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'getRw',
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
                        .map((getRw) => DropdownMenuItem(
                              value: getRw,
                              child: Text('$getRw'),
                            ))
                        .toList(),
                    initialValue: Rw.toString(),
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
  Widget setSimpan() => SizedBox(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _showData(context),
                );
              },
              child: Text('Simpan'),
            )),
      );

  Widget _showData(BuildContext context) {
    return new AlertDialog(
      title: const Text("Data Profile"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Nama: " + _controllerNama.text),
          Text("Nama: " + Jk),
          Text("Tempat: " + _controllerTempat.text),
          Text("Tempat: " + _controllerTglLahir.text),
          Text("Jalan: " + _controllerJalan.text),
          Text("Provinsi: " + Prov),
          Text("Kota/Kabupaten: " + Koka),
          Text("Kecamatan: " + Kec),
          Text("Kelurhan: " + Kel),
          Text("RT: " + Rt),
          Text("RW: " + Rw),
        ],
      ),
    );
  }
}
