import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          child: FutureBuilder(
            future: _countries.getCountries(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:

                  return ListView(
                    children: snapshot.data.results.map<Widget>(( result ) {

                      return Column(
                        children: [

                          ListTile(
                            leading: Container(
                              width: 60.0,
                              height: 40.0,
                              child: ClipRRect(
                                child: SvgPicture.network( result.getFlag(),
                                height: 60.0,
                                width: 40.0,
                                fit: BoxFit.contain,
                                placeholderBuilder: (BuildContext context) => CircularProgressIndicator()
                                )
                              ),
                            ),
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
          ),
        ),
      )
    );
  }
}