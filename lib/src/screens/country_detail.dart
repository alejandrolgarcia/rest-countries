import 'package:flutter/material.dart';
import 'package:rest_countries/src/models/country.model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Country country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Hero(
              tag: country.name,
              child: ClipRRect(
                child: SvgPicture.network(
                  country.flag,
                  height: 250.0,
                  fit: BoxFit.cover,
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: CircularProgressIndicator()
                    ),
                  )
                ), 
              ),
            ),
            
            SizedBox(height: 15.0),
            Text('Capital: ${country.capital}', style: Theme.of(context).textTheme.headline6),

            SizedBox(height: 10.0),
            Text('Nombre nativo: ${country.nativeName}', style: Theme.of(context).textTheme.headline6),

            SizedBox(height: 10.0),
            Text('Población: ${country.population}', style: Theme.of(context).textTheme.headline6),

            SizedBox(height: 10.0),
            Text('Continente: ${country.region}', style: Theme.of(context).textTheme.headline6),

            SizedBox(height: 10.0),
            Text('Sub región: ${country.subregion}', style: Theme.of(context).textTheme.headline6),

          ]
        )
      ),
    );
  }
}