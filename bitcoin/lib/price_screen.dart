import 'package:bitcoin/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override 
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String currentCurrency = "AUD";
  String BTCcurrency = "?";
  String ETHcurrency = "?";
  String LTCcurrency = "?";
  
  void initializeCoinvalues(String current) async {

    setState(() {
      BTCcurrency = "?";
      ETHcurrency = "?";
      LTCcurrency = "?";
    });
    CoinData coin = CoinData();
    List<double> allCurrencies = await coin.getCoinData(current);
    setState(() {
    currentCurrency = current;
    BTCcurrency = allCurrencies[0].toStringAsFixed(2);
    ETHcurrency = allCurrencies[1].toStringAsFixed(2);
    LTCcurrency = allCurrencies[2].toStringAsFixed(2);
    });
    return;
  }


  @override 
  void initState() {
    super.initState();
    createTextWidgets();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("🤑 Coin Ticker"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
                child: Text("1 BTC = $BTCcurrency $currentCurrency", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                ),
              ),

            ),

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
                child: Text("1 ETH = $ETHcurrency $currentCurrency", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                ),
              ),

            ),

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
                child: Text("1 LTC = $LTCcurrency $currentCurrency", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                ),
              ),

            ),

          ),
            ],
          ),
          
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex){
                  setState(() {
                    initializeCoinvalues(currenciesList[selectedIndex]);
                  });
              },
              children: allWidgets,
            ),
          ),
        ],
      ),
    );
  }
}