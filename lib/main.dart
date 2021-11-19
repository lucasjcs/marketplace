import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/factory/factory.dart';
import 'app/provider/graphql/client/client_graphql.dart';

import 'app/nu_app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  GetControllerFactory.create(ClientGraphQL());

  runApp(const NuApp());
}
