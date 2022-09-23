import 'package:flutter/material.dart';
import 'package:haruka2022/model/dbhar_model.dart';
import 'package:haruka2022/provider/dbhar_filter_provider.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/provider/dbhar_sorting_provider.dart';
import 'package:provider/provider.dart';

class DbHarUser extends StatefulWidget {
  const DbHarUser({super.key});

  @override
  State<DbHarUser> createState() => _DbHarUserState();
}

class _DbHarUserState extends State<DbHarUser> {
  DbHarModel? listDbhar;

  @override
  void initState() {
    super.initState();
    listDbhar = Provider.of<DbHarProvider>(context, listen: false).dbHar;
  }

  final _formKey = GlobalKey<FormState>();

  final _minFrekuensiController = TextEditingController();
  final _maxFrekuensiController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _minFrekuensiController.dispose();
    _maxFrekuensiController.dispose();
  }

  String selectedWP = "WP1";

  Color colorWP1 = Colors.lightBlue.withOpacity(0.5);
  Color colorWP2 = Colors.white;
  Color colorWP3 = Colors.white;
  Color colorWP4 = Colors.white;
  Color colorWP5 = Colors.white;

  selectWP() {
    Color colorS = Colors.lightBlue.withOpacity(0.5);
    if (colorWP1 == colorS) {
      return "WP1";
    } else if (colorWP2 == colorS) {
      return "WP2";
    } else if (colorWP3 == colorS) {
      return "WP3";
    } else if (colorWP4 == colorS) {
      return "WP4";
    } else {
      return "WP5";
    }
  }

  List selectedIO = [0, 20];

  Color colorIO1 = Colors.lightBlue.withOpacity(0.5);
  Color colorIO2 = Colors.white;
  Color colorIO3 = Colors.white;
  Color colorIO4 = Colors.white;
  Color colorIO5 = Colors.white;
  Color colorIO6 = Colors.white;

  selectIO(String iO) {
    switch (iO) {
      case "IO<20":
        {
          return [0, 20];
        }

      case "20<IO<40":
        {
          return [20, 40];
        }
      case "40<IO<60":
        {
          return [40, 60];
        }
      case "60<IO<80":
        {
          return [60, 80];
        }
      case "80<IO<100":
        {
          return [80, 100];
        }
      case "IO>100":
        {
          return [100, 999999];
        }
      default:
        {
          return [];
        }
    }
  }

  List selectedBandwith = [0, 500];

  Color colorB1 = Colors.lightBlue.withOpacity(0.5);
  Color colorB2 = Colors.white;
  Color colorB3 = Colors.white;
  Color colorB4 = Colors.white;

  selectBandwith(String bandwidth) {
    switch (bandwidth) {
      case "BW<0.5k":
        {
          return [0, 500];
        }

      case "0.5k<BW<5k":
        {
          return [500, 5000];
        }
      case "5k<BW<50k":
        {
          return [5000, 50000];
        }
      case "BW>50k":
        {
          return [50000, 99999999];
        }
      default:
        {
          return [];
        }
    }
  }

  String selectedOrder = "bandwidth";

  Color colorOrder1 = Colors.lightBlue.withOpacity(0.5);
  Color colorOrder2 = Colors.white;
  Color colorOrder3 = Colors.white;
  Color colorOrder4 = Colors.white;
  selectOrder() {
    Color colorS = Colors.lightBlue.withOpacity(0.5);
    if (colorOrder1 == colorS) {
      return "bandwidth";
    } else if (colorOrder2 == colorS) {
      return "wp";
    } else if (colorOrder3 == colorS) {
      return "band";
    } else {
      return "indeks_overlap";
    }
  }

  String selectedSort = "asc";

  Color colorSort1 = Colors.lightBlue.withOpacity(0.5);
  Color colorSort2 = Colors.white;

  selectSort() {
    Color colorS = Colors.lightBlue.withOpacity(0.5);
    if (colorSort1 == colorS) {
      return "asc";
    } else {
      return "dsc";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dbHarSortingProvider = Provider.of<DbHarSortingProvider>(context);
    final dbHarFilterProvider = Provider.of<DbHarFilterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harmonization Data'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Filter'),
                            centerTitle: true,
                          ),
                          body: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Text(
                                    'Frequency Range :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: TextFormField(
                                      controller: _minFrekuensiController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: 'Minimum Frequency (kHz)',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Masukkan minimum frequency");
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: TextFormField(
                                      controller: _maxFrekuensiController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: 'Maximum Frequency (kHz)',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Masukkan maximum frequency");
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Text(
                                    'Work Package :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorWP1,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'WP1',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorWP1 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorWP2 = Colors.white;
                                          colorWP3 = Colors.white;
                                          colorWP4 = Colors.white;
                                          colorWP5 = Colors.white;
                                          selectedWP = selectWP();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorWP2,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'WP2',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorWP1 = Colors.white;
                                          colorWP2 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorWP3 = Colors.white;
                                          colorWP4 = Colors.white;
                                          colorWP5 = Colors.white;
                                          selectedWP = selectWP();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorWP3,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'WP3',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorWP1 = Colors.white;
                                          colorWP2 = Colors.white;
                                          colorWP3 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorWP4 = Colors.white;
                                          colorWP5 = Colors.white;
                                          selectedWP = selectWP();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorWP4,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'WP4',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorWP1 = Colors.white;
                                          colorWP2 = Colors.white;
                                          colorWP3 = Colors.white;
                                          colorWP4 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorWP5 = Colors.white;
                                          selectedWP = selectWP();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorWP5,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'WP5',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorWP1 = Colors.white;
                                          colorWP2 = Colors.white;
                                          colorWP3 = Colors.white;
                                          colorWP4 = Colors.white;
                                          colorWP5 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          selectedWP = selectWP();
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Text(
                                    'Index Overlap :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO1,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'IO<20',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorIO2 = Colors.white;
                                          colorIO3 = Colors.white;
                                          colorIO4 = Colors.white;
                                          colorIO5 = Colors.white;
                                          colorIO6 = Colors.white;
                                          selectedIO = selectIO('IO<20');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO2,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '20<IO<40',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 = Colors.white;
                                          colorIO2 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorIO3 = Colors.white;
                                          colorIO4 = Colors.white;
                                          colorIO5 = Colors.white;
                                          colorIO6 = Colors.white;
                                          selectedIO = selectIO('20<IO<40');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO3,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '40<IO<60',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 = Colors.white;
                                          colorIO2 = Colors.white;
                                          colorIO3 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorIO4 = Colors.white;
                                          colorIO5 = Colors.white;
                                          colorIO6 = Colors.white;
                                          selectedIO = selectIO('40<IO<60');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO4,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '60<IO<80',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 = Colors.white;
                                          colorIO2 = Colors.white;
                                          colorIO3 = Colors.white;
                                          colorIO4 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorIO5 = Colors.white;
                                          colorIO6 = Colors.white;
                                          selectedIO = selectIO('60<IO<80');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO5,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '80<IO<100',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 = Colors.white;
                                          colorIO2 = Colors.white;
                                          colorIO3 = Colors.white;
                                          colorIO4 = Colors.white;
                                          colorIO5 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorIO6 = Colors.white;
                                          selectedIO = selectIO('80<IO<100');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorIO6,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'IO>100',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorIO1 = Colors.white;
                                          colorIO2 = Colors.white;
                                          colorIO3 = Colors.white;
                                          colorIO4 = Colors.white;
                                          colorIO5 = Colors.white;
                                          colorIO6 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          selectedIO = selectIO('IO>100');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Text(
                                    'Bandwith :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorB1,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'BW<0.5k',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorB1 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorB2 = Colors.white;
                                          colorB3 = Colors.white;
                                          colorB4 = Colors.white;
                                          selectedBandwith =
                                              selectIO('BW<0.5k');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorB2,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '0.5k<BW<5k',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorB1 = Colors.white;
                                          colorB2 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorB3 = Colors.white;
                                          colorB4 = Colors.white;
                                          selectedBandwith =
                                              selectIO('0.5k<BW<5k');
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorB3,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            '5k<BW<50k',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorB1 = Colors.white;
                                          colorB2 = Colors.white;
                                          colorB3 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorB4 = Colors.white;
                                          selectedBandwith =
                                              selectIO('5k<BW<50k');
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorB4,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'BW>50k',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorB1 = Colors.white;
                                          colorB2 = Colors.white;
                                          colorB3 = Colors.white;
                                          colorB4 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          selectedBandwith = selectIO('BW>50k');
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          dbHarFilterProvider
                                              .getDbHar(
                                            selectedWP,
                                            selectedIO[0].toString(),
                                            selectedIO[1].toString(),
                                            selectedBandwith[0].toString(),
                                            selectedBandwith[1].toString(),
                                            _minFrekuensiController.text,
                                            _maxFrekuensiController.text,
                                          )
                                              .then((value) {
                                            listDbhar =
                                                dbHarFilterProvider.dbHar;
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepOrange),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("Apply",
                                              style: TextStyle(fontSize: 18))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Filter'),
                ),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        )),
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Text('Filter'),
                              centerTitle: true,
                            ),
                            body: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Center(
                                    child: Text(
                                      'Order Berdasarkan :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorOrder1,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Bandwith',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorOrder1 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorOrder2 = Colors.white;
                                          colorOrder3 = Colors.white;
                                          colorOrder4 = Colors.white;
                                          selectedOrder = selectOrder();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorOrder2,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Work Package',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorOrder1 = Colors.white;
                                          colorOrder2 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorOrder3 = Colors.white;
                                          colorOrder4 = Colors.white;
                                          selectedOrder = selectOrder();
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorOrder3,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Jenis Band',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorOrder1 = Colors.white;
                                          colorOrder2 = Colors.white;
                                          colorOrder3 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorOrder4 = Colors.white;
                                          selectedOrder = selectOrder();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorOrder4,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Index Overlap',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorOrder1 = Colors.white;
                                          colorOrder2 = Colors.white;
                                          colorOrder3 = Colors.white;
                                          colorOrder4 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          selectedOrder = selectOrder();
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Center(
                                    child: Text(
                                      'Metode Sorting :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorSort1,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Ascending',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorSort1 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          colorSort2 = Colors.white;
                                          selectedSort = selectSort();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorSort2,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: const Text(
                                            'Descending',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          colorSort1 = Colors.white;
                                          colorSort2 =
                                              Colors.lightBlue.withOpacity(0.5);
                                          selectedSort = selectSort();
                                          setState(() {});
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      dbHarSortingProvider
                                          .getDbHar(selectedSort, selectedOrder)
                                          .then((value) {
                                        listDbhar = dbHarSortingProvider.dbHar;
                                        Navigator.pop(context);
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepOrange),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text("Apply",
                                            style: TextStyle(fontSize: 18))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text('Sorting'),
                ),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final dbhar = listDbhar!.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(dbhar.idMaindata!),
                    ),
                    title: Text(dbhar.document!),
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: listDbhar!.data!.length),
          )
        ],
      ),
    );
  }
}
