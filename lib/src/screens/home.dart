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
        bottom: false,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              _customText(context, 'Africa'),
              _buildCountries(context, 'africa'),
              _customText(context, 'Americas'),
              _buildCountries(context, 'americas'),
              _customText(context, 'Asia'),
              _buildCountries(context, 'asia'),
              _customText(context, 'Europe'),
              _buildCountries(context, 'europe'),
              _customText(context, 'Oceania'),
              _buildCountries(context, 'oceania'),
            ],
          ),
        ),
      )
    );
  }

  Widget _customText(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildCountries(BuildContext context, String region) {
    return FutureBuilder(
      future: _countries.getCountriesByRegion(region),
      builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:

            return Column(
              children: snapshot.data.results.map<Widget>(( result ) {
                return _buildListTile(result, context);
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

  Widget _buildListTile(Country result, BuildContext context) {
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