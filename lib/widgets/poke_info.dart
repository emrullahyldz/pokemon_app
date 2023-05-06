import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoRow('Name', pokemon.name),
            _buildInfoRow('Height', pokemon.height),
            _buildInfoRow('Weight', pokemon.weight),
            _buildInfoRow('Spawn Time', pokemon.spawnTime),
            _buildInfoRow('Weakness', pokemon.weaknesses),
            _buildInfoRow('Pre Evolution', pokemon.prevEvolution),
            _buildInfoRow('next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(', '),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value == null)
          Text(
            'Not Available',
            style: Constants.getPokeInfoTextStyle(),
          )
        else
          Text(
            value.toString(),
            style: Constants.getPokeInfoTextStyle(),
          ),
      ],
    );
  }
}
