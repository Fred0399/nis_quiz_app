import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nis_q_bank/logic/bloc/favorites/favorites_list_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/theme/colors.dart';

class FavIcon extends StatelessWidget {
  final Function()? onPress;
  const FavIcon({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesListBloc, FavoritesListState>(
      builder: (ctx, favState) {
        return IconButton(
          onPressed: onPress,
          icon: Icon(
            (favState is IsFavorite)
                ? Icons.star_rounded
                : Icons.star_border_rounded,
          ),
          color: CustomColors.iconColor,
          iconSize: 26.r,
        );
      },
    );
  }
}
