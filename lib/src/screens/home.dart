import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:rest_countries/src/api/countries.api.dart';
import 'package:rest_countries/src/models/country.model.dart';

class Home extends StatelessWidget {

  final CountriesApi _countries = CountriesApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST Countries'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(padding: EdgeInsets.all(10.0),child: Text('EU (European Union)')),
              buildBloc(context, 'eu'),
              Container(padding: EdgeInsets.all(10.0),child: Text('EFTA (European Free Trade Association)')),
              buildBloc(context, 'efta'),
              Container(padding: EdgeInsets.all(10.0),child: Text('CARICOM (Caribbean Community)')),
              buildBloc(context, 'caricom'),
              Container(padding: EdgeInsets.all(10.0),child: Text('PA (Pacific Alliance)')),
              buildBloc(context, 'pa'),
              Container(padding: EdgeInsets.all(10.0),child: Text('AU (African Union)')),
              buildBloc(context, 'au'),
              Container(padding: EdgeInsets.all(10.0),child: Text('USAN (Union of South American Nations)')),
              buildBloc(context, 'usan'),
              Container(padding: EdgeInsets.all(10.0),child: Text('EEU (Eurasian Economic Union)')),
              buildBloc(context, 'eeu'),
              Container(padding: EdgeInsets.all(10.0),child: Text('AL (Arab League)')),
              buildBloc(context, 'al'),
              Container(padding: EdgeInsets.all(10.0),child: Text('ASEAN (Association of Southeast Asian Nations)')),
              buildBloc(context, 'asean'),
              Container(padding: EdgeInsets.all(10.0),child: Text('CAIS (Central American Integration System)')),
              buildBloc(context, 'cais'),
              Container(padding: EdgeInsets.all(10.0),child: Text('CEFTA (Central European Free Trade Agreement)')),
              buildBloc(context, 'cefta'),
              Container(padding: EdgeInsets.all(10.0),child: Text('NAFTA (North American Free Trade Agreement)')),
              buildBloc(context, 'nafta'),
              Container(padding: EdgeInsets.all(10.0),child: Text('SAARC (South Asian Association for Regional Cooperation)')),
              buildBloc(context, 'saarc'),
            ],
          ),
        ),
      )
    );
  }

  FutureBuilder<Result> buildBloc(BuildContext context, String bloc) {
    return FutureBuilder(
      future: _countries.getRegionalBloc(bloc),
      builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:

            return Column(
              children: snapshot.data.results.map<Widget>(( result ) {
                return buildColumn(result, context);
              }).toList(),
            );
            
            break;
          default:
            return Container(
              height: 500.0,
              child: Center(child: CircularProgressIndicator())
            ); 
            break;
        }
      },
    );
  }

  Column buildColumn(Country result, BuildContext context) {
    return Column(
      children: [

        ListTile(
          // leading: Hero(
          //   tag: result.name,
          //   child: Container(
          //     height: 30.0,
          //     width: 50.0,
          //     child: ClipRRect(
          //       child: SvgPicture.network( result.getFlag(),
          //       height: 30.0,
          //       width: 50.0,
          //       fit: BoxFit.contain,
          //       placeholderBuilder: (BuildContext context) => Container(
          //         padding: EdgeInsets.all(30.0),
          //         child: CircularProgressIndicator()
          //         )
          //       )
          //     ),
          //   ),
          // ),
          title: Text(result.name),
          subtitle: Text(result.capital),
          trailing: Icon(
            Icons.arrow_forward_ios
          ),
          onTap: () => Navigator.pushNamed(context, 'detail', arguments: result),
        ),
        Divider()
        
      ],
    );
  }
}