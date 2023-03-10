import 'package:currency_converter/models/convert.dart';
import 'package:currency_converter/models/currencies.dart';
import 'package:currency_converter/models/currencyRate.dart';
import 'package:currency_converter/services/httpservice.dart';
import 'package:flutter/material.dart';

import '../apiUtils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Future<CurrencyRate> rate;
  //late Future<Map> allCurrencies;
  // TextEditingController amountController = TextEditingController();
  // String dropdownValue1 = 'AUD';
  // String dropdownValue2 = 'AUD';
  // String answer = 'Converted Currency will be shown here :)';

  @override
  void initState() {
    // TODO: implement initState
    //rate = getRate();
    //allCurrencies = getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
      ),
      //Future Builder for Getting Exchange Rates
      body: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.all(10),
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/curr.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: FutureBuilder<CurrencyRate>(
                future: getRate(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: getCurrencies(),
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Convert Any Currency',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26),
                                    ),
                                    const SizedBox(height: 20),
                                    //TextFields for Entering USD
                                    TextFormField(
                                      key: const ValueKey('amount'),
                                      controller: ApiString.amountController,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Amount'),
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: DropdownButton<String>(
                                            value: ApiString.dropdownValue1,
                                            icon: const Icon(
                                                Icons.arrow_drop_down_rounded),
                                            iconSize: 24,
                                            elevation: 16,
                                            isExpanded: true,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black54,
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                ApiString.dropdownValue1 =
                                                newValue!;
                                              });
                                            },
                                            items: currSnapshot.data!.keys
                                                .toSet()
                                                .toList()
                                                .map<DropdownMenuItem<String>>(
                                                    (value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: const Text(
                                            'To',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: DropdownButton(
                                            value: ApiString.dropdownValue2,
                                            icon: const Icon(
                                                Icons.arrow_drop_down_rounded),
                                            iconSize: 24,
                                            elevation: 16,
                                            isExpanded: true,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black54,
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                ApiString.dropdownValue2 =
                                                value!;
                                              });
                                            },
                                            items: currSnapshot.data!.keys
                                                .toSet()
                                                .toList()
                                                .map<DropdownMenuItem>((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          ApiString.answer =
                                          '${ApiString.amountController
                                              .text} $ApiString.dropdownValue1 ${convert(
                                              snapshot.data!.rates!,
                                              ApiString.amountController.text,
                                              ApiString.dropdownValue1,
                                              ApiString
                                                  .dropdownValue2)} to $ApiString.dropdownValue2';
                                        });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme
                                                  .of(context)
                                                  .primaryColor)),
                                      child: const Text(
                                        'Convert',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      ApiString.answer,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
