// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glúten!',
                    settings.isGlutenFree,
                    (value) => setState(
                      (() => settings.isGlutenFree = value),
                    ),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settings.isLactoseFree,
                    (value) => setState(
                      (() => settings.isLactoseFree = value),
                    ),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settings.isVegan,
                    (value) => setState(
                      (() => settings.isVegan = value),
                    ),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas!',
                    settings.isVegetarian,
                    (value) => setState(
                      (() => settings.isVegetarian = value),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
