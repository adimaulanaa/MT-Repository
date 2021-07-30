import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/theme/color.dart';

const String DataDiriBoxName = "BOX_Friends";

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
    BlocProvider.of<DashboardBloc>(context).add(GetDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<DataDiri>(DataDiriBoxName).listenable(),
        builder: (context, Box<DataDiri> box, _) {
          print(box.values.isEmpty);
          if (box.values.isEmpty)
            return Center(
              child: Text("No Data"),
            );
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              var currentDataDiri = box.getAt(index);
              return ListTile(
                title: Text(currentDataDiri!.name),
                subtitle: Text(currentDataDiri.jalan),
                leading: CircleAvatar(backgroundColor: ColorPalette.primary),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  child: Container(
                                    padding: EdgeInsets.all(32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            "Alamat Data Diri ------------------------------"),
                                        Text("Nama : " + currentDataDiri.name),
                                        Text("Jenis Kelamin : " +
                                            currentDataDiri.jenisKelamin),
                                        Text("Tempat : " +
                                            currentDataDiri.tempat),
                                        Text("Tanggal Lahir :" +
                                            currentDataDiri.tanggalLahir),
                                        Text(
                                            "Alamat KTP ------------------------------"),
                                        Text(
                                            "Jalan : " + currentDataDiri.jalan),
                                        Text("Provinsi : " +
                                            currentDataDiri.provinsiKtp),
                                        Text("Kota/kabupaten : " +
                                            currentDataDiri.kabupatenKtp),
                                        Text("Kecamatan : " +
                                            currentDataDiri.kecamatanKtp),
                                        Text("Kelurahan/Desa : " +
                                            currentDataDiri.desaKtp),
                                        Text("RT : " + currentDataDiri.rtKtp),
                                        Text("Rw : " + currentDataDiri.rwKtp),
                                        Text("  "),
                                        Text(
                                            "Alamat Tempat Tinggal------------------- "),
                                        Text("  "),
                                        Text("Provinsi : " +
                                            currentDataDiri.provinsiRumah),
                                        Text("Kota/kabupaten : " +
                                            currentDataDiri.kabupatenRumah),
                                        Text("Kecamatan : " +
                                            currentDataDiri.kecamatanRumah),
                                        Text("Kelurahan/Desa : " +
                                            currentDataDiri.desaRumah),
                                        Text("RT : " + currentDataDiri.rtRumah),
                                        Text("Rw : " + currentDataDiri.rwRumah),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.info)),
                    IconButton(
                        onPressed: () {
                          box.deleteAt(index);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
