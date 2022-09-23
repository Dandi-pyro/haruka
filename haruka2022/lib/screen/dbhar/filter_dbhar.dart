import 'package:flutter/material.dart';
import 'package:haruka2022/provider/dbhar_filter_provider.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/provider/dbhar_sorting_provider.dart';
import 'package:provider/provider.dart';

class FilterDbHar extends StatefulWidget {
  const FilterDbHar({super.key});

  @override
  State<FilterDbHar> createState() => _FilterDbHarState();
}

class _FilterDbHarState extends State<FilterDbHar> {
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
                      border: Border.all(color: Colors.black),
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
                    colorOrder1 = Colors.lightBlue.withOpacity(0.5);
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
                      border: Border.all(color: Colors.black),
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
                    colorOrder2 = Colors.lightBlue.withOpacity(0.5);
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
                      border: Border.all(color: Colors.black),
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
                    colorOrder3 = Colors.lightBlue.withOpacity(0.5);
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
                      border: Border.all(color: Colors.black),
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
                    colorOrder4 = Colors.lightBlue.withOpacity(0.5);
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
                      border: Border.all(color: Colors.black),
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
                    colorSort1 = Colors.lightBlue.withOpacity(0.5);
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
                      border: Border.all(color: Colors.black),
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
                    colorSort2 = Colors.lightBlue.withOpacity(0.5);
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
                dbHarSortingProvider.getDbHar(selectedSort, selectedOrder);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
              child: Column(
                children: [const Text("Apply", style: TextStyle(fontSize: 18))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
