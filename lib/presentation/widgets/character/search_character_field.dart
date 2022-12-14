import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';

class SearchCharacterField extends StatefulWidget {
  const SearchCharacterField({super.key});

  @override
  State<SearchCharacterField> createState() => _SearchCharacterFieldState();
}

class _SearchCharacterFieldState extends State<SearchCharacterField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _searchController,
        onChanged: (value) => context.read<CharacterBloc>().add(
              SearchCharacter(value: value),
            ),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
                context.read<CharacterBloc>().add(
                      const SearchCharacter(value: ""),
                    );
              },
              icon: const Icon(Icons.close, color: Colors.black87),
            ),
            contentPadding: const EdgeInsets.only(left: 8, top: 5, right: 8),
            hintStyle: bodyText2.copyWith(color: Colors.grey.shade800),
            hintText: "Search by name, element or type ...",
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            fillColor: Colors.white),
      ),
    );
  }
}
