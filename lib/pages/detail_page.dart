import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_info.dart';
import 'package:pokedex/widgets/poke_name_type.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    String pokeBallImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeBallImageUrl)
        : _buildLandScapeBody(context, pokeBallImageUrl);
  }

  Scaffold _buildLandScapeBody(BuildContext context, String pokeBallImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(
        pokemon.type![0],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeNameType(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.25.sw,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInfo(pokemon: pokemon),
                    )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeBallImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(
        pokemon.type![0],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    pokeBallImageUrl,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0.12.sh,
                  child: PokeInfo(pokemon: pokemon),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
