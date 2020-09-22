import 'package:flutter/material.dart';
import 'package:rest_countries/src/models/country.model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Country country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Country Detail'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ClipRRect(
            child: SvgPicture.network( country.flag)
          ),
        )
      ),
    );
  }
}